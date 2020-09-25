//
//  Person+CoreDataProperties.swift
//  AppClicsTask
//
//  Created by kushalkumar nora on 25/09/20.
//  Copyright © 2020 Demo. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var date: String?
    @NSManaged public var favCricketr: String?
    @NSManaged public var flagColour: String?
    @NSManaged public var name: String?

}
