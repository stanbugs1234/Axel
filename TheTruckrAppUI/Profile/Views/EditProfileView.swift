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
    @ObservedObject var viewModel: AccountViewModel
    
    let user: User
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    //MARK: Change Profile Photo Section
                    CurrentUserProfileHeaderView(viewModel: viewModel, user: user)
                        .padding(.top)
                        .padding(.bottom, 30)
                    
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
                .scrollIndicators(.hidden)
                .navigationTitle("Edit Profile")
                .toolbarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: { presentationMode.wrappedValue.dismiss() }) {
                            Text("Cancel")
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: { presentationMode.wrappedValue.dismiss() }) {
                            Text("Save")
                        }
                    }
                    ToolbarItem(placement: .keyboard) {
                        DismissKeyboardButton()
                    }
                }
                
                .fontWeight(.medium)
            }
        }
        .foregroundStyle(.opposite)
    }
}

#Preview {
    NavigationStack {
        EditProfileView(viewModel: AccountViewModel(), user: MockData.users.first!)
    }
}

