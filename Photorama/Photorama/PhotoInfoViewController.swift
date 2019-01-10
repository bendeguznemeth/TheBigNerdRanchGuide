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
    @IBOutlet var favoriteButton: UIButton!
    
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
        
        photo.viewCount += 1
        viewCountLabel.text = "View count: \(photo.viewCount)"
        
        if photo.favorite {
            let heartImage = UIImage(named: "heart-red")
            favoriteButton.setBackgroundImage(heartImage, for: .normal)
        } else {
            let emptyHeartImage = UIImage(named: "empty-heart-red")
            favoriteButton.setBackgroundImage(emptyHeartImage, for: .normal)
        }
        
        saveChanges()
        
    }
    
    @IBAction func onHeartClick(_ sender: UIButton) {
        if photo.favorite != true {
            photo.favorite = true
            
            let heartImage = UIImage(named: "heart-red")
            sender.setBackgroundImage(heartImage, for: .normal)
        } else {
            photo.favorite = false
            
            let emptyHeartImage = UIImage(named: "empty-heart-red")
            sender.setBackgroundImage(emptyHeartImage, for: .normal)
        }
        
        saveChanges()
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
