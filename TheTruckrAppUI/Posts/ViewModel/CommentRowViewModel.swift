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
    
    let service = PostService.shared
    private var cancellables = Set<AnyCancellable>()
    
    init(postComment: PostComment) {
        self.postComment = postComment
        fetchUserByUid(forUid: postComment.uid) { user in
            self.postCommentUser = user
        }
    }
    
    private func setupPostCommentUsers() {
        service.$documentChanges.sink { [weak self] changes in
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
    
    func fetchUserByUid(forUid uid: String, completion: @escaping(User) -> Void) {
        FirestoreConstants.UserCollection
            .document(uid)
            .getDocument { snapshot, _ in
            guard let snapshot = snapshot else {return}
                
            guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
        }
    }
    
    func timeAgo(from timestamp: Date) -> String {
        let now = Date()
        let calendar = Calendar.current
        
        //calculate time difference components
        let components = calendar.dateComponents([.day, .hour, .minute, .second, .month,.year], from: timestamp, to: now)
        
        if let year = components.year, year > 0 {
            return "\(year) year\(year > 1 ? "s" : "") ago"
        } else if let month = components.month, month > 0 {
            return "\(month) month\(month > 1 ? "s" : "") ago"
        } else if let day = components.day, day > 0 {
            return "\(day) day\(day > 1 ? "s" : "") ago"
        } else if let hour = components.hour, hour > 0 {
            return "\(hour) hour\(hour > 1 ? "s" : "") ago"
        } else if let minute = components.minute, minute > 0 {
            return "\(minute) minute\(minute > 1 ? "s" : "") ago"
        } else if let second = components.second, second > 0 {
            return "\(second) second\(second > 1 ? "s" : "") ago"
        } else {
            return "Just now"
        }
    }
    
    func calculateTimebetweenTodaysDateAndPostDate(postComment: PostComment) -> String {
        let timestamp = postComment.timestamp.dateValue()
        
        let timeAgoText = timeAgo(from: timestamp)
        
        return timeAgoText
    }
}
