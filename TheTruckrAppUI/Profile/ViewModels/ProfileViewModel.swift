//
//  ProfileViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var posts = [Post]()
    @Published var likedPosts = [Post]()
    
    private let service = PostService()
    private let userService = UserServiceHelper()
    let user: User
    
    init(user: User) {
        self.user = user
        self.fetchUserPosts()
        self.fetchLikedPosts()
    }
    
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Add Friend"
    }
    
    var actionButtonTitleSelected: String {
        return "Friend Request Sent"
    }
    
    func posts(forFilter filter: MessageFilterViewModel) -> [Post] {
        switch filter {
        case .messages:
            return posts
        case .replies:
            return posts
        case .likes:
            return likedPosts
        }
    }
    
    func fetchUserPosts() {
        guard let uid = user.uid else { return }
        service.fetchPosts(forUid: uid) { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                self.posts[i].user = self.user
            }
        }
    }
    
    func fetchLikedPosts() {
        guard let uid = user.uid else { return }
        
        service.fetchLikedPosts(forUid: uid) { posts in
            self.likedPosts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.userService.fetchUser(withUid: uid) { user in
                    self.likedPosts[i].user = user
                }
            }
        }
    }
}
