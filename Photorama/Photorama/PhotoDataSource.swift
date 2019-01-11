//
//  PhotoDataSource.swift
//  Photorama
//
//  Created by Németh Bendegúz on 2019. 01. 04..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class PhotoDataSource: NSObject, UICollectionViewDataSource {
    
    var shouldUseFavoritePhotos = false

    var photos = [Photo]()
    
    var photosOfInterest: [Photo] {
        return shouldUseFavoritePhotos ? favoritePhotos : photos
    }
    
    private var favoritePhotos: [Photo] {
        return photos.filter { (photo) -> Bool in
            return photo.favorite
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosOfInterest.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "PhotoCollectionViewCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! PhotoCollectionViewCell
        
        let photo = photos[indexPath.row]
        cell.photoDescription = photo.title
        
        return cell
    }
    
}
