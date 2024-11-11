//
//  Photo.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/18/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Photo: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var imageURLString = "" //THis will hold the URL for loading the image
    var description = ""
    var user = Auth.auth().currentUser?.email ?? ""
    var postedOn = Date()
    
    var dictionary: [String: Any] {
        return ["imageURLString" : imageURLString,
                "description": description,
                "user": user,
                "postedOn": Timestamp(date: Date())]
    }
}
