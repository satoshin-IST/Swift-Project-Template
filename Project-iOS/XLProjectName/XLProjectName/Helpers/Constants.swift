//
//  Constants.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import OperaSwift
import XLSwiftKit

struct Constants {

	struct Network {
        static let AuthTokenName = "Authorization"
        static let SuccessCode = 200
        static let successRange = 200..<300
        static let Unauthorized = 401
        static let NotFoundCode = 404
        static let ServerError = 500
        
        static var baseURL: URL {
            guard let url = URL(string: "https://api.github.com") else { fatalError() }
            return url
        }
    }

    struct Keychain {
        static let serviceIdentifier = UIApplication.bundleIdentifier
        static let sessionToken = "session_token"
        static let deviceToken = "device_token"
    }
    
    struct Formatters {
        
        static let debugConsoleDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
        }()
        
    }
    
    struct Debug {
        static let crashlytics = false
        static let jsonResponse = false
    }
}
