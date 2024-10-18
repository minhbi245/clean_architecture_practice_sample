//
//  AppDelegate.swift
//  AwsomeChatRx
//
//  Created by khanhnvm-macbook on 23/6/24.
//

import UIKit
import Firebase
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else { return false }
        FirebaseApp.configure()
        Application.shared.configureLoginInterface(in: window)
        return true
    }
}
