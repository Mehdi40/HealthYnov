//
//  ViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 08/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate {
    
    
    @IBOutlet weak var NavBarCustom: UINavigationBar!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userlevel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()

        NavBarCustom.delegate = self
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}



// Comment appeler le contexte (BDD) : 
// let appDel = UIApplication.shared.delegate as! AppDelegate
// appDel.persistentContainer.viewContext
