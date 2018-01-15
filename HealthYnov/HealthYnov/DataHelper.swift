//
//  DataHelper.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import CoreData


public class DataHelper{
    
    // Ludovic's code, not compiling
    
    //let appDel = UIApplication.shared.delegate as! AppDelegate
    //appDel.persistentContainer.viewContext
    
    // Context for DB/application mapping
    
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    // List all success
    

    
    // Fill all tables : this launches all the functions below
    
    public func fillAllTables(){
        emptySuccess()
        emptyActivity()
        emptyHealthMessages()
        fillActivity()
        fillHealthMessages()
        fillSuccess()
    }
    
    // Functions for each table
    

    // Fill the Activity table
    
    public func fillActivity(){
        

        
        let activities = [
            (name: "Running", desc: "Pratice running outdoor or on a machine.", icon: "steps-bronze"),
            (name: "Swimming", desc: "Swimming in an Olympic pool.", icon: "steps-bronze"),
            (name: "Biking", desc: "Ride a bike in the countryside, or practice spinning in a gym.", icon: "steps-bronze"),
            (name: "Fitness", desc: "a simple workout training you can do at home.", icon: "steps-bronze")
                        ]
        
        for activity in activities {
            let newActivity = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: context) as! Activity
            newActivity.name = activity.name
            newActivity.desc = activity.desc
            newActivity.icon = activity.icon
        }
        
        do{
            try context.save()
        } catch {
            print(error)
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
    
    // Fill the HealthMessages table

    public func fillHealthMessages(){
        
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
        
        do{
            try context.save()
        } catch _ {
            
        }
    }
    
    // Fill the Success table

    public func fillSuccess(){
        
        let successes = [
            
            // Success Type : Steps
            
            (name: "Steps - Level 1", desc : "Walk for 100 steps", icon: "steps-bronze", requirements: 100),
            (name: "Steps - Level 2", desc : "Walk for 250 steps", icon: "steps-silver", requirements: 250),
            (name: "Steps - Level 3", desc : "Walk for 500 steps", icon: "steps-gold", requirements: 500),
            
            // Success Type : Walking distance
            
            (name: "Distance - Level 1", desc: "Walk 1 km", icon: "distance-bronze", requirements: 1),
            (name: "Distance - Level 2", desc: "Walk 5 km", icon: "distance-silver", requirements: 5),
            (name: "Distance - Level 3", desc: "Walk 10 km", icon: "distance-gold", requirements: 10),
            
            // Sucess Type : Climb floors
            
            (name: "Stairs - Level 1", desc: "Climb 2 floors", icon: "stairs-bronze", requirements: 2),
            (name: "Stairs - Level 2", desc: "Climb 5 floors", icon: "stairs-silver", requirements: 5),
            (name: "Stairs - Level 3", desc: "Climb 10 floors", icon: "stairs-gold", requirements: 10),
            
            // Success Type : Running
  
            (name: "Running - Level 1", desc: "Run for a whole km...", icon: "running-bronze", requirements: 1),
            (name: "Running - Level 2", desc: "Run for 5 km", icon: "running-silver", requirements: 5),
            (name: "Running - Level 3", desc: "Run for 10 km", icon: "running-gold", requirements: 10),
            
            // Success Type : Swimming
            
            (name: "Swimming - Level 1", desc: "Swim a lap", icon: "swimming-bronze", requirements: 1),
            (name: "Swimming - Level 2", desc: "Swim 5 laps", icon: "swimming-silver", requirements: 5),
            (name: "Swimming - Level 3", desc: "Swim 10 laps", icon: "swimming-gold", requirements: 10),
            
            // Success Type : Biking
            
            (name: "Biking - Level 1", desc: "Ride a bike for a whole km...", icon: "biking-bronze", requirements: 1),
            (name: "Biking - Level 2", desc: "Ride a bike for 5 km", icon: "biking-silver", requirements: 5),
            (name: "Biking - Level 3", desc: "Ride a bike for 10 km", icon: "biking-gold", requirements: 10),
            
            // Success Type : Workout
            
            (name: "Crunch - Level 1", desc: "Do a total of 50 crunchs", icon: "workout-bronze", requirements: 50),
            (name: "Crunch - Level 2", desc: "Do a total of 500 crunchs", icon: "workout-silver", requirements: 500),
            (name: "Crunch - Level 3", desc: "Do a total of 5000 crunchs", icon: "workout-gold", requirements: 5000)
            
        ]
        
        for success in successes {
            let newSuccess = Success(context: context)
            newSuccess.name = success.name
            newSuccess.desc = success.desc
            newSuccess.icon = success.icon
            newSuccess.requirements = Int32(success.requirements)
        
        do{
            try context.save()
        } catch _ {
            
        }
    }
    
}
    
    // Empty tables
    
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
    
    
}
