//
//  AboutViewController.swift
//  Bullseye
//
//  Created by Arun Sasidharan on 11/09/19.
//  Copyright © 2019 Arun. All rights reserved.
//

import UIKit
import WebKit

final class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }

}
