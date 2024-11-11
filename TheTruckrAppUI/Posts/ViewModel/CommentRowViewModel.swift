//
//  CommentRowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/1/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class CommentRowViewModel: ObservableObject {
    @Published var postComments = [PostComment]()
    @Published var postComment: PostComment
    @Published var postCommentUser: User?
    
    //    @Published var postCommentUser: User
    
    private var cancellables = Set<AnyCancellable>()
    
    let userService = UserService.shared
    
    init(postComment: PostComment) {
        
        self.postComment = postComment
        fetchUserByUid(forUid: postComment.uid) { user in
            self.postCommentUser = user
        }
    }
    
    private func setupPostCommentUsers() {
        PostService.shared.$documentChanges.sink { [weak self] changes in
            self?.loadPostCommentUser(fromChanges: changes)
        }.store(in: &cancellables)
    }
    
    private func loadPostCommentUser(fromChanges changes: [DocumentChange]) {
        var postComments = changes.compactMap({ try? $0.document.data(as: PostComment.self) })
        
        for i in 0 ..< postComments.count {
            let postComment = postComments[i]
            
            UserService.fetchUser(withUid: postComment.uid) { user in
                postComments[i].user = user
                self.postComments.append(postComments[i])
            }
        }
    }
    
    func fetchUserByUid(forUid uid: String, completion: @escaping (User) -> Void) {
        FirestoreConstants.UserCollection.document(uid).getDocument { snapshot, _ in
            print("DEBUG: Did fetch Inidividual user from firestore")
            guard let snapshot = snapshot else {return}
            guard let user = try? snapshot.data(as: User.self) else {return}
            self.postCommentUser = user
        }
    }
}
