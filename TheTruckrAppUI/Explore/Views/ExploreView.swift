//
//  ExploreView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/27/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()

    var body: some View {
            VStack(alignment: .leading) {
                ScrollView {
                    SearchBarView(text: $viewModel.searchText)
                        .padding()
                    VStack {
                        ForEach(viewModel.searchableUsers) { user in
                            NavigationLink (value: user) {
                                UserRowMessageView(user: user)
                            }
                        }
                    }
                    .navigationDestination(for: User.self) { user in
                        UserDetailView(user: user)
                    }
                }
                .navigationBarTitle("Friends")
            }
        .padding(.bottom)
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        ExploreView()
    }
}
