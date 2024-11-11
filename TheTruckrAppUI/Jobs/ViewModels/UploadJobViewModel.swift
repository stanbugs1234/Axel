//
//  UploadJobViewModelk.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/8/23.
//

import Firebase

class UploadJobViewModel: ObservableObject {
    @Published var didUploadJob = false
    let service = JobService()
    
    func uploadJob(jobName: String, customerName: String, jobAddressName: String, jobPayType: String, jobPayRate: Double) {
        service.uploadJob(jobName: jobName,
                          customerName: customerName,
                          jobAddressName: jobAddressName,
                          jobPayType: jobPayType,
                          jobPayRate: jobPayRate) { success in
            if success {
                self.didUploadJob = true
            } else {
                print("Job did not fucking up load for some crazy ass reason")
            }
        }
    }
}
