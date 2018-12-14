//
//  ItemsTableViewController.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 10..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {
    
    var itemStore: ItemStore!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
        
    }
    
    @IBAction func addNewItem(_ sender: UIButton) {
        let newItem = itemStore.createItem()
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
    
    @IBAction func toggleEditingMode(_ sender: UIButton) {
        if isEditing {
            sender.setTitle("Edit", for: .normal)
            setEditing(false, animated: true)
        } else {
            sender.setTitle("Done", for: .normal)
            setEditing(true, animated: true)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemStore.allItems.count + 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == itemStore.allItems.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LastUITableViewCell", for: indexPath)
            cell.textLabel?.text = "No more items!"
            return cell
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell {
                let item = itemStore.allItems[indexPath.row]
                
                cell.nameLabel.text = item.name
                cell.serialNumberLabel.text = item.serialNumber
                cell.valueLabel.text = "$\(item.valueInDollars)"
                
                if item.valueInDollars < 50 {
                    cell.valueLabel.textColor = UIColor.green
                } else {
                    cell.valueLabel.textColor = UIColor.red
                }
                
                return cell
            } else {
                return UITableViewCell.init()
            }
        }
        
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == itemStore.allItems.count {
            return false
        } else {
            return true
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Remove", style: .destructive, handler: { (action) -> Void in
                                                self.itemStore.removeItem(item)
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
            })
            ac.addAction(deleteAction)
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row == itemStore.allItems.count {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if proposedDestinationIndexPath.row == itemStore.allItems.count {
            return sourceIndexPath
        } else {
            return proposedDestinationIndexPath
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Remove"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showItem":
            if let row = tableView.indexPathForSelectedRow?.row {
                let item = itemStore.allItems[row]
                if let detailViewController = segue.destination as? DetailViewController {
                    detailViewController.item = item
                }
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

}
