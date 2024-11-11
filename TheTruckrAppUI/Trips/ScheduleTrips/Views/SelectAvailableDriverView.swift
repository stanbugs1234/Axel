//
//  SelectAvailableDriverView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 6/10/23.
//

import SwiftUI

struct SelectAvailableDriverView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var exploreViewModel = ExploreViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                    
                    Spacer()
                    
                    Text("Select Driver")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    //                    .padding(.horizontal)
                        .padding(.vertical, 8)
                        .padding(.trailing)
                    
                    Spacer()
                    
                }
                SearchBarView(text: $exploreViewModel.searchText)
                    .padding()
                ScrollView {
                    LazyVStack {
                        ForEach(exploreViewModel.searchableUsers) { user in
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            UserRowView(user: user)
                        }

                        }
                    }
                }
            }
        }
    }
}

struct SelectAvailableDriverView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAvailableDriverView()
    }
}
