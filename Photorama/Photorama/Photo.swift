//
//  Photo.swift
//  Photorama
//
//  Created by Németh Bendegúz on 2019. 01. 02..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//

import Foundation

class Photo {
    
    let title: String
    let remoteURL: URL
    let photoID: String
    let dateTaken: Date
    
    init(title: String, photoID: String, remoteURL: URL, dateTaken: Date) {
        self.title = title
        self.photoID = photoID
        self.remoteURL = remoteURL
        self.dateTaken = dateTaken
    }
}
