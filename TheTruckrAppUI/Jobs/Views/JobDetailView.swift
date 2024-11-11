//
//  JobDetailView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/13/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

struct JobDetailView: View {
    let job: Job
    
    var body: some View {
        let abbreviatedName = initials(from: job.customerName)
        
        VStack {
            //MARK: 
            ZStack {
                Circle()
                    .frame(width: 65, height: 65, alignment: .leading)
                    .foregroundColor(.gray)
                
                Text(abbreviatedName!)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.leading)
            
            VStack() {
                HStack(spacing: 5) {
                    Text(job.customerName)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .foregroundColor(.themeGreen)
                
                HStack(spacing: 5) {
                    Text(job.jobName)
                        .font(.subheadline)
                }
                .padding(.top,3)
                
                HStack {
                    //                            Text("Status: ")
                    //                                .fontWeight(.semibold)
                    //                                .font(.headline)
                    //
                    Text(job.jobState.title)
                    
                }
            }
            .padding(3)
            .padding(.leading)
            
            //option list
            Section {
                VStack {
                    List {
                        ForEach(JobDetailViewModel.allCases) { viewModel in
                            NavigationLink(value: viewModel) {
                                JobDetailOptionView(viewModel: viewModel)
                                    .padding(.top, 13)
                            }
                        }
                    }
                    .navigationDestination(for: JobDetailViewModel.self) { viewModel in
                        switch viewModel {
                        case .info:
                            JobInfoView(job: job)
                        case .trips:
                            Text("Trips")
                        case .tickets:
                            Text("Tickets")
                        case .invoices:
                            Text("Invoices")
                        case .scheduleTrips:
                            ScheduleTripView()
                        case .locations:
                            Text("Locations")
                        }
                    }
                }
            }
        }
        .navigationTitle("Job Details")
    }
}

struct JobDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            JobDetailView(job: dev2.mockJob)
        }
    }
}
