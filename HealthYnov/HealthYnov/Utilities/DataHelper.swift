//
//  DataHelper.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import HealthKit

public class DataHelper{
    
    // Ludovic's code, not compiling
    
    //let appDel = UIApplication.shared.delegate as! AppDelegate
    //appDel.persistentContainer.viewContext
    
    // Context for DB/application mapping
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // Fill all tables : this launches all the functions below .... should rename that!
    
    public func fillAllTables(){
        emptySuccess()
        emptyActivity()
        emptyHealthMessages()
    }
    
    // Functions for each table
    
    
    // Pre-fill user activity at first launch
    
    //public func fillUserActivityMerguez(){
       // let dataHelper = DataHelper(context: self.persistentContainer.viewContext)
     //   let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
   //     user = try? context.fetch(fetchRequest)
        
        
        
 //       let isIndexValid = user.indices.contains(0)
        
      //  if !isIndexValid {
        //    dataHelper.CreateJohnDoe()
    //    }
        
   // }
    
    public func isUser() -> Bool {
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch.fetchLimit = 1
        let users = try! context.fetch(userFetch) as! [User]
        let user = users.first as! User
        
        if user.username == "JohnDoe" {
            return false
        }
        
        return true
    }
    
    
    public func setTables(){
        
        // Execute this function only if an user does not exist
        
        // /!\ Don't forget to clean db
        
        emptyAllTables()
        
        let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        print(stepsCount)
        
        var user: [User]!
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        user = try? context.fetch(fetchRequest)
        let isIndexValid = user.indices.contains(0)
        if !isIndexValid {
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
            let context = appDelegate.persistentContainer.viewContext
            
            // Create a JohnDoe user 
            
            let userEntity = NSEntityDescription.entity(forEntityName: "User", in: context)!
            let user = NSManagedObject(entity: userEntity, insertInto: context)
            user.setValue("JohnDoe", forKey: "username")
            user.setValue(65, forKey: "weight")
            user.setValue(175, forKey: "height")
            user.setValue(22, forKey: "age")
            user.setValue(28000, forKey: "experience")
            
            // Create activities
            
            let activities = [
                (name: "Running", desc: "Pratice running outdoor or on a machine."),
                (name: "Swimming", desc: "Swimming in an Olympic pool."),
                (name: "Biking", desc: "Ride a bike in the countryside, or practice spinning in a gym."),
                (name: "Pushup", desc: "A simple pushup routine you can do at home."),
                (name: "Stairs", desc: "Climb some floors!"),
                (name: "Steps", desc: "All the steps you did"),
                (name: "Walking distance", desc: "All the km you walked")
            ]
            
            // For each activity, create a userActivity score with the user we defined before, and the current activity
            
            for activity in activities {
                let newActivity = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: context) as! Activity
                newActivity.setValue(activity.name, forKey: "name")
                newActivity.setValue(activity.desc, forKey: "desc")
                
                //let newUserActivity = NSEntityDescription.insertNewObject(forEntityName: "UserActivity", into: context) as! UserActivity
                //newUserActivity.setValue(0, forKey: "score")
                //newUserActivity.setValue(user, forKey: "user")
                //newUserActivity.setValue(newActivity, forKey: "activity")
                //newActivity.setValue(NSSet(object: newUserActivity), forKey: "userActivity")
                //user.setValue(NSSet(object: newUserActivity), forKey: "userActivity")
            }
            
            // Create successes
            
            let successes = [
                
                // Success Type : Steps
                
                (name: "Steps - Level 1", desc : "Walk for 100 steps", icon: "steps-bronze", requirements: 100, activity: "steps"),
                (name: "Steps - Level 2", desc : "Walk for 250 steps", icon: "steps-silver", requirements: 250, activity: "steps"),
                (name: "Steps - Level 3", desc : "Walk for 500 steps", icon: "steps-gold", requirements: 500, activity: "steps"),
                
                // Success Type : Walking distance
                
                (name: "Distance - Level 1", desc: "Walk 1 km", icon: "distance-bronze", requirements: 1, activity: "distance"),
                (name: "Distance - Level 2", desc: "Walk 5 km", icon: "distance-silver", requirements: 5, activity: "distance"),
                (name: "Distance - Level 3", desc: "Walk 10 km", icon: "distance-gold", requirements: 10, activity: "distance"),
                
                // Sucess Type : Climb floors
                
                (name: "Stairs - Level 1", desc: "Climb 2 floors", icon: "stairs-bronze", requirements: 2, activity: "stairs"),
                (name: "Stairs - Level 2", desc: "Climb 5 floors", icon: "stairs-silver", requirements: 5, activity: "stairs"),
                (name: "Stairs - Level 3", desc: "Climb 10 floors", icon: "stairs-gold", requirements: 10, activity: "stairs"),
                
                // Success Type : Running
                
                (name: "Running - Level 1", desc: "Run for a whole km...", icon: "running-bronze", requirements: 1, activity: "running"),
                (name: "Running - Level 2", desc: "Run for 5 km", icon: "running-silver", requirements: 100, activity: "running"),
                (name: "Running - Level 3", desc: "Run for 10 km", icon: "running-gold", requirements: 1000, activity: "running"),
                
                // Success Type : Swimming
                
                (name: "Swimming - Level 1", desc: "Swim a lap", icon: "swimming-bronze", requirements: 1, activity: "swimming"),
                (name: "Swimming - Level 2", desc: "Swim 5 laps", icon: "swimming-silver", requirements: 50, activity: "swimming"),
                (name: "Swimming - Level 3", desc: "Swim 10 laps", icon: "swimming-gold", requirements: 100, activity: "swimming"),
                
                // Success Type : Biking
                
                (name: "Biking - Level 1", desc: "Ride a bike for a whole km...", icon: "biking-bronze", requirements: 1, activity: "biking"),
                (name: "Biking - Level 2", desc: "Ride a bike for 5 km", icon: "biking-silver", requirements: 50, activity: "biking"),
                (name: "Biking - Level 3", desc: "Ride a bike for 10 km", icon: "biking-gold", requirements: 100, activity: "biking"),
                
                // Success Type : Workout
                
                (name: "Pushup - Level 1", desc: "Do a total of 50 crunchs", icon: "workout-bronze", requirements: 50, activity: "pushup"),
                (name: "Pushup - Level 2", desc: "Do a total of 500 crunchs", icon: "workout-silver", requirements: 500, activity: "pushup"),
                (name: "Pushup - Level 3", desc: "Do a total of 5000 crunchs", icon: "workout-gold", requirements: 5000, activity: "pushup")
                
            ]
            
            for success in successes {
                let newSuccess = Success(context: context)
                newSuccess.name = success.name
                newSuccess.desc = success.desc
                newSuccess.icon = success.icon
                newSuccess.activity = success.activity
                newSuccess.unlocked = false
                newSuccess.dateUnlock = Date()
                newSuccess.requirements = Int32(success.requirements)
                
            // Create goals
                    
                let goals = [
                    (name: "Monter 148 marches", desc: "monter les marches", icon: "cookie", requirements: 148),
                    (name: "Monter 12123 marches", desc: "monter toutes les marches", icon: "cookie", requirements: 12123),
                    (name: "Dormir 3 nuits", desc: "3 nuits par semaines", icon: "cookie", requirements: 30),
                    (name: "Trouver un partenaire", desc: "un partenaire particulier", icon: "cookie", requirements: 10000),
                    (name: "Devenir un aventurier", desc: "Comme Bob", icon: "cookie", requirements: 50000)
                ]
                
                for goal in goals {
                    let newGoal = Goal(context: context)
                    newGoal.name = goal.name
                    newGoal.desc = goal.desc
                    newGoal.icon = goal.icon
                    newGoal.unlocked = false
                    newGoal.dateUnlock = Date()
                    newGoal.requirements = Int32(goal.requirements)
                    newGoal.experience = Int32(goal.requirements)
                }
                
            // Create HealthMessages which can be randomly displayed if we have time to do this afterwards... (we won't 😩)
                
                let messages = [
                    (message: "No pain, no gain!", icon: "steps-bronze"),
                    (message: "Eat Train Sleep Repeat!", icon: "steps-bronze"),
                    (message: "Eat 5 fruits and vegetable a day!", icon: "steps-bronze")
                ]
                
                for message in messages {
                    let newMessage = HealthMessage(context: context)
                    newMessage.message = message.message
                    newMessage.icon = message.icon
                }
            
            
            
            // Save it
            
            do {
                try context.save()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
                
        }
        }
        }

    
    // Print the Activities on the console : just to be sure that Core Data is setting up ✌️
    
