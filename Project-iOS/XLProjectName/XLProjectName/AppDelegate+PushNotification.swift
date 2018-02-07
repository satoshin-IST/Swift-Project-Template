//
//  AppDelegate+PushNotification.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate {
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
//        if application.applicationState == .active {
//
//        } else if application.applicationState == .background || application.applicationState == .inactive {
//
//        }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    }
}
