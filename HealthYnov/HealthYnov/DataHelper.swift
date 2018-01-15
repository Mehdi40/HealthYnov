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
        fillActivity()
        fillHealthMessages()
        fillSuccess()
        printActivity()
    }
    
    // Functions for each table
    
    // Empty tables
    
    public func emptySuccess(){
        
        let successFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
        let primarySortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        successFetchRequest.sortDescriptors = [primarySortDescriptor]
        
        let allSuccess = (try! context.fetch(successFetchRequest)) as! [Success]
        
        for success in allSuccess {
                context.delete(success)
        }
        
    }
    
    // Fill the Activity table
    
    public func fillActivity(){
        

        
        let activities = [
            (name: "Running", desc: "Pratice running outdoor or on a machine.", icon: "http://adress/icon.png"),
            (name: "Swimming", desc: "Swimming in an Olympic pool.", icon: "http://adress/icon.png"),
            (name: "Biking", desc: "Ride a bike in the countryside, or practice spinning in a gym.", icon: "http://adress/icon.png"),
            (name: "Fitness", desc: "a simple workout training you can do at home.", icon: "http://adress/icon.png")
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
            (message: "No pain, no gain!", icon: "http://adress/icon.png"),
            (message: "Eat Train Sleep Repeat!", icon: "http://adress/icon.png"),
            (message: "Eat 5 fruits and vegetable a day!", icon: "http://adress/icon.png")
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
            (name: "Steps - Level 3", desc : "Walk for 500 steps", icon: "steps-golden", requirements: 500),
            
            // Success Type : Walking distance
            
            (name: "Distance - Level 1", desc: "Walk 1 km", icon: "http://adress/icon.png", requirements: 1),
            (name: "Distance - Level 2", desc: "Walk 5 km", icon: "http://adress/icon.png", requirements: 5),
            (name: "Distance - Level 3", desc: "Walk 10 km", icon: "http://adress/icon.png", requirements: 10),
            
            // Sucess Type : Climb floors
            
            (name: "Stairs - Level 1", desc: "Climb 2 floors", icon: "http://adress/icon.png", requirements: 2),
            (name: "Stairs - Level 2", desc: "Climb 5 floors", icon: "http://adress/icon.png", requirements: 5),
            (name: "Stairs - Level 3", desc: "Climb 10 floors", icon: "http://adress/icon.png", requirements: 10),
            
            // Success Type : Running
  
            (name: "Running - Level 1", desc: "Run for a whole km...", icon: "http://adress/icon.png", requirements: 1),
            (name: "Running - Level 2", desc: "Run for 5 km", icon: "http://adress/icon.png", requirements: 5),
            (name: "Running - Level 3", desc: "Run for 10 km", icon: "http://adress/icon.png", requirements: 10),
            
            // Success Type : Swimming
            
            (name: "Swimming - Level 1", desc: "Swim a lap", icon: "http://adress/icon.png", requirements: 1),
            (name: "Swimming - Level 2", desc: "Swim 5 laps", icon: "http://adress/icon.png", requirements: 5),
            (name: "Swimming - Level 3", desc: "Swim 10 laps", icon: "http://adress/icon.png", requirements: 10),
            
            // Success Type : Biking
            
            (name: "Biking - Level 1", desc: "Ride a bike for a whole km...", icon: "http://adress/icon.png", requirements: 1),
            (name: "Biking - Level 2", desc: "Ride a bike for 5 km", icon: "http://adress/icon.png", requirements: 5),
            (name: "Biking - Level 3", desc: "Ride a bike for 10 km", icon: "http://adress/icon.png", requirements: 10),
            
            // Success Type : Workout
            
            (name: "Crunch - Level 1", desc: "Do a total of 50 crunchs", icon: "http://adress/icon.png", requirements: 50),
            (name: "Crunch - Level 2", desc: "Do a total of 500 crunchs", icon: "http://adress/icon.png", requirements: 500),
            (name: "Crunch - Level 3", desc: "Do a total of 5000 crunchs", icon: "http://adress/icon.png", requirements: 5000)
            
        ]
        
        for success in successes {
            let newSuccess = Success(context: context)
            newSuccess.name = success.name
            newSuccess.desc = success.desc
            newSuccess.requirements = Int32(success.requirements)
        
        do{
            try context.save()
        } catch _ {
            
        }
    }
    
}
}
