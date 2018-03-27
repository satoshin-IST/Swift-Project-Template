//
//  UIImageViewAlamofireExtension.swift
//  XLProjectName
//
//  Created by XLAuthorName 
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage
import UIKit

extension UIImageView {
    public func setImageWithURL(_ url: String,
                                filter: ImageFilter? = nil,
                                placeholder: UIImage? = nil,
                                transition: ImageTransition = .noTransition,
                                completion: ((DataResponse<UIImage>) -> Void)? = nil) {
        // NOTE: エラーハンドリングとりあえず無し
        guard let imgURL = URL(string: url) else {
            return
        }
        af_setImage(withURL: imgURL,
                    placeholderImage: placeholder,
                    filter: filter,
                    imageTransition: transition,
                    completion: {
                        (response: DataResponse<UIImage>) in
                        if let error = response.result.error {
                            print(error.localizedDescription)
                        }
                        completion?(response)
        })
    }
}
