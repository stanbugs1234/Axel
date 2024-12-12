//
//  PostService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class PostService {
    static let shared = PostService()
    @Published var documentChanges = [DocumentChange]()
    
    //MARK: Upload Post
    func uploadPost(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        FirestoreConstants.PostCollection
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    //MARK: Upload Post Comment
    func uploadComment(caption: String, postId: String, userURL: String, userFullName: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "userFullName": userFullName,
                    "userURL": userURL,
                    "caption": caption,
                    "likes": 0,
                    "postId": postId,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        FirestoreConstants.PostCollection
            .document(postId)
            .collection("post_comments").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    //MARK: Upload Shared Posts as Post
    func uploadSharedPost(caption: String, postId: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "postId": postId,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        FirestoreConstants.PostCollection
            .document(postId)
            .collection("shared_post").document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    
    //MARK: Fetch All Posts
    func fetchPosts(completion: @escaping([Post]) -> Void) {
        FirestoreConstants.PostCollection
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                completion(posts)
            }
    }
    
    //MARK: Fetch Posts by Uid
    func fetchPosts(forUid uid: String, completion: @escaping([Post]) -> Void) {
        FirestoreConstants.PostCollection
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                completion(posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()  }))
            }
    }
    
    //MARK: Fetch Post by Post Id
    func fetchPostByPostId(postId: String, completion: @escaping([Post]) -> Void) {
        FirestoreConstants.PostCollection
            .whereField("id", isEqualTo: postId)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let posts = documents.compactMap({ try? $0.data(as: Post.self) })
                completion(posts.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()  }))
            }
    }
    
    
    //MARK: Fetch Post Comments by Post Id
    func fetchPostComments(postId: String, completion: @escaping([PostComment]) -> Void) {
        var postCollection = [PostComment]()
        
        FirestoreConstants.PostCollection
            .document(postId)
            .collection("post_comments")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { doc in
                    let postCollectionId = doc.documentID
                    
                    Firestore.firestore().collection("post_comments")
                        .document(postCollectionId)
                        .getDocument { snapshot, _ in
                            guard let postComments = try? snapshot?.data(as: PostComment.self) else {return}
                            postCollection.append(postComments)
                            
                            completion(postCollection)
                        }
                }
                
                let postComments = documents.compactMap({ try? $0.data(as: PostComment.self) })
                completion(postComments.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue()  }))
            }
    }
    
    //MARK: PostComments Count
    
    func fetchPostCommentsCount(postId: String, completion: @escaping(Int) -> Void) {
        FirestoreConstants.PostCollection
            .document(postId)
            .collection("post_comments")
            .getDocuments { snapshot, _ in
                guard let postCommentsCount = snapshot?.documents.count else {return}
                
                completion(postCommentsCount)
            }
    }
    
    
    func fetchUserCommentbyUid(forUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.UserCollection
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let user = documents.compactMap({ try? $0.data(as: User.self) })
            }
    }
}

//MARK: - Likes

extension PostService {
    func likePost(_ post: Post, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        let userLikesRef = FirestoreConstants.UserCollection
            .document(uid)
            .collection("user-likes")
        
        FirestoreConstants.PostCollection
            .document(postId)
            .updateData(["likes": post.likes + 1]) { _ in
                userLikesRef.document(postId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikePost(_ post: Post, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        guard post.likes > 0 else { return }
        
        let userLikesRef = FirestoreConstants.UserCollection
            .document(uid)
            .collection("user-likes")
        
        FirestoreConstants.PostCollection
            .document(postId)
            .updateData(["likes": post.likes - 1]) { _ in
                userLikesRef.document(postId).delete() { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikePost(_ post: Post, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = post.id else { return }
        
        FirestoreConstants.UserCollection
            .document(uid).collection("user-likes")
            .document(postId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
    
    func fetchLikedPosts(forUid uid: String, completion: @escaping([Post]) -> Void) {
        var posts = [Post]()
        
        FirestoreConstants.UserCollection
            .document(uid)
            .collection("user-likes")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                documents.forEach { doc in
                    let postId = doc.documentID
                    
                    FirestoreConstants.PostCollection
                        .document(postId)
                        .getDocument { snapshot, _ in
                            guard let post = try? snapshot?.data(as: Post.self) else {return}
                            posts.append(post)
                            
                            completion(posts)
                        }
                }
            }
    }
}

//MARK: PostComment Likes
extension PostService {
    func likePostComments(_ postComment: PostComment, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = postComment.postCommentId else { return }
        
        let userLikesRef = Firestore.firestore().collection("users")
            .document(uid)
            .collection("user-likes")
        
        FirestoreConstants.PostCommentsCollection
            .document(postId)
            .updateData(["likes": postComment.likes + 1]) { _ in
                userLikesRef.document(postId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    func unlikePost(_ postComment: PostComment, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = postComment.postCommentId else { return }
        guard postComment.likes > 0 else { return }
        
        let userLikesRef = FirestoreConstants.UserCollection
            .document(uid)
            .collection("user-likes")
        
        FirestoreConstants.PostCommentsCollection
            .document(postId)
            .updateData(["likes": postComment.likes - 1]) { _ in
                userLikesRef.document(postId).delete() { _ in
                    completion()
                }
            }
    }
    
    func checkIfUserLikePost(_ postComment: PostComment, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let postId = postComment.postCommentId else { return }
        
        FirestoreConstants.UserCollection
            .document(uid).collection("user-likes")
            .document(postId).getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                completion(snapshot.exists)
            }
    }
}
