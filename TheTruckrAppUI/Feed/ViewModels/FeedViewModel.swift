//
//  FeedViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift


class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var postComments = [PostComment]()

    let userService = UserServiceHelper()
    
    init() {
        fetchPosts()
    }

    func fetchPosts() {
        PostService.shared.fetchPosts { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                    
                self.userService.fetchUser(withUid: uid) { user in
                    self.posts[i].user = user
                }
            }
        }
    }
    
    func fetchPostComments(postId: String, completion: @escaping ([PostComment]) -> Void) {
        Firestore.firestore().collection("posts").document(postId).collection("post_comments")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let postComment = documents.compactMap({
                    try? $0.data(as: PostComment.self) })
                completion(postComment)
            }
    }
}
