//
//  URLRequestSetup.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2017 'XLOrganizationName'. All rights reserved.
//

import Foundation

/**
 *  By adopting URLRequestSetup a RouteType or PaginationRequstType is able to customize it right before sending it to the server.
 */
public protocol URLRequestSetup {
    func urlRequestSetup(urlRequest: NSMutableURLRequest)
}
