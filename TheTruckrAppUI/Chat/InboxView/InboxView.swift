//
//  InboxView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/15/24.
//

import SwiftUI
import Kingfisher

struct InboxView: View {
    @StateObject var viewModel = InboxViewModel()
    @State private var showNewMessageView = false
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            List {
                //MARK: Active Now View
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                
                //MARK: For Each of Recent Messages
                ForEach(viewModel.recentMessages) { chat in
                    ZStack {
                        NavigationLink(value: chat) {
                            EmptyView()
                            
                        }.opacity(0.0)
                        
                        InboxRowView(message: chat)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            //            .onChange(of: selectedUser, perform: { value in
            //                showChat = value != nil
            //            })
            
            .onChange(of: selectedUser, initial: false, {
                showChat = selectedUser != nil
            })
            .navigationDestination(for: Chat.self, destination: { chat in
                if let user = chat.user {
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route {
                case .profile(let user):
                    AccountView(user: user)
                case.chatView(let user):
                    ChatView(user: user)
                }
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser {
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView, content: {
                NewChatView(selectedUser: $selectedUser)
            })
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    if let user {
                        NavigationLink(value: Route.profile(user)) {
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewMessageView.toggle()
                        selectedUser = nil
                    } label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(.opposite, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        InboxView()
    }
}

