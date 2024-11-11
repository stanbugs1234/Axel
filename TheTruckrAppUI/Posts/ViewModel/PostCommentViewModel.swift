//
//  PostCommentViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/27/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class PostCommentViewModel:  ObservableObject {
    @Published var post: Post
    @Published var postComments = [PostComment]()
    @Published var didPostComment = false
    @Published var postCommentCount = Int()
    private var cancellables = Set<AnyCancellable>()
    
    private var service = PostService.shared
    let userService = UserService.shared
    
    init(post: Post) {
        self.post = post
        fetchPostComments(postId: post.id ?? "") { postComments in
            self.postComments = postComments
            self.postCommentCount = postComments.count
        }
    }
    
    func fetchPostComments(postId: String, completion: @escaping([PostComment]) -> Void) {
        service.fetchPostComments(postId: post.id ?? "") { postComments in
            self.postComments = postComments
        }
    }
}
