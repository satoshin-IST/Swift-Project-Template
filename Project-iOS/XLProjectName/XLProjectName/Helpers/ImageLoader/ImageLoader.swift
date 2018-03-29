//
//  ImageLoader.swift
//  XLProjectName
//
//  Created by XLAuthorName.
//  Copyright © 2018 'XLOrganizationName'. All rights reserved.
//

import Foundation
import Nuke

class ImageLoader {
    
    static let shared = ImageLoader()
    
    static var defaultConfig: URLSessionConfiguration {
        let config = URLSessionConfiguration.default
        let urlCache = Nuke.DataLoader.sharedUrlCache
        
        // `expires → max-age` の順にキャッシュを確認する

        // キャッシュ多用する
        config.requestCachePolicy = .returnCacheDataElseLoad
        return config
    }
    
//    let nuke = { () -> Nuke.Manager in
//
////        let loader = Nuke.Loader(loader: NukeAlamofirePlugin.DataLoader())
////        return Nuke.Manager(loader: loader, cache: Cache.shared)
//    }()
    
    
}
