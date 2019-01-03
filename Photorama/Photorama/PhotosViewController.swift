//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Németh Bendegúz on 2018. 12. 29..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchPhotos(method: .interestingPhotos)
        
    }
    
    @IBAction func onSegmentedControlClick(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.fetchPhotos(method: .interestingPhotos)
        case 1:
            self.fetchPhotos(method: .recentPhotos)
        default:
            break
        }
    }
    
    private func fetchPhotos(method: Method) {
        
        store.fetchPhotos(method: method) { (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                
                if let firstPhoto = photos.first {
                    self.updateImageView(for: firstPhoto)
                }
                
            case let .failure(error):
                print("Error fetching photos: \(error)")
            }
            
        }
    }
    
    private func updateImageView(for photo: Photo) {
        
        store.fetchImage(for: photo) { (imageResult) -> Void in
            
            switch imageResult {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error downloading image: \(error)")
            }
            
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
