// بسم الله 
//  AppDelegate.swift
//  Beuti Service Provider
//
//  Created by Bassem Abbas on 9/5/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        setUpKeyboard()
        setRootView()
        setupFireBase()

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
}
