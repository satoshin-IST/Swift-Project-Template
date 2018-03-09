//
//  AppDelegate.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import UIKit
import Crashlytics

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupCrashlytics()

        //UIApplication.requestPermissionToShowPushNotification()
        //UIApplication.shared.registerForRemoteNotifications()
        PushNotificationModule.shared.registerForRemote()
        PushNotificationModule.shared.didFinishLaunching(options: launchOptions)
        return true
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
