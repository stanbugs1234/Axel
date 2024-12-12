//
//  MockData.swift
//  AccordUI
//
//  Created by Stan Bugusky on 3/16/24.
//

import Foundation
import Firebase

struct MockData {
    //MARK: Mock Users
    static let users: [User] = [
        .init(  uid:"dn36JHwwu5YerAdctVuW9Insu372",
                fullname: "Stan Bugusky",
                email: "Stanbugs1234@icloud.com",
                coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                accountType: .driver,
                homeLocation: nil,
                workLocation: nil,
                profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2FC42E3FD9-85C8-47FC-BA93-8DBB318C304C?alt=media&token=a1b78c65-4af3-4525-8b65-769add5eb3ee"),
        
        .init(fullname: "Matt McMahon",
              email: "MMcMahon@RNGD.com",
              coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
              accountType: .driver,
              homeLocation: nil,
              workLocation: nil,
              profileImageUrl: ""),
        
    ]
    
    //MARK: Mock Posts
    static let posts: [Post] = [
        .init(
            id: "zGomuyoIPcuzQbs3VuXc",
            caption: "I love making Dev Items",
            timestamp: Timestamp(date: Date()),
            uid: "dn36JHwwu5YerAdctVuW9Insu372",
            likes: 10,
            user: User(uid: "dn36JHwwu5YerAdctVuW9Insu372",
                       fullname: "Stan Bugusky",
                       email: "Stanbugs1234@icloud.com",
//                       uid:"dn36JHwwu5YerAdctVuW9Insu372",
                       coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                       accountType: .driver,
                       homeLocation: nil,
                       workLocation: nil,
                       profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2FC42E3FD9-85C8-47FC-BA93-8DBB318C304C?alt=media&token=a1b78c65-4af3-4525-8b65-769add5eb3ee")),
    ]
    
    //MARK: Mock Post Comments
    static let mockPostComment: [PostComment] = [
        .init(
            postCommentId: "5zUddvEBSo0JLhr0pEUk",
            caption: "Merry Christmas",
            userFullName: "Stan Bugusky",
            userURL: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2F5D22D893-79D8-4697-A3A9-86364C05395B?alt=media&token=b9e84dc2-3782-42d1-ad0c-c88bdafbbc81",
            timestamp: Timestamp(date: Date()),
            postId: "sYIteUgUDgw8QoSecsJb",
            uid: "Mock POst Uid String",
            likes: 100,
            user: User(uid: "dn36JHwwu5YerAdctVuW9Insu372",
                       fullname: "Stan Bugusky",
                       email: "Stanbugs1234@icloud.com",
                       //                                   uid: NSUUID().uuidString,
                       coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                       accountType: .driver,
                       homeLocation: nil,
                       workLocation: nil,
                       profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2F5D22D893-79D8-4697-A3A9-86364C05395B?alt=media&token=b9e84dc2-3782-42d1-ad0c-c88bdafbbc81")
        )
    ]
    
    //MARK: Mock Chat
    
    static let mockChat: [Chat] = [
        .init(
            fromId: "1idmebZNQygUfyZ762BmD4CjUq43",
                                toId: "dn36JHwwu5YerAdctVuW9Insu372",
                                messageText: "Mock Chat Text",
                                timestamp: Timestamp(date: Date()),
                                user: User(uid: "dn36JHwwu5YerAdctVuW9Insu372",
                                           fullname: "Stan Bugusky",
                                           email: "Stanbugs1234@icloud.com",
                                           coordinates: GeoPoint(latitude: 29.9511, longitude: 90.0812),
                                           accountType: .driver,
                                           homeLocation: nil,
                                           workLocation: nil,
                                           profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/thetruckrapp.appspot.com/o/profile_image%2F5D22D893-79D8-4697-A3A9-86364C05395B?alt=media&token=b9e84dc2-3782-42d1-ad0c-c88bdafbbc81")
        )
    ]
    
}
