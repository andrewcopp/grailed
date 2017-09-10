//
//  AppDelegate.swift
//  Grailed
//
//  Created by Andrew Copp on 9/9/17.
//  Copyright © 2017 Andrew Copp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow()
        self.window?.makeKeyAndVisible()
        
        let dependencies: AppDependencies = AppDependencies()
        let configuration: AppConfiguration = AppConfiguration(dependencies: dependencies)
        
        self.window?.rootViewController = configuration.rootRouter.viewController()
        
        return true
    }

}

