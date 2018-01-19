//
//  AppDelegate+Configure.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import Fabric
import Crashlytics

extension AppDelegate {

    func setupCrashlytics() {
        Fabric.with([Crashlytics.self])
        Fabric.sharedSDK().debug = Constants.Debug.crashlytics
    }
    
    func setupGoogleAnalytics() {
        // TODO:
    }
}
