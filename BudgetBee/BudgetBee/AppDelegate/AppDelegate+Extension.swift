//
//  AppDelegate+Extension.swift
//  Beuti Service Provider
//
//  Created by omnia on 9/8/19.
//  Copyright © 2019 Ibtikar Technologies, Co. Ltd. All rights reserved.
//

import Foundation
import IQKeyboardManagerSwift
import Firebase
import GoogleSignIn
import UIKit

extension AppDelegate {

    func setUpKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarDoneBarButtonItemText = "done"
    }

    func setRootView() {
        var rootVC: UINavigationController?
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .white
        let userDefaults = UserDefaults.standard
        do {
            let currUser = try userDefaults.getObject(forKey: UserDefaultKeys.user.rawValue, castTo: UserModel.self)
            if currUser.userId != nil {
                rootVC = UINavigationController(rootViewController: HomeTabbarViewController())
            } else {
                rootVC = UINavigationController(rootViewController: HomeTabbarViewController())
            }
        } catch {
            rootVC = UINavigationController(rootViewController: HomeTabbarViewController())
        }
        self.window?.rootViewController = rootVC
        self.window?.makeKeyAndVisible()
    }

    
    func setupFireBase() {
        FirebaseApp.configure()
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return GIDSignIn.sharedInstance.handle(url)
    }
}
