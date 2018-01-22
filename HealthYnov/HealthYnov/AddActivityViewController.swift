//
//  AddActivityViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController {

    // This view permits to manually add activity : Workout, Biking, Swimming and Running
    
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var bikeButton: UIButton!
    @IBOutlet weak var swimButton: UIButton!
    @IBOutlet weak var runButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Segue for the next view (AddDetailsActivityViewController)
    // Even if all the options go to the same view, it customises the label and save the activity in the right place
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var chosenActivity : String?
        if let goToDetails = segue.destination as? AddDetailsActivityViewController {
        
            switch segue.identifier {
            case "gotoDetailsWorkout"? :
                chosenActivity = "workout"
                goToDetails.chosenAct = "Congrats for workout!"
                goToDetails.chosenActDetails = "How many push-ups did you do?"
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

}
