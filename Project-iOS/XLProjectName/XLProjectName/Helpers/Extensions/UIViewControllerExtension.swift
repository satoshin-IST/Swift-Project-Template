//
//  UIViewControllerExtension.swift
//  XLProjectName
//
//  Created by XLAuthorName
//  Copyright © 2018 XLOrganizationName. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    var topmostViewController: UIViewController? {
        if let vc = self as? UINavigationController {
            return vc.topViewController?.topmostViewController
        }
        
        if let vc = self as? UITabBarController {
            return vc.selectedViewController?.topmostViewController
        }
        
        if let vc = self.presentedViewController {
            return vc.topmostViewController
        }
        
        return self
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