    public func printActivity(){
        
        let activitiesFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
        let primarySortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        activitiesFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allActivities = (try! context.fetch(activitiesFetchRequest)) as! [Activity]
        
        for activity in allActivities {
            
            print(activity.name)
        }
        
        print("Test")
        
    }

    // Empty tables
    
    public func emptyAllTables(){
        emptySuccess()
        emptyUser()
        emptyActivity()
        emptyUserActivity()
        emptyHealthMessages()
    }
    
    // Empty Success
    
    public func emptySuccess(){
        
        let successFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
        let primarySortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        successFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allSuccess = (try! context.fetch(successFetchRequest)) as! [Success]
        
        for success in allSuccess {
            context.delete(success)
        }
        
    }
    
    // Empty Activity
    
    public func emptyActivity(){
        
        let activityFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
        let primarySortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        activityFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allActivity = (try! context.fetch(activityFetchRequest)) as! [Activity]
        
        for activity in allActivity {
            context.delete(activity)
        }
        
    }
    
    // Empty User
    
    public func emptyUser(){
        
        let userFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        let primarySortDescriptor = NSSortDescriptor(key: "username", ascending: true)
        
        userFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allUsers = (try! context.fetch(userFetchRequest)) as! [User]
        
        for user in allUsers {
            context.delete(user)
        }
        
    }
    
    // Empty UserActivity
    
    public func emptyUserActivity(){

        let userActivityFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserActivity")
        let primarySortDescriptor = NSSortDescriptor(key: "score", ascending: true)
        
        userActivityFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allUserActivity = (try! context.fetch(userActivityFetchRequest)) as! [UserActivity]
        
        for userActivity in allUserActivity {
            context.delete(userActivity)
        }

    }
    
    // Empty Health Messages
    
    public func emptyHealthMessages(){
        
        let healthmessageFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "HealthMessage")
        let primarySortDescriptor = NSSortDescriptor(key: "message", ascending: true)
        
        healthmessageFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allHealthmessages = (try! context.fetch(healthmessageFetchRequest)) as! [HealthMessage]
        
        for healthmessage in allHealthmessages {
            context.delete(healthmessage)
        }
        
    }
    
    func retrieveStepCount(completion: @escaping (_ stepRetrieved: Double) -> Void) {
        
        //   Define the Step Quantity Type
        let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        
        //   Get the start of the day
        let date = Date()
        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
        let newDate = cal.startOfDay(for: date)
        
        //  Set the Predicates & Interval
        let predicate = HKQuery.predicateForSamples(withStart: newDate, end: Date(), options: .strictStartDate)
        var interval = DateComponents()
        interval.day = 1
        
        //  Perform the Query
        let query = HKStatisticsCollectionQuery(quantityType: stepsCount!, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: newDate as Date, intervalComponents:interval)
  
        print(stepsCount)
    }

    
}

