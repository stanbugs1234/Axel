//
//  AddDriverListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/30/24.
//

import SwiftUI

struct AddDriverListView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = JobRequestViewModel()
    @Binding var selectedDriver: User?
    @Environment(\.dismiss) var dismiss
    
    let order: Order
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $viewModel.searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("Drivers")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                //ForEach
                ForEach(viewModel.searchableUsers) { user in
                    VStack {
                        HStack {
                            CircularProfileImageView(user: user, size: .small)

                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                    .onTapGesture {
                        selectedDriver = user
                        viewModel.sendJobRequest(requestorId: user.id, driverId: (selectedDriver?.uid)!, orderId: order.id)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Driver")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.themeGreen)
                }
            }
        }
    }
}

struct AddDriverView_Previews: PreviewProvider {
    static var previews: some View {
        AddDriverListView(selectedDriver: .constant(dev2.mockUser), order: dev2.mockOrder)
    }
}
