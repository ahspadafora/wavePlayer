//
//  AppDelegate.swift
//  WavePlay
//
//  Created by Amber Spadafora on 5/1/17.
//  Copyright © 2017 Amber Spadafora. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let defaults = UserDefaults.standard

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        window = UIWindow()
        
        let tabBar = TabBarController()
        let loginVC = LogInViewController()
        
        if defaults.value(forKey: "fid") == nil {
            window?.rootViewController = loginVC
        } else {
            window?.rootViewController = tabBar
        }
        
        window?.makeKeyAndVisible()
        
        return true
    }


}

