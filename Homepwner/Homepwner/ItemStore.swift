//
//  ItemStore.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 10..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ItemStore {
    
    var allItems = [Item]()
    
//    init() {
//        for _ in 0..<5 {
//            createItem()
//        }
//    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
}
