//
//  ProfileDataHelper.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 16/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import CoreData

public class ProfileDataHelper {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    public func fillAllTables(){
      //  emptyUser()
      //  fillUser()
    }
    
    public func fillUser(){
        
   //     let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
     //   newUser.username = "Mehdi"
    
    do{
        try context.save()
    } catch {
        print(error)
    }
}
    
  //  public func emptyUser(){
    //    let userFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
      //  let primarySortDescriptor = NSSortDescriptor(key: "username", ascending: true)
        
     //   userFetchRequest.sortDescriptors = [primarySortDescriptor]
        
     //   let allUser = (try! context.fetch(userFetchRequest)) as! [User]
        
      //  for user in allUser {
       //     context.delete(user)
      //  }
  //  }
}
