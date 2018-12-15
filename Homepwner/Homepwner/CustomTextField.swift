//
//  CustomTextField.swift
//  Homepwner
//
//  Created by Németh Bendegúz on 2018. 12. 15..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override func becomeFirstResponder() -> Bool {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.blue.cgColor
        self.layer.cornerRadius = 5
        super.becomeFirstResponder()
        return true
    }
    
    override func resignFirstResponder() -> Bool {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        self.layer.cornerRadius = 5
        super.resignFirstResponder()
        return true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
