//
//  Routes.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit
import Compass

// MARK: - プロトコル

protocol RouteKeyable {
    // Compass が参照するURLスキーム用keyを設定
    static var key: String { get }
}

typealias CustomRoutable = Routable & RouteKeyable

// MARK: - サンプル実装

/**
 Compass + R-Swift を利用したルーター実装例
 
 以下のケース等での利用を推奨 (単純な画面遷移ならsegue利用を推奨)
 - DeepLink/Push通知時での画面遷移
 - パラメータ渡しがある画面遷移
 - 多階層ViewController間の遷移
 
 ```
 // パラメータつけてSampleDetailVCへ
 let articleID = "12345"
 Navigator.navigate(urn: Routes.sampleDetail(articleID).rawValue)
 ```
 
 参考記事
 https://bit.ly/2GyBtQK
 */
enum Routes {
    case sampleTop(String?)      // SampleTopVCへの遷移(パラメータ付き)
    case sampleDetail(String)   // SampleDetailVCへの遷移(パラメータ付き)
    case sampleLogin            // SampleLoginVCへの遷移
}

extension Routes: RawRepresentable {
    typealias RawValue = String
    
    init?(rawValue: RawValue) {
        self.init(rawValue: rawValue)
    }
    
    public var rawValue: String {
        switch self {
        case .sampleTop(let userID):
            let userID = userID ?? ""
            return "top:{\(userID)}"
        case .sampleDetail(let articleID):
            return "detail:{\(articleID)}"
        case .sampleLogin:
            return "login"
        }
    }
}

/**
 SampleTopViewControllerへの遷移例
 
 CustomRoutableに準拠する
 */
struct SampleTopRoute: CustomRoutable {
    static var key: String {
        return "top:{userID}"
    }
    func navigate(to location: Location, from currentController: CurrentController) throws {
        
        let navigationController = currentController as? UINavigationController
        
        guard let topVC = (navigationController.flatMap { (naviVC) -> SampleTopViewController? in
            return naviVC.viewControllers.filter { $0.isKind(of: SampleTopViewController.self) }.first as? SampleTopViewController
        }) else {
            Log.debug("スタックにSampleTopViewControllerが無いと困る")
            return
        }
        topVC.articleID = location.arguments["userID"]
        
       if let naviVC = navigationController {
            naviVC.popToViewController(topVC, animated: true)
        }
        
        if currentController.presentedViewController != nil {
            currentController.dismiss(animated: true, completion: nil)
        }
    }
}

/**
 SampleTopViewControllerへの遷移例
 
 CustomRoutableに準拠する
 */
struct SampleDetailRoute: CustomRoutable {
    static var key: String {
        return "detail:{articleID}"
    }
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let articleID = location.arguments["articleID"] else { return }
        guard let vc = R.storyboard.sampleRoutingStoryboard.sampleDetailViewController() else { return }
        vc.articleID = articleID
        if let currentVC = currentController as? UINavigationController {
            currentVC.pushViewController(vc, animated: true)
        }
    }
}

/**
 SampleTopViewControllerへの遷移例
 
 CustomRoutableに準拠する
 */
struct SampleLoginRoute: CustomRoutable {
    static var key: String {
        return "login"
    }
    func navigate(to location: Location, from currentController: CurrentController) throws {
        guard let vc = R.storyboard.sampleRoutingStoryboard.sampleLoginNavigationController() else { return }
        guard let topmostVC = currentController.topmostViewController else {
            return
        }
        topmostVC.present(vc, animated: true, completion: nil)
    }
}
