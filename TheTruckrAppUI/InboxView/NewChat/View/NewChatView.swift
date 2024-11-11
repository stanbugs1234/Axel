//
//  NewMessageView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI

struct NewChatView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = NewChatViewModel()
    @Binding var selectedUser: User?
    @Environment(\.dismiss) var dismiss
  
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $viewModel.searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("Contacts")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
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
                        selectedUser = user
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Chat")
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

struct NewChatView_Previews: PreviewProvider {
    static var previews: some View {
        NewChatView(selectedUser: .constant(dev2.mockUser))
    }
}
