//
//  UserActivity+CoreDataProperties.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//
//

import Foundation
import CoreData


extension UserActivity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserActivity> {
        return NSFetchRequest<UserActivity>(entityName: "UserActivity")
    }

    @NSManaged public var dateCreation: NSDate?
    @NSManaged public var experience: Int32
    @NSManaged public var id: UUID?
    @NSManaged public var score: Int16
    @NSManaged public var activity: Activity?
    @NSManaged public var user: User?

}
