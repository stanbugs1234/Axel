//
//  SelectJobListTripView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/22/23.
//

import SwiftUI

struct SelectJobListTripView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.editMode) var editMode
    @ObservedObject var viewModel: JobViewModel
    @State private var showNewCustomerView = false
    @State private var customerIsSelected = false
//    @State var selectedCustomers = [Customer]()
    @State var selectedCustomers = Set<UUID>()
    @State private var isEditing = false
    
    var body: some View {
        NavigationView{
            VStack {
//                HStack {
//                    Button {
//                        presentationMode.wrappedValue.dismiss()
//                    } label: {
//                        Text("Cancel")
//                            .foregroundColor(.black)
//                            .padding(.vertical, 8)
//                            .padding(.leading)
//                    }
//
//                    Spacer()
//
//                    Text("Select Customer")
//                        .fontWeight(.semibold)
//                        .foregroundColor(.black)
//                    //                    .padding(.horizontal)
//                        .padding(.vertical, 8)
//                        .padding(.trailing)
//
//                    Spacer()
//
//                    Button {
//                        showNewCustomerView.toggle()
//                    } label: {
//                        Image(systemName: "plus")
//                            .foregroundColor(.black)
//                            .padding(.trailing)
//                    }
//                }
                
                SearchBarView(text: $viewModel.searchText)
                    .padding()
                
                List {
//                ScrollView {
//            Z       LazyVStack {
                    ForEach(viewModel.searchableJobs, id:\ .jobId) { job in
                                Button {
                                    customerIsSelected = true
                                    presentationMode.wrappedValue.dismiss()
                                } label: {
                                    JobListRowView(job: job)
                                }
                                
                            
                        }

//                    }


                    Spacer()
//                }
                .navigationBarTitle("Selected \(selectedCustomers.count)")
                    //List Style
                    //Will need to change to tool bar
                .navigationBarItems(leading: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.leading)
                }),trailing: Button(action: {
                    isEditing.toggle()
                }, label: {
                    if self.isEditing {
                        Text("Done")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    } else {
                        Text("Edit")
                            .foregroundColor(.black)
                    }
                }))
                .listStyle(.inset)
                //Environment
                .environment(\.editMode, .constant(self.isEditing ? .active : .inactive))
                
                // animation
                .animation(.spring(), value: isEditing)
                .fullScreenCover(isPresented: $showNewCustomerView) {
                    CreateNewCustomerView()
                }
            }
                
            VStack(alignment: .center) {
                HStack {
                    Button {
                        showNewCustomerView.toggle()
                    } label: {
                        CreateNewButton(buttonText: "Create New Job")
                    }
                    .fullScreenCover(isPresented: $showNewCustomerView) {
                        CreateNewJobView()
                    }
                }
            }
            }
        }
    }
}

struct SelectJobListTripView_Previews: PreviewProvider {
    static var previews: some View {
        SelectJobListTripView(viewModel: JobViewModel())
    }
}
