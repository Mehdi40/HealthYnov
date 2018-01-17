//
//  WebFAQViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import WebKit

class WebFAQViewController: UIViewController {

    // Creating a html FAQ in case of the expandable FAQ wouldn't be ready on time 🤞
    // Using a WebKit view. The URL is from my personal FTP which has been whitelisted in info.plist 👌
    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:"http://m.raven.free.fr/ynov/qna.html")
        webview.load(URLRequest(url: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
