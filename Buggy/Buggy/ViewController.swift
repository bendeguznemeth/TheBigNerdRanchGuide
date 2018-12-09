//
//  ViewController.swift
//  Buggy
//
//  Created by Németh Bendegúz on 2018. 12. 07..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Called buttonTapped(_:)")
//        print("sender: \(sender)")
//        print("Is control on? \(sender.isOn)")
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        
        badMethod()
    }
    
    private func badMethod() {
        let array = NSMutableArray()
        
        for i in 0..<10 {
            array.insert(i, at: i)
        }
        
        for _ in 0...10 {
            array.removeObject(at: 0)
        }
        
    }

}

