//
//  ImageStore.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 15..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ImageStore {
    
    private let cache = NSCache<NSString, UIImage>()
    
    func setImage(_ image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
    
    func image(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func deleteImage(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
