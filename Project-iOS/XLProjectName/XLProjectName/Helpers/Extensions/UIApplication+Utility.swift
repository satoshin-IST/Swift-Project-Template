//
//  UIApplication.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    public static var bundleIdentifier: String {
        guard let bundleID = Bundle.main.bundleIdentifier else { fatalError() }
        return bundleID
    }
    
    public static var buildVersion: String {
        guard let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else { fatalError() }
        return bundleVersion
    }
    
    public static var bundleName: String {
        guard let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String else { fatalError() }
        return bundleName
    }
    
    public static var appVersion: String {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { fatalError() }
        return appVersion
    }
    
    public static func requestPermissionToShowPushNotification() {
        let app = UIApplication.shared
        let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
        app.registerUserNotificationSettings(settings)
        app.registerForRemoteNotifications()
    }
}
