//
//  UserView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/22/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct UserView: View {
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(text: $exploreViewModel.searchText)
                .padding()
            ScrollView {
                LazyVStack {
                    ForEach(exploreViewModel.searchableUsers) { user in
                        NavigationLink {
                            UserDetailView(user: user)
                        } label: {
                            UserRowView(user: user)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Drivers")
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            UserView()
        }
    }
}
