//
//  ConvertionViewController.swift
//  WorldTrotter
//
//  Created by Németh Bendegúz on 2018. 12. 02..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //        let firstFrame = CGRect(x: 160, y: 240, width: 100, height: 150)
        //        let firstView = UIView(frame: firstFrame)
        //        firstView.backgroundColor = UIColor.blue
        //        view.addSubview(firstView)
        //
        //        let secondFrame = CGRect(x: 20, y: 30, width: 50, height: 50)
        //        let secondView = UIView(frame: secondFrame)
        //        secondView.backgroundColor = UIColor.green
        //        firstView.addSubview(secondView)
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
        
        if let text = textField.text, !text.isEmpty {
            celsiusLabel.text = text
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
}

