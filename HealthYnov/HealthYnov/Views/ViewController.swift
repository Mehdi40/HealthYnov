//
//  ViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 08/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData
import HealthKit

class ViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate {
 
    // All outlets + HealthKit stuff
    
    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var NavBarCustom: UINavigationBar!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var userMoths: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userlevel: UILabel!
    @IBOutlet weak var userSteps: UILabel!
    @IBOutlet weak var userSuccesses: UILabel!
    let healthStore = HKHealthStore()
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        usersFetch.fetchLimit = 1
        let users = try! context.fetch(usersFetch)
        let user = users.first as? User
        
        avatar.image = UIImage(named: "Avatar")
        
        let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
        successFetch.predicate = NSPredicate(format: "self.unlocked == %@", NSNumber(booleanLiteral: true))
        let userSuccesses = try! context.fetch(successFetch)
        let userSuccess = userSuccesses.count
        
        self.startTrackingActivityType()
        
        let HKDataHelper = HealthKitDataHelper()
        
        HKDataHelper.retrieveStepCount(completion: {step in self.userSteps.text = String(step)})
        HKDataHelper.retrieveStepCountMonth(completion: {step in self.userMoths.text = String(step)})
        self.userSuccesses.text = String(userSuccess)
        self.activityTypeLabel = "Walking"
   
    // Tests
        
        NavBarCustom.delegate = self
        
 
    }
    
    // User status

    func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking {
                    self?.activityTypeLabel.text = "Walking"
                    print("Walking")
                } else if activity.stationary {
                    self?.activityTypeLabel.text = "Stationary"
                    print("Stationary")
                } else if activity.running {
                    self?.activityTypeLabel.text = "Running"
                    print("Running")
                } else if activity.automotive {
                    self?.activityTypeLabel.text = "Automotive"
                    print("Automotive")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
}
}

