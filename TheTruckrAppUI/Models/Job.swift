//
//  Job.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/13/23.
//

import FirebaseFirestoreSwift
import Firebase
import FirebaseFirestore

enum jobState: Int, Codable, Hashable {
    //0- Active Jobs
    case activeJob
    //1 - Inactive Jobs
    case inactiveJob
    
    var title: String {
        switch self {
        case .activeJob:
            return "Active"
        case .inactiveJob:
            return "Inactive"
        }
    }
}

struct Job: Identifiable, Codable, Hashable {
    @DocumentID var jobId: String?
    let jobName: String
    let customerName: String
    let jobAddressName: String
    let jobPayType: String
    let jobPayRate: Double
    let uid: String
    let timestamp: Timestamp
    var jobState: jobState

    var id: String {
        return jobId ?? ""
    }
}
