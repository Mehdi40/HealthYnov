//
//  AddDetailsActivityViewController.swift
//  HealthYnov
//
//  Created by Diego Grumeau on 17/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreData

class AddDetailsActivityViewController: UIViewController {
    
    // Details of adding an activity

    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDetails: UILabel!
    @IBOutlet weak var activityUnit: UITextField!
    
    var chosenAct : String?
    var chosenActDetails : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityTitle.text = chosenAct
        activityDetails.text = chosenActDetails
        
    }

    @IBAction func clickedSave(_ sender: Any) {
        
        let addToUserActivity = Int32(activityUnit.text!)
  
        var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch.fetchLimit = 1
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "username", ascending: true)]
        let users = try! context.fetch(userFetch)
        let currentUser: User = users.first as! User
        
        switch chosenAct {
            
            case "Congrats for biking!"? :
  
                // Note : have to handle the relationship in the NSPredicate to avoid crash
                
                let userActivityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserActivity")
                userActivityFetch.fetchLimit = 1
                userActivityFetch.sortDescriptors = [NSSortDescriptor.init(key: "score", ascending: true)]
                userActivityFetch.predicate = NSPredicate(format: "self.activity.name = %@", "Biking")
                let userActivities = try! context.fetch(userActivityFetch)
                let currentUserActivity: UserActivity = userActivities.first as! UserActivity
                currentUserActivity.setValue(addToUserActivity, forKey: "experience")
                print(currentUserActivity.experience)
                
                    break
            
            case "Congrats for workout!"? :
                
                let userActivityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserActivity")
                userActivityFetch.fetchLimit = 1
                userActivityFetch.sortDescriptors = [NSSortDescriptor.init(key: "score", ascending: true)]
                userActivityFetch.predicate = NSPredicate(format: "self.activity.name = %@", "Pushup")
                let userActivities = try! context.fetch(userActivityFetch)
                let currentUserActivity: UserActivity = userActivities.first as! UserActivity
                currentUserActivity.setValue(addToUserActivity, forKey: "experience")
                print(currentUserActivity.experience)
                
                    break
            
            case "Congrats for swimming!"? :
                
                let userActivityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserActivity")
                userActivityFetch.fetchLimit = 1
                userActivityFetch.sortDescriptors = [NSSortDescriptor.init(key: "score", ascending: true)]                
                userActivityFetch.predicate = NSPredicate(format: "self.activity.name = %@", "Swimming")
                let userActivities = try! context.fetch(userActivityFetch)
                let currentUserActivity: UserActivity = userActivities.first as! UserActivity
                currentUserActivity.setValue(addToUserActivity, forKey: "experience")
                print(currentUserActivity.experience)
                
                    break
            
            case "Congrats for running!"? :
                
//                let activityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
//                activityFetch.fetchLimit = 1
//                activityFetch.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
//                activityFetch.predicate = NSPredicate(format: "name = %@", "Running")
//                let activities = try! context.fetch(userFetch)
                
                let userActivityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "UserActivity")
                userActivityFetch.fetchLimit = 1
                userActivityFetch.sortDescriptors = [NSSortDescriptor.init(key: "score", ascending: true)]
                userActivityFetch.predicate = NSPredicate(format: "self.activity.name = %@", "Running")
                let userActivities = try! context.fetch(userActivityFetch)
                let currentUserActivity: UserActivity = userActivities.first as! UserActivity
                currentUserActivity.setValue(addToUserActivity, forKey: "experience")
                print(currentUserActivity.experience)
                
                break
            
            default:
                break
            
        }

        print("Le résultat devrait être ", addToUserActivity)

        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
}
