//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var nameField: UITextField!
    @IBOutlet var serialNumberField: UITextField!
    @IBOutlet var valueField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item?
    
    private let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let item = self.item {
            nameField.text = item.name
            serialNumberField.text = item.serialNumber
            //        valueField.text = "\(item.valueInDollars)"
            //        dateLabel.text = "\(item.dateCreated)"
            valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
            dateLabel.text = dateFormatter.string(from: item.dateCreated)
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
