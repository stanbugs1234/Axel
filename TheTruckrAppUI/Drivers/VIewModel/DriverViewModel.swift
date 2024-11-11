//
//  DriverViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/9/23.
//

import Firebase
import FirebaseFirestore
import FirebaseStorage
import FirebaseFirestoreSwift

struct DriverService {
    
//   func fetchDrivers(withUId id: String, completion: @escaping(User) -> Void ) {
//        Firestore.firestore()().collection("users")
//            .document(id)
//            .getDocument { snapshot, _ in
//                guard let snapshot = snapshot else { return }
//                
//                guard let user = try? snapshot.data(as: User.self) else {return}
//                
//                print("DEBUG: fetch User with Driver Service")
//                completion(user)
//            }
//    }
    
//    func fetchDrivers() {
//        Firestore.firestore().collection("users")
//            .whereField("accountType", isEqualTo: AccountType.driver.rawValue)
//            .getDocuments { snapshot, _ in
//                guard let documents = snapshot?.documents else { return }
//                let drivers = documents.compactMap({ try? $0.data(as: User.self) })
//                self.drivers = drivers
//                
//                //print("DEBUG: Drivers \(drivers)")
//            }
//    }
}
