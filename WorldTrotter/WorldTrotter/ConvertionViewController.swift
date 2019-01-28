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
    
    private var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    private var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    private let userDefKey = "userDefKey"
    
    private var isGrayBackground = true {
        didSet{
            saveBackgroundState()
        }
    }
    
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
        
        loadBackgroundState()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        changeBackground()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
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
    }
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let number = getNumberFormatter().number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    private func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = getNumberFormatter().string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    private func getNumberFormatter() -> NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }
    
    private func changeBackground() {
        if isGrayBackground {
            self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:1.00, alpha:1.0)
            isGrayBackground = !isGrayBackground
        } else {
            self.view.backgroundColor = UIColor(red:0.26, green:0.71, blue:0.96, alpha:1.0)
            isGrayBackground = !isGrayBackground
        }
    }
    
    private func saveBackgroundState() {
        UserDefaults.standard.set(self.isGrayBackground, forKey: userDefKey)
    }
    
    private func loadBackgroundState() {
        self.isGrayBackground = UserDefaults.standard.bool(forKey: userDefKey)
    }
    
}
