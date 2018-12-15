//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 15..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let date = item?.dateCreated {
            datePicker.date = date
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        item?.dateCreated = datePicker.date
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
