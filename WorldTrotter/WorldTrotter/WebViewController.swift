//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Németh Bendegúz on 2018. 12. 04..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let myURL = URL(string: "https://www.bignerdranch.com")
        if let myURL = myURL {
            let myRequest = URLRequest(url: myURL)
            webView.load(myRequest)
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
