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
            return true
        }

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            // deu merda
            return false
        }

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()

        return true
    }
}

