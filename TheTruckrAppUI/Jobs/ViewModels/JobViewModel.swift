//
//  JobViewModel.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/8/23.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class JobViewModel: ObservableObject {
    @Published var jobs = [Job]()
    @Published var searchText = ""
    
    let uid = UserService.shared.currentUser?.id
    
    var searchableJobs: [Job] {
        if searchText.isEmpty {
            return jobs
        } else {
            let loweredcasedQuery = searchText.lowercased()
            
            return jobs.filter({
                $0.jobName.lowercased()
                    .contains(loweredcasedQuery) ||
                $0.jobAddressName.lowercased().contains(loweredcasedQuery) ||
                $0.customerName.lowercased().contains(loweredcasedQuery)
            })
        }
    }
    
    let service = JobService()
    
    init() {
        fetchUserJobs(forUid: uid ?? "") { jobs in
            self.jobs = jobs
        }
    }
    
    //MARK: Fetch All Jobs
    func fetchAllJobs() {
        service.fetchJobs() { jobs in
            self.jobs = jobs
        }
    }
    
    //MARK: Fetch User Jobs by UID
    func fetchUserJobs(forUid uid: String, completion: @escaping ([Job]) -> Void) {
        Firestore.firestore().collection("jobs")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let jobs = documents.compactMap({
                    try? $0.data(as: Job.self)
                })
                completion(jobs)
            }
    }
    
    //MARK: Fetch User Job Count
    func fetchUserJobCount(forUid: String, completion: @escaping ([Job]) -> Void) {
        Firestore.firestore().collection("jobs")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let jobs = documents.count
            }
    }
    
    //MARK: Fetch Customer Jobs
    func fetchCustomerJobs(forUid: String, customerId: String, completion: @escaping([Job]) -> Void) {
        Firestore.firestore().collection("jobs")
            .whereField("uid", isEqualTo: uid)
            .whereField("customerId", isEqualTo: customerId)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else {return}
                let jobs = documents.compactMap({
                    try? $0.data(as: Job.self)
                })
                print("fetched jobs by customer mother fucker")
                
                let jobCount = documents.count
                
                print(jobCount)
                
                completion(jobs)
            }
    }
    
    //MARK: Fetch Customer Jobs Count
    func fetchCustomerJobsCount(forUid: String, customerId: String) {
        

            
    }
}
