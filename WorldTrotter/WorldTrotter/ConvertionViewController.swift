//
//  ConvertionViewController.swift
//  WorldTrotter
//
//  Created by Németh Bendegúz on 2018. 12. 02..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = {
       let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var bool = true
    
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
        
        print("ConvertionViewController loaded its view.")
        
        updateCelsiusLabel()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if bool {
            self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:1.00, alpha:1.0)
            bool = !bool
        } else {
            self.view.backgroundColor = UIColor(red:0.26, green:0.71, blue:0.96, alpha:1.0)
            bool = !bool
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
//        print("Current text: \(textField.text)")
//        print("Replacement text: \(string)")
//        return true
        
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        let characterSet = NSCharacterSet.decimalDigits
        
        if let currentCharacter = textField.text, currentCharacter.contains(decimalSeparator), string == decimalSeparator {
            return false
        } else if !characterSet.isSuperset(of: CharacterSet(charactersIn: string)), string != decimalSeparator {
            return false
        } else {
            return true
        }
        
//        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//        let replacementTextHasDecimalSeparator = string.range(of: ".")
//
//        if existingTextHasDecimalSeparator != nil,
//            replacementTextHasDecimalSeparator != nil {
//            return false
//        } else {
//            return true
//        }
        
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
//        celsiusLabel.text = textField.text
        
//        if let text = textField.text, !text.isEmpty {
//            celsiusLabel.text = text
//        } else {
//            celsiusLabel.text = "???"
//        }
        
        if let text = textField.text, let number = numberFormatter.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
//            celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
}

