//
//  RealmService.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class RealmService {

    static let shared = RealmService()
    
    private static let schemaVersion: UInt64 = 1

    fileprivate (set) var defaultRealm: Realm!

    fileprivate lazy var config = Realm.Configuration(schemaVersion: schemaVersion,
                                                      migrationBlock: { _, oldSchemaVersion in
                                                        // We haven’t migrated anything yet, so oldSchemaVersion == 0
                                                        if oldSchemaVersion < 1 {
                                                            // Nothing to do!
                                                            // Realm will automatically detect new properties and removed properties
                                                            // And will update the schema on disk automatically
                                                        }
    })

    fileprivate init() {
        do {
            defaultRealm = try Realm(configuration: config)
            printLog("Realm DB path: \(String(describing: config.fileURL))")
        } catch {
            printLog(error.localizedDescription)
        }
    }

    func createRealm() throws -> Realm {
        return try Realm(configuration: config)
    }
    
    func dropDB() throws {
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
    
    func find<T: Object>(_ type: T.Type, predicate: NSPredicate) -> Results<T> {
        return realmInstance().objects(type).filter(predicate)
    }
    
    func findFirst<T: Object>() -> T? {
        return findAll().first
    }
    
    func findLast<T: Object>() -> T? {
        return findAll().last
    }
    
    func findAll<T: Object>() -> Results<T> {
        return realmInstance().objects(T.self)
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
    
    func deleteAll() throws {
        let realm =  realmInstance()
        let allObjects = findAll()
        try realm.write {
            realm.delete(allObjects)
        }
    }

}
