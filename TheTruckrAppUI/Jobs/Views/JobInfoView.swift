//
//  JobInfoView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/18/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift



struct JobInfoView: View {
    let job: Job
    
    var body: some View {
        let jobPayToCurreny = job.jobPayRate.toCurrency()
                Form {
                    List {
                        Section{
                            HStack {
                                Text("Job : ")
                                    .fontWeight(.semibold)
                                Text(job.jobName)
                                
                            }
                            HStack {
                                Text("Customer : ")
                                    .fontWeight(.semibold)
                                Text(job.customerName)
                            }
                            
                            HStack {
                                Text("Location : ")
                                    .fontWeight(.semibold)
                                Text(job.jobAddressName)
                            }
                        } header: {
                            Text("Job Info")
                        }
                        .foregroundColor(.themeGreen)
                        
                        Section{
                            HStack {
                                Text("Job Pay Type : ")
                                    .fontWeight(.semibold)
                                
                                Text(job.jobPayType)
                            }
                            
                            HStack {
                                Text("Job Pay Rate : ")
                                    .fontWeight(.semibold)
                                Text("\(jobPayToCurreny)")
                            }
                        } header: {
                            Text("Job Pay Info")
                        }
                        
                        Section {
                            Text("Number of Orders : ")
                                .fontWeight(.semibold)
                        } header: {
                            Text("Order Info")
                        }
                        
                        Section {
                            Text("Number of Invoices : ")
                                .fontWeight(.semibold)
                        } header: {
                            Text("Invoice Info")
                        }
                    }
                }
        
        .navigationTitle("Job Info")
    }
}

struct JobInfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            JobInfoView(job: dev2.mockJob)
        }
    }
}
