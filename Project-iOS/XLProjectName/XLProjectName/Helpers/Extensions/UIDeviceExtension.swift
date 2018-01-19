//
//  UIDeviceExtension.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit
import KeychainAccess

extension UIDevice {
    
    fileprivate static let keychainKey = "device_id"
    fileprivate static let keychain = Keychain(service: UIApplication.bundleIdentifier)
    
    public static var uniqueID: String? {
        if let key = try? keychain.get(keychainKey),
            let _ = try? keychain.contains(keychainKey) {
            return key
        }
        
        if let vendor = UIDevice.current.identifierForVendor {
            let _ = try? keychain.set(vendor.uuidString, key: keychainKey)
            return vendor.uuidString
        }
        
        return nil
    }
}
