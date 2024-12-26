//
//  ContentView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var homeViewModel: HomeViewModel
    @EnvironmentObject var updatedHomeViewModel: UpdatedHomeViewModel
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                    SplashScreenView()
            } else {
                LoginView()
            }
        }
    }
}

//MARK: Preview
#Preview {
    NavigationStack {
        ContentView()
            .preferredColorScheme(.dark)
            .environmentObject(HomeViewModel())
            .environmentObject(UpdatedHomeViewModel())
    }
}
