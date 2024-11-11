//
//  DriverListView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/9/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift


struct DriverListView: View {
//    @ObservedObject var viewModel = DriverViewModel()
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
//            VStack {
//                SearchBarView(text: $viewModel.searchText)
//                    .padding()
//                ScrollView {
//                    LazyVStack {
//                        ForEach(viewModel.searchableUsers) {
//                            driver in
//                            NavigationLink(value: <#T##Hashable?#>, label: <#T##() -> View#>)
//                        }
//                    }
//                }
//            }
        }
        .navigationTitle("Drviers")
    }
}

struct DriverListView_Previews: PreviewProvider {
    static var previews: some View {
        DriverListView()
    }
}
