//
//  roomInt_appApp.swift
//  roomInt-app
//
//  Created by Dicky Buwono on 09/11/21.
//

import SwiftUI
import Firebase

@main
struct roomInt_appApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var session = SessionService.shared
    @StateObject var appState = AppState.shared
    
    var body: some Scene {
        WindowGroup {
            if let user = session.user {
                if user.isDesainer {
                    DesignerView()
                }else {
                    CustomerView()
                }
            } else {
                OnBoardingBridge()
                    .environmentObject(UserAuth())
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {

        FirebaseApp.configure()
        SessionService.shared.setup()

        return true
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

    }
}
