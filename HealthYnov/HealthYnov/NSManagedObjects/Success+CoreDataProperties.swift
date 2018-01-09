//
//  Success+CoreDataProperties.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//
//

import Foundation
import CoreData


extension Success {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Success> {
        return NSFetchRequest<Success>(entityName: "Success")
    }

    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var requirements: Int32

}
