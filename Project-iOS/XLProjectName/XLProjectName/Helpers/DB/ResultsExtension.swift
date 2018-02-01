//
//  ResultsExtension.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018年 'XLOrganizationName'. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray() -> [T] {
        var array = [T]()
        for i in 0 ..< count {
            array.append(self[i])
        }
        return array
    }
    
}
