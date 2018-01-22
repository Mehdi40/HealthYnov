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
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var chosenAct : String?
    var chosenActDetails : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        activityTitle.text = chosenAct
        activityDetails.text = chosenActDetails
        
        sendButton.backgroundColor = UIColor.YnovGreen
        cancelButton.backgroundColor = UIColor.YnovRed
        
        sendButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    @IBAction func clickedSave(_ sender: Any) {
        
        let addToUserActivity = Int16(activityUnit.text!)
  
        var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch.fetchLimit = 1
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "username", ascending: true)]
        let users = try! context.fetch(userFetch)
        let currentUser: User = users.first as! User
        
        switch chosenAct {
            
            case "Congrats for biking!"? :
  
                // Note : have to handle the relationship in the NSPredicate to avoid crash
                
                let activityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
                activityFetch.fetchLimit = 1
                activityFetch.predicate = NSPredicate(format: "self.name = %@", "Biking")
                let activities = try! context.fetch(activityFetch)
                let activity: Activity = activities.first as! Activity
                
                let newUserActivity = NSEntityDescription.insertNewObject(forEntityName: "UserActivity", into: context) as! UserActivity
                newUserActivity.setValue(addToUserActivity, forKey: "score")
                newUserActivity.setValue(currentUser, forKey: "user")
                newUserActivity.setValue(activity, forKey: "activity")
                newUserActivity.setValue(Int32(addToUserActivity! * 10), forKey: "experience")
                activity.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                currentUser.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                
                let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
                successFetch.fetchLimit = 1
                let activityPredicate = NSPredicate(format: "self.activity == %@", "biking")
                let formatPredicate = NSPredicate(format: "self.requirements <= %d", Int32(addToUserActivity!))
                let andPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [activityPredicate, formatPredicate])
                successFetch.predicate = andPredicate
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let userSuccesses = try! context.fetch(successFetch) as! [Success]
                
                for success in userSuccesses {
                    success.unlocked = true
                }
                    break
            
            case "Congrats for workout!"? :
                
                let activityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
                activityFetch.fetchLimit = 1
                activityFetch.predicate = NSPredicate(format: "self.name = %@", "Pushup")
                let activities = try! context.fetch(activityFetch)
                let activity: Activity = activities.first as! Activity
                
                let newUserActivity = NSEntityDescription.insertNewObject(forEntityName: "UserActivity", into: context) as! UserActivity
                newUserActivity.setValue(addToUserActivity, forKey: "score")
                newUserActivity.setValue(currentUser, forKey: "user")
                newUserActivity.setValue(activity, forKey: "activity")
                newUserActivity.setValue(Int32(addToUserActivity! * 10), forKey: "experience")
                activity.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                currentUser.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                
                let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
                successFetch.fetchLimit = 1
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let activityPredicate = NSPredicate(format: "self.activity == %@", "pushup")
                let formatPredicate = NSPredicate(format: "self.requirements <= %d", Int32(addToUserActivity!))
                let andPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [activityPredicate, formatPredicate])
                successFetch.predicate = andPredicate
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let userSuccesses = try! context.fetch(successFetch) as! [Success]
                
                for success in userSuccesses {
                    success.unlocked = true
                }
                    break
            
            case "Congrats for swimming!"? :
                
                let activityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
                activityFetch.fetchLimit = 1
                activityFetch.predicate = NSPredicate(format: "self.name = %@", "Swimming")
                let activities = try! context.fetch(activityFetch)
                let activity: Activity = activities.first as! Activity
                
                let newUserActivity = NSEntityDescription.insertNewObject(forEntityName: "UserActivity", into: context) as! UserActivity
                newUserActivity.setValue(addToUserActivity, forKey: "score")
                newUserActivity.setValue(currentUser, forKey: "user")
                newUserActivity.setValue(activity, forKey: "activity")
                newUserActivity.setValue(Int32(addToUserActivity! * 10), forKey: "experience")
                activity.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                currentUser.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                
                let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
                successFetch.fetchLimit = 1
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let activityPredicate = NSPredicate(format: "self.activity == %@", "swimming")
                let formatPredicate = NSPredicate(format: "self.requirements <= %d", Int32(addToUserActivity!))
                let andPredicate = NSCompoundPredicate(orPredicateWithSubpredicates: [activityPredicate, formatPredicate])
                successFetch.predicate = andPredicate
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let userSuccesses = try! context.fetch(successFetch) as! [Success]
                
                for success in userSuccesses {
                    success.unlocked = true
                }
                    break
            
            case "Congrats for running!"? :
                
                let activityFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
                activityFetch.fetchLimit = 1
                activityFetch.predicate = NSPredicate(format: "self.name = %@", "Running")
                let activities = try! context.fetch(activityFetch)
                let activity: Activity = activities.first as! Activity
                
                let newUserActivity = NSEntityDescription.insertNewObject(forEntityName: "UserActivity", into: context) as! UserActivity
                newUserActivity.setValue(addToUserActivity, forKey: "score")
                newUserActivity.setValue(currentUser, forKey: "user")
                newUserActivity.setValue(activity, forKey: "activity")
                newUserActivity.setValue(Int32(addToUserActivity! * 10), forKey: "experience")
                activity.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                currentUser.setValue(NSSet(object: newUserActivity), forKey: "UserActivity")
                
                let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
                successFetch.fetchLimit = 1
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                let activityPredicate = NSPredicate(format: "self.activity == %@", "running")
                let formatPredicate = NSPredicate(format: "self.requirements <= %d", Int32(addToUserActivity!))
                let andPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [activityPredicate, formatPredicate])
                successFetch.predicate = andPredicate
                successFetch.sortDescriptors = [NSSortDescriptor.init(key: "requirements", ascending: false)]
                print(successFetch)
                let userSuccesses = try! context.fetch(successFetch) as! [Success]
                
                for success in userSuccesses {
                    print(success)
                    success.unlocked = true
                }
                break
            
            default:
                break
        }

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
