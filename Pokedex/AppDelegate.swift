//
//  AppDelegate.swift
//  Pokedex
//
//  Created by Juliano Nardon on 07/06/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        guard NSClassFromString("XCTest") == nil else {
            return false
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            return false
        }
        let window = UIWindow(frame: UIScreen.main.bounds)

        if ProcessInfo.processInfo.arguments.contains("UITests") {
            window.layer.speed = 100
        }

        self.window = window
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()

        return true
    }

}

