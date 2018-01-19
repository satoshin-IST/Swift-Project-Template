//
//  Manager.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import OperaSwift
import Alamofire
import KeychainAccess
import RxSwift

class NetworkManager: RxManager {

    static let singleton = NetworkManager(manager: SessionManager.default)

    override init(manager: Alamofire.SessionManager) {
        super.init(manager: manager)
        observers = [Logger() as OperaSwift.ObserverType]
    }

    override func response(_ requestConvertible: URLRequestConvertible) -> Single<OperaResult> {
        let response = super.response(requestConvertible)
        return SessionController.sharedInstance.refreshToken().flatMap { _ in response }.asSingle()
    }
}

final class Route {}

struct Logger: OperaSwift.ObserverType {
    func willSendRequest(_ alamoRequest: Alamofire.Request, requestConvertible: URLRequestConvertible) {
        debugPrint(alamoRequest)
    }
}
