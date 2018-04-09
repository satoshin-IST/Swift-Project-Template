//
//  AppDelegate+URL.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit
import Compass

extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        try? Navigator.navigate(url: url)
        return true
    }
}
