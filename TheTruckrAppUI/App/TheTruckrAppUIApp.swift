//
//  TheTruckrAppUIApp.swift
//  TheTruckrAppUI
//
//  Created by Stan Bugusky on 4/10/23.
//

import SwiftUI
import Firebase
import FirebaseCore
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate{
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct TheTruckrAppUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var homeViewModel = HomeViewModel()
    @StateObject var tabViewModel = InboxViewModel()
    @StateObject var updatedHomeViewModel = UpdatedHomeViewModel()

    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
                .environmentObject(tabViewModel)
                .environmentObject(updatedHomeViewModel)
        }
    }
}
