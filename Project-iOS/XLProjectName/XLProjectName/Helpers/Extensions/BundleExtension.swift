//
//  File.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018年 'XLOrganizationName'. All rights reserved.
//

import Foundation

extension Bundle {
    func readStringObject(_ key: String) -> String {
        return (object(forInfoDictionaryKey: key) as? String) ?? ""
    }
}
