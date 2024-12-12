//
//  HomeViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/15/23.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine
import MapKit
import FirebaseStorage

class GreetingViewModel: NSObject, ObservableObject {
    //MARK: Greeting Message
    var greetingMessage: String {
        let hour = Calendar.current.component(.hour, from: Date())
        if hour < 12 { return "Good morning, " }
        if hour < 18 { return "Good afternoon, " }
        return "Good evening, "
    }
}

