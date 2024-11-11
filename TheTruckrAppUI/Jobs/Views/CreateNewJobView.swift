//
//  CreateNewJobView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 5/14/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CreateNewJobView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var viewModel = UploadJobViewModel()
    
    @State private var jobName = ""
    @State private var customerName = ""
    @State private var jobAddress = ""
    let jobPayType = ["Per Hour", "Per Load"]
    @State private var selectedJobPayType = "Per Hour"
    @State private var jobPayAmount = 0.0
    
    @State var selectedUberLocation: UberLocation?
    @State private var showCustomerListView = false
    
    
    var body: some View {
        
        VStack{
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                }
                
                Spacer()
                
                Text("New Job")
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                //                    .padding(.horizontal)
                    .padding(.vertical, 8)
                
                Spacer()
                
                Button { viewModel.uploadJob(jobName: jobName,
                                             customerName: customerName, jobAddressName: jobAddress, jobPayType: selectedJobPayType, jobPayRate: jobPayAmount)} label: {
                    Text("Save")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(.black)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            Form {
                Section {
                    TextField("Enter Job Name", text: $jobName)
                    TextField("Enter Customer", text: $customerName)
                    Button {
                        showCustomerListView.toggle()
                    } label: {
                        Text("Enter Customer")
                    }

                    TextField("Enter Job Address", text: $jobAddress)
                } header: {
                    Text("Enter Job Information")
                }
                
                Section{
                    Picker("Enter Job Pay Type", selection: $selectedJobPayType) {
                        ForEach(jobPayType, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Choose Job Pay Type")
                }
                
                Section {
                    TextField("Enter Job Pay Amount", value: $jobPayAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Enter Pay Amount to Driver")
                }
            }
        }
        .onReceive(viewModel.$didUploadJob) {success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
        .fullScreenCover(isPresented: $showCustomerListView) {
            TripSelectActiveCustomerView()
        }
    }
    
    struct CreateNewJobView_Previews: PreviewProvider {
        static var previews: some View {
            CreateNewJobView(viewModel: UploadJobViewModel())
        }
    }
}


