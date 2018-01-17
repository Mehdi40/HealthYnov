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

    
    @IBOutlet weak var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:"http://m.raven.free.fr/ynov/qna.html")
        webview.load(URLRequest(url: url!))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
