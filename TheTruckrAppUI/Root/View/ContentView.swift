//
//  ContentView.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 1/16/24.
//

import SwiftUI

struct ContentView: View {
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
    }
}
