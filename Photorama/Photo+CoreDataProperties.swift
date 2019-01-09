//
//  Photo+CoreDataProperties.swift
//  Photorama
//
//  Created by Németh Bendegúz on 2019. 01. 09..
//  Copyright © 2019. Németh Bendegúz. All rights reserved.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var dateTaken: NSDate?
    @NSManaged public var photoID: String?
    @NSManaged public var remoteURL: NSURL?
    @NSManaged public var title: String?
    @NSManaged public var viewCount: Int16

}
