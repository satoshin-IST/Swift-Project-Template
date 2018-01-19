//
//  SessionController.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
import Alamofire
import Crashlytics
import KeychainAccess
import OperaSwift
import RxSwift
import RealmSwift

class SessionController {
    static let sharedInstance = SessionController()
    fileprivate let keychain = Keychain(service: Constants.Keychain.serviceIdentifier)
    fileprivate init() { }

    // MARK: - Session variables
    var token: String? {
        get { return keychain[Constants.Keychain.sessionToken] }
        set { keychain[Constants.Keychain.sessionToken] = newValue }
    }

    // MARK: - Session handling
    func logOut() {
        clearSession()
        //TODO: Logout: App should transition to login / onboarding screen
    }

    func isLoggedIn() -> Bool {
        invalidateIfNeeded()
        return token != nil
    }

    func invalidateIfNeeded() {
        if token != nil && user == nil {
            clearSession()
        }
    }

    func refreshToken() -> Observable<String?> {
        //TODO: refresh session token if necessary
        return  Observable.just(nil)
    }

    // MARK: - User handling
    var user: User? {
        //TODO: CHANGE ME
        // This implementation just works if you will only have one User in the database all the time
        // If you might have more than one then you should implement something else like another object that saves a relation to the 'currentUser'.
        do {
            let realm = try RealmService.sharedInstance.createRealm()
            return realm.objects(User.self).first
        } catch {
            Crashlytics.sharedInstance().recordError(error as NSError)
            return nil
        }
    }

    // MARK: - Auxiliary functions
    func clearSession() {
        token = nil
        RealmService.sharedInstance.eraseAll()
//        Analytics.reset()
//        Analytics.registerUnidentifiedUser()
        Crashlytics.sharedInstance().setUserEmail(nil)
        Crashlytics.sharedInstance().setUserIdentifier(nil)
        Crashlytics.sharedInstance().setUserName(nil)
    }

    // MARK: - User observable
    fileprivate var userObserverToken: NotificationToken?

    lazy var userObservable: Observable<User> = {
        return Observable.create() { [unowned self] (subscriber: AnyObserver<User>) in
            let realm = RealmService.sharedInstance.defaultRealm
            let userResult = realm?.objects(User.self)
            self.userObserverToken = userResult?.addNotificationBlock { _ in
                if let user = self.user {
                    subscriber.onNext(user)
                }
            }
            return Disposables.create()
        }
    }()

    deinit {
        userObserverToken?.stop()
    }
}
