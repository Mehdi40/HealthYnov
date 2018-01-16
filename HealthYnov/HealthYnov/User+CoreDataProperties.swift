//
//  User+CoreDataProperties.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 16/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var age: Int16
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var experience: Int32
    @NSManaged public var genre: String?
    @NSManaged public var height: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var lastConnectionDate: NSDate?
    @NSManaged public var profile: String?
    @NSManaged public var username: String?
    @NSManaged public var weight: Int16

}
