//
//  AppDelegate.swift
//  iOS_Training_Demo
//
//  Created by HaoLe on 5/15/19.
//  Copyright © 2019 HaoLe. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupDisplayTheme()
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let rootNav = UINavigationController(rootViewController: controller)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
        return true
    }
    
    func setupDisplayTheme() {
        UINavigationBar.appearance().tintColor = UIColor.red
        let navTitleTextAttributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0),
            NSAttributedString.Key.foregroundColor: UIColor.red
        ]
        UINavigationBar.appearance().titleTextAttributes = navTitleTextAttributes
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

