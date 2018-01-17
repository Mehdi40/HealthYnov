//
//  AddDetailsActivityViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class AddDetailsActivityViewController: UIViewController {
    
    // Details of adding an activity

    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDetails: UILabel!
    
    var chosenAct : String?
    var chosenActDetails : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTitle.text = chosenAct
        activityDetails.text = chosenActDetails
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
