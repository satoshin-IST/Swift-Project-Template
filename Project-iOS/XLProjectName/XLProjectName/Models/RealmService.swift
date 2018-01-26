//
//  RealmService.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
import UIKit
import Crashlytics
import RealmSwift

class RealmService {

    static let shared = RealmService()

    fileprivate(set) var defaultRealm: Realm!

    fileprivate var config = Realm.Configuration()

    fileprivate init() {
//        config.schemaVersion = 1
//        config.migrationBlock = { migration, oldSchemaVersion in
//             Perform migrations when needed
//            if oldSchemaVersion == 1 {
//                 ...
//            }
//        }

        do {
            defaultRealm = try Realm(configuration: config)
            printLog("Realm DB path: \(String(describing: config.fileURL))")
        } catch error {
            // TODO: ErrorをNSErrorに丁寧に変換するExtensionを追加する
            let nserror = error as NSError
            Crashlytics.sharedInstance().recordError(nserror)
        }
    }

    func createRealm() throws -> Realm {
        return try Realm(configuration: config)
    }
    
    func deleteAll<T: Object>(_ modelType: T.Type) throws {
        let realm = try createRealm()
        try realm.write {
            let allObjects = realm.objects(modelType)
            realm.delete(allObjects)
        }
    }
    
    func drop() throws {
        let realm = try createRealm()
        try realm.write {
            realm.deleteAll()
        }
    }
}

extension Object {
    
    /** Must be called from main thread **/

    fileprivate func realmInstance() -> Realm {
        return self.realm ?? RealmService.shared.defaultRealm
    }
    
    func edit(_ hundler: (() -> Void) ) throws {
        let realm = realmInstance()
        try realm.write {
            hundler()
        }
    }
    
    func insert() throws {
        let realm = realmInstance()
        try realm.write {
            realm.add(self)
        }
    }
    
    func update() throws {
        let realm = realmInstance()
        try realm.write {
            realm.add(self, update: true)
        }
    }
    
    func delete() throws {
        let realm = realmInstance()
        try realm.write {
            realm.delete(self)
        }
    }
}
