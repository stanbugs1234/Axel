//
//  JobService.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/8/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct JobService {
    
    func uploadJob(jobName: String, customerName: String, jobAddressName: String, jobPayType: String, jobPayRate: Double, completion: @escaping(Bool)-> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let data = [
            "jobName": jobName,
            "customerName": customerName,
            "jobAddressName": jobAddressName,
            "jobPayType": jobPayType,
            "jobPayRate": jobPayRate,
            "uid": uid,
            "jobState": Int(0),
            "timestamp": Timestamp(date: Date())] as [String : Any]
        
    
        Firestore.firestore().collection("jobs").document()
            .setData(data) {error in
                if let error = error {
                    print("DEBUG: Failed to upload job with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                completion(true)
            }
    }
    
    func fetchJobs(completion: @escaping([Job]) -> Void) {
        Firestore.firestore().collection("jobs")
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                
                let jobs = documents.compactMap({ try? $0.data(as: Job.self) })
                print("DEBUG: Fetching Jobs")
                completion(jobs)
            }
    }
    
    func fetchUserJobs(forUid uid: String, completion: @escaping ([Job]) -> Void) {
        Firestore.firestore().collection("jobs")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let jobs = documents.compactMap({
                    try? $0.data(as: Job.self)
                })
                completion(jobs)
            }
    }
    
    func fetchUserJobs( completion: @escaping ([Job]) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().collection("jobs")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let jobs = documents.compactMap({
                    try? $0.data(as: Job.self)
                })
                completion(jobs)
            }
    }
}
