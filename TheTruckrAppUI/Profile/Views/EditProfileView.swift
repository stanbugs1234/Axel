//
//  EditProfileView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/4/23.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel : AuthViewModel
    
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.themeGreen)
                }
                
                Spacer()
                
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Save")
                        .foregroundColor(.themeGreen)
                }
                .buttonStyle(.bordered)
            }
            .padding()
            
            //MARK: Change Profile Photo Section
            UserProfileSelectorView(user: user)
            
            VStack {
                List {
                    ForEach(EditProfileViewModel.allCases) {
                        viewModel in
                        NavigationLink(value: viewModel) {
                            EditProfileOptionRowView(viewModel: viewModel)
                                .padding(.top, 13)
                        }
                    }
                    .navigationDestination(for: EditProfileViewModel.self) { viewModel in
                        switch viewModel {
                        case .company:
                            Text("Company")
                        }
                    }
                }
                Spacer()
            }
        }
        .navigationTitle("Edit Profile")
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(user: dev2.mockUser)
                .environmentObject(AuthViewModel())
        }
    }
}
