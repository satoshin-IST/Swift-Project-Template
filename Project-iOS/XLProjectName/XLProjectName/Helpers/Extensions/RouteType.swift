//
//  RouteType.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import OperaSwift
import Alamofire

extension RouteType {

    var baseURL: URL { return Constants.Network.baseURL }
    var manager: ManagerType { return NetworkManager.singleton  }
    var retryCount: Int { return 0 }
}

extension URLRequestParametersSetup {
    public func urlRequestParametersSetup(_ urlRequest: NSMutableURLRequest, parameters: [String: AnyObject]?) -> [String: AnyObject]? {
        var params = parameters ?? [:]
        if let token = SessionController.sharedInstance.token {
            params[Constants.Network.AuthTokenName] = token as AnyObject?
        }
        return params
    }
}

extension URLRequestSetup {

    func urlRequestSetup(urlRequest: NSMutableURLRequest) {
        // setup url
    }
}
