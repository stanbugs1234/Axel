//
//  ServicesView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 12/19/24.
//

import SwiftUI

struct ServicesView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            HStack {
                Text("Go Anywhere, get anything")
                Spacer()
            }
                
                HStack {
                    //MARK: Buttons - Reserve
                    ForEach(ServicesEnum.allCases){ option in
                        ServicesCardRowView(viewModel: option)
                    }
                }
        }
        .padding()
        .navigationTitle(Text("Services"))
    }
}

#Preview {
    NavigationStack {
        ServicesView()
            .environmentObject(HomeViewModel())
    }
}
