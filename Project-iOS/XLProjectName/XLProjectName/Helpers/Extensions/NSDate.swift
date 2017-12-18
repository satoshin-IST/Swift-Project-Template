//
//  NSDate.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation

extension Date {

    func dblog() -> String {
        return Constants.Formatters.debugConsoleDateFormatter.string(from: self)
    }

}
