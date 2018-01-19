//
//  DEBUGHelper.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
//import XLSwiftKit

func printLog(_ message: String, file: String = #file, line: Int = #line, function: String = #function) {
    #if DEBUG
        //        let fileURL = NSURL(fileURLWithPath: file)
        //        let fileName = fileURL.deletingPathExtension?.lastPathComponent ?? ""
        //        print("\(Date().dblog()) \(fileName)::\(function)[L:\(line)] \(message)")
    #endif
    //    // Nothing to do if not debugging
}

func printJson(_ value: AnyObject) {
    #if DEBUG
        //        if Constants.Debug.jsonResponse {
        ////            print(JSONStringify(value))
        //        }
    #endif
}
