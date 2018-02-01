//
//  RealmTests.swift
//  XLProjectNameTests
//
//  Created by XLAuthorName
//  Copyright © 2018年 'XLOrganizationName'. All rights reserved.
//

import XCTest
import RealmSwift
import Quick
import Nimble
@testable import XLProjectName

class RealmTests: QuickSpec {
    
    override func spec() {
    
        describe("Realm関連処理のテスト") {
            // テスト環境用のrealmを生成(開発環境とは別)
            let realm = RealmProvider.realm()
            
            beforeEach {
                // モックデータを作成
                let user = User()
                user.email = "email@email.com"
                user.username = "ジョン・スミス"
                try! user.insert(realm)
                
                let user2 = User()
                user2.email = "email2@email2.com"
                user2.username = "ジョン・ドゥ"
                try! user2.insert(realm)
            }
            
            describe("RealmHelper", closure: {
                
                it("全件取得したら2件であること", closure: {
                    let users = RealmHelper.findAll(User.self, realm)
                    expect(users?.count).to(equal(2))
                })
                
                it("最初の1件が取得できること", closure: {
                    let user = RealmHelper.findFirst(User.self, realm)
                    expect(user?.username).to(equal("ジョン・スミス"))
                })
                
                it("最後の1件が取得できること", closure: {
                    let user = RealmHelper.findLast(User.self, realm)
                    expect(user?.username).to(equal("ジョン・ドゥ"))
                })
                
                it("全件削除できること", closure: {
                    try! RealmHelper.deleteAll(User.self, realm)
                    let users = RealmHelper.findAll(User.self, realm)
                    expect(users?.count).to(equal(0))
                })

            })
            
            describe("ObjectExtension", closure: {
                
                it("1件のレコードを新規追加できること", closure: {
                    let username = "イヴァン・イヴァノヴィチ"
                    let user = User()
                    user.email = "email3@email3.com"
                    user.username = username
                    try! user.insert(realm)
                    let predicate = NSPredicate("username", equal: username as AnyObject)
                    let result = RealmHelper.find(User.self, predicate: predicate, realm: realm)?.toArray()
                    expect(result?.first?.username).to(equal(username))
                })
                
                it("1件のレコードが更新ができること", closure: {
                    let updateName = "ハンス・シュミット"
                    let user = RealmHelper.findFirst(User.self, realm)
                    try! user?.edit(realm, {
                        user?.username = updateName
                    })
                    let predicate = NSPredicate("username", equal: updateName as AnyObject)
                    let result = RealmHelper.find(User.self, predicate: predicate, realm: realm)?.toArray()
                    expect(result?.first?.username).to(equal(updateName))
                })
                
                it("1件のレコードを削除できること", closure: {
                    let beforeCount = RealmHelper.findAll(User.self, realm)?.count ?? 0
                    let user = RealmHelper.findFirst(User.self, realm)
                    try! user?.delete(realm)
                    let afterCount = RealmHelper.findAll(User.self, realm)?.count
                    expect(afterCount).to(equal(beforeCount-1))
                })
            })
        }
    }
    
}
