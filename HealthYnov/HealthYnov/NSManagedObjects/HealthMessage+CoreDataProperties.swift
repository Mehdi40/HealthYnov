//
//  HealthMessage+CoreDataProperties.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//
//

import Foundation
import CoreData


extension HealthMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HealthMessage> {
        return NSFetchRequest<HealthMessage>(entityName: "HealthMessage")
    }

    @NSManaged public var icon: String?
    @NSManaged public var id: UUID?
    @NSManaged public var message: String?

}
