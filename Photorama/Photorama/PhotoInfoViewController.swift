//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Németh Bendegúz on 2019. 01. 06..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var viewCountLabel: UILabel!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
        
        incrementViewCount()
        
        viewCountLabel.text = "View count: \(photo.viewCount)"
        
        saveChanges()
        
    }
    
    private func incrementViewCount() {
        if photo.viewCount >= 1 {
            photo.viewCount += 1
        } else {
            photo.viewCount = 1
        }
    }
    
    private func saveChanges() {
        do {
            try store.persistentContainer.viewContext.save()
        } catch {
            print("Saving failed, Error: \(error)")
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showTags":
            let navController = segue.destination as! UINavigationController
            let tagController = navController.topViewController as! TagsTableViewController
            
            tagController.store = store
            tagController.photo = photo
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
}
