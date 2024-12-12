//
//  MessageRowViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/25/23.
//

import Foundation

class MessageRowViewModel: ObservableObject {
    @Published var post: Post
    @Published var postComments = [PostComment]()
    @Published var postCommmentCount = Int()
    
    let service = PostService.shared
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
        service.fetchPostCommentsCount(postId: post.id ?? "") { count in
            self.postCommmentCount = count
        }
        
    }
    
    func likePost() {
        service.likePost(post) {
            self.post.didLike = true
        }
    }
    
    func unlikePost() {
        service.unlikePost(post) {
            self.post.didLike = false
        }
    }
    
    func checkIfUserLikedPost() {
        service.checkIfUserLikePost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
    
    func fetchPostCommentsCount(postId: String) {
        service.fetchPostCommentsCount(postId: postId) { count in
            self.postCommmentCount = count
        }
    }
    
    func fetchPostComments(postId: String) {
        service.fetchPostComments(postId: postId) { postComments in
            self.postComments = postComments
        }
    }
    
    func sharePost() {
        print("Share Post")
    }
}
