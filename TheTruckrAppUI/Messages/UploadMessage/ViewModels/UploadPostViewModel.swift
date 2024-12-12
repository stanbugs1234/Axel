//
//  UploadPostViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import Firebase

class UploadPostViewModel: ObservableObject {
    @Published var didUploadPost = false
    @Published var didUploadComment = false
    let service = PostService.shared
    
    func uploadPost(withCaption caption: String) {
        service.uploadPost(caption: caption) { success in
            if success {
                self.didUploadPost = true
                
            } else {
                // show error message to user....
            }
        }
    }
    func uploadComment(withCaption caption: String, postId: String, userFullName: String, userURL: String) {
        service.uploadComment(caption: caption, postId: postId, userURL: userURL, userFullName: userFullName) { success in
            if success {
                self.didUploadComment = true
            } else {
                //show error message to user
            }
        }
    }
    
    func uploadSharedPost(withCaption caption: String, postId: String) {
        service.uploadSharedPost(caption: caption, postId: postId) { success in
            if success {
                self.didUploadPost = true
            } else {
                //show error message to user
            }
        }
    }
}
