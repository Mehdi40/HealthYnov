//
//  ViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 08/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userlevel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// Comment appeler le contexte (BDD) : 
// let appDel = UIApplication.shared.delegate as! AppDelegate
// appDel.persistentContainer.viewContext
