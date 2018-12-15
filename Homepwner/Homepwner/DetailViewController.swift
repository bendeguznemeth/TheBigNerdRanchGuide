//
//  DetailViewController.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 13..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nameField: CustomTextField!
    @IBOutlet var serialNumberField: CustomTextField!
    @IBOutlet var valueField: CustomTextField!
    @IBOutlet var dateLabel: UILabel!
    
    var item: Item? {
        didSet{
            navigationItem.title = item?.name
        }
    }
    
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
            valueField.text = numberFormatter.string(from: NSNumber(value: item.valueInDollars))
            dateLabel.text = dateFormatter.string(from: item.dateCreated)
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.view.endEditing(true)
        
        item?.name = nameField.text ?? ""
        item?.serialNumber = serialNumberField.text
        
        if let valueText = valueField.text, let value = numberFormatter.number(from: valueText) {
            item?.valueInDollars = value.intValue
        } else {
            item?.valueInDollars = 0
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "showDate":
            if let datePickerViewController = segue.destination as? DatePickerViewController {
                datePickerViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }

}
