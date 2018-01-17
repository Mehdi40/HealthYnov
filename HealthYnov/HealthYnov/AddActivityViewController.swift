//
//  AddActivityViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    @IBOutlet weak var workoutButton: UIButton!
    
    @IBOutlet weak var bikeButton: UIButton!
    
    @IBOutlet weak var swimButton: UIButton!
    
    @IBOutlet weak var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var chosenActivity : String?
        if let goToDetails = segue.destination as? AddDetailsActivityViewController {
        
            switch segue.identifier {
            case "gotoDetailsWorkout"? :
                chosenActivity = "workout"
                goToDetails.chosenAct = "Congrats for workout!"
                goToDetails.chosenActDetails = "How many crunchs did you do?"
                break
            case "gotoDetailsBike"? :
                chosenActivity = "bike"
                goToDetails.chosenAct = "Congrats for biking!"
                goToDetails.chosenActDetails = "How many km did you ride?"
                break
            case "gotoDetailsSwim"? :
                chosenActivity = "swim"
                goToDetails.chosenAct = "Congrats for swimming!"
                goToDetails.chosenActDetails = "How many laps did you swim?"
                break
            case "gotoDetailsRun"? :
                chosenActivity = "run"
                goToDetails.chosenAct = "Congrats for running!"
                goToDetails.chosenActDetails = "How many km did you run ?"
                break
            default :
                break
            }
            

            
        }
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
