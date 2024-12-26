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
    
    //MARK: Fetch Vendors by Categories
    func fetchVendorsByCategory(forVendorId vendorUid: String, serviceCategory: Int, completion: @escaping([Vendor]) -> Void) {
        FirestoreConstants.VendorCollection
            .document(vendorUid)
            .collection("services")
            .whereField("serviceCategory", isEqualTo: serviceCategory)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let vendors = documents.compactMap({
                    try? $0.data(as: Vendor.self) })
                completion(vendors)
                
            }
    }
    
    //MARK: Fetch Vendor Services
    func fetchVendorServiceCategories(forUid vendorUid: String, completion: @escaping([Services]) -> Void) { FirestoreConstants.VendorCollection
            .document(vendorUid)
            .collection("services")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let services = documents.compactMap({ try? $0.data(as: Services.self) })
                completion(services)
            }
    }
    
    
    //MARK: Likes
    func likeVendor(_ vendor: Vendor, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let vendorId = vendor.vendorId else { return }
        
        let userLikesRef = FirestoreConstants.UserCollection
            .document(uid)
            .collection("vendor-likes")
        
        FirestoreConstants.VendorCollection
            .document(vendorId)
            .updateData(["likes": vendor.likes + 1]) { _ in
                userLikesRef.document(vendorId).setData([:]) { _ in
                    completion()
                }
            }
    }
    
    //MARK: Unlike Vendor
    func unlikeVendor(_ vendor: Vendor, completion: @escaping() -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let vendorId = vendor.vendorId else { return }
        guard vendor.likes > 0 else { return }
        
        let userLikesRef = FirestoreConstants.UserCollection
            .document(uid)
            .collection("vendor-likes")
        
        FirestoreConstants.VendorCollection
            .document(vendorId)
            .updateData(["likes": vendor.likes - 1]) { _ in
                userLikesRef.document(vendorId).delete() { _ in
                    completion()
                }
            }
    }
    
    //MARK: Check if User Liked Vendor
    func checkIfUserLikedVendor(_ vendor: Vendor, completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let vendorId = vendor.vendorId else {return}
        
        FirestoreConstants.UserCollection
            .document(uid)
            .collection("vendor-likes")
            .document(vendorId)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else {return}
                completion(snapshot.exists)
            }
    }
    
    
    
    
    //MARK: Old Stuff
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

