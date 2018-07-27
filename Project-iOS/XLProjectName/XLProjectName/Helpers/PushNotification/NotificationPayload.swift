//
//  ConstTarget.swift
//  XLProjectName
//
//  Created by XLAuthorName.
//  Copyright © 2018年 'XLOrganizationName'. All rights reserved.
//

import Foundation
//import Unbox

struct NotificationPayload {
    
//    private var aps: NotificationAPS
    
    init?(userInfo: [AnyHashable: Any]) {
//        guard let apsDic = userInfo["aps"] as? UnboxableDictionary else {
            return nil
//        }
//        do {
//            self.aps = try unbox(dictionary: apsDic)
//
//        } catch {
//            return nil
//
//        }
    }
}

//struct NotificationAPS: Unboxable {
//    var alert: String
//    var sound: String
//    var contentAvailable: Int
//    var priority: Int
//    var badge: Int
//
//    init(unboxer: Unboxer) throws {
//        self.alert = try unboxer.unbox(key: "alert")
//        self.sound = try unboxer.unbox(key: "sound")
//        self.contentAvailable = try unboxer.unbox(key: "content-available")
//        self.priority = try unboxer.unbox(key: "priority")
//        self.badge = try unboxer.unbox(key: "badge")
//    }
//}
