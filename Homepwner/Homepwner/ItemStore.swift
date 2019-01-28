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
    
    let itemArchiveURL: URL? = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return documentsDirectories.first?.appendingPathComponent("items.archive")
    }()

    init() {
        if let itemArchiveURL = self.itemArchiveURL, let archivedItems = NSKeyedUnarchiver.unarchiveObject(withFile: itemArchiveURL.path) as? [Item] {
            allItems = archivedItems
        }
    }
    
    @discardableResult func createItem() -> Item {
        let newItem = Item(random: true)
        
        allItems.append(newItem)
        
        return newItem
    }
    
    func removeItem(_ item: Item) {
        if let index = allItems.index(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        let movedItem = allItems[fromIndex]
        allItems.remove(at: fromIndex)
        allItems.insert(movedItem, at: toIndex)
    }
    
    func saveChanges() -> Bool {
        if let url = self.itemArchiveURL {
            print("Saving items to: \(url.path)")
            
            return NSKeyedArchiver.archiveRootObject(allItems, toFile: url.path)
        } else {
            return false
        }
    }
    
}
