//
//  VendorService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/14/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct VendorService {
    
    func uploadVendor(vendorFullName: String, vendorCompanyId: String, vendorAddressName: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = ["vendorFullName": vendorFullName,
                    "vendorCompanyId": vendorCompanyId,
                    "vendorAddressName": vendorAddressName,
                    "uid": uid,
                    "vendorState": 0,
                    "timestamp": Timestamp(date: Date())] as [String : Any]
        
        
        Firestore.firestore().collection("vendors")
            .document()
            .setData(data) { error in
                if let error = error {
                    print("DEBUG: Faild to upload customer with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchVendors(completion: @escaping([Vendor]) -> Void) {
        Firestore.firestore().collection("vendors")
            .getDocuments { snapshot,  _ in
                guard let documents = snapshot?.documents else {return}
                
                let vendors = documents.compactMap({ try? $0.data(as: Vendor.self) })
                print("DEBUG: Fetching Vendors")
                completion(vendors)
                }
            }
    func fetchVendors(forUid uid: String, completion: @escaping([Vendor]) -> Void) {
        Firestore.firestore().collection("vendors")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let vendors = documents.compactMap({
                    try? $0.data(as: Vendor.self) })
                completion(vendors)
                }
            }
    
}

