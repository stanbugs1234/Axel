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
    
    init(post: Post) {
        self.post = post
        checkIfUserLikedPost()
        PostService.shared.fetchPostCommentsCount(postId: post.id ?? "") { count in
            self.postCommmentCount = count
        }
    }
    
    func likePost() {
        PostService.shared.likePost(post) {
            self.post.didLike = true
        }
    }
    
    func unlikePost() {
        PostService.shared.unlikePost(post) {
            self.post.didLike = false
        }
    }
    
    func checkIfUserLikedPost() {
        PostService.shared.checkIfUserLikePost(post) { didLike in
            if didLike {
                self.post.didLike = true
            }
        }
    }
    
    func fetchPostCommentsCount(postId: String) {
        PostService.shared.fetchPostCommentsCount(postId: postId) { count in
            self.postCommmentCount = count
        }
    }
    
    func fetchPostComments(postId: String) {
        PostService.shared.fetchPostComments(postId: postId) { postComments in
            self.postComments = postComments
        }
    }
    
    func sharePost() {
        print("Share Post")
    }
}
