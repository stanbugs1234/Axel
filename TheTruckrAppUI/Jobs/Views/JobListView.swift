//
//  JobListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/10/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct JobListView: View {
    @ObservedObject var viewModel = JobViewModel()
    @State private var showNewJobView = false
    
    var body: some View {
            VStack{
                //MARK: Search Bar
                SearchBarView(text: $viewModel.searchText)
                    .padding()
                
                //MARK: List View
                List{
//                    ScrollView {
//                        LazyVStack(alignment: .leading) {
                            ForEach(viewModel.searchableJobs) { job in
                                NavigationLink(value: job) {
                                    JobListRowView(job: job)
                                }
                            }
//                        }
//                    }
                }
                .navigationDestination(for: Job.self, destination: { job in
                    JobDetailView(job: job)
                })
                
                //Add New Customer Button
                VStack(alignment: .center) {
                    HStack {
                        Button {
                            showNewJobView.toggle()
                        } label: {
                            CreateNewButton(buttonText: "Create New Job")
                        }
                        .fullScreenCover(isPresented: $showNewJobView) {
                            CreateNewJobView(viewModel: UploadJobViewModel())
                        }
                    }
                }
            }
            .navigationDestination(for: Job.self, destination: { job in
                JobDetailView(job: job)
            })
//            .onAppear(perform: viewModel.fetchUserJobs(forUid: uid))
            
        .navigationTitle("Jobs")

    }
}

struct JobListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            JobListView()
        }
    }
}
