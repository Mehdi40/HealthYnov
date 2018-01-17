//
//  AddDetailsActivityViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class AddDetailsActivityViewController: UIViewController {

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
