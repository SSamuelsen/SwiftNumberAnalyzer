//
//  Forms+CoreDataProperties.swift
//  MACtoText_V.2
//
//  Created by Stephen Samuelsen on 7/31/18.
//  Copyright © 2018 Stephen Samuelsen. All rights reserved.
//
//

import Foundation
import CoreData


extension Forms {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Forms> {
        return NSFetchRequest<Forms>(entityName: "Forms")
    }

    @NSManaged public var department: String?
    @NSManaged public var pcName: String?
    @NSManaged public var ticket: String?
    @NSManaged public var employeeName: String?
    @NSManaged public var mac: String?
    @NSManaged public var employeeID: String?
    @NSManaged public var desk: String?
    @NSManaged public var dueDate: String?
    @NSManaged public var wiped: NSObject?
    @NSManaged public var inCollection: NSObject?
    @NSManaged public var imaged: NSObject?
    @NSManaged public var userAssigned: NSObject?
    @NSManaged public var softwareRan: NSObject?
    @NSManaged public var otherApps: String?
    @NSManaged public var appsInstalled: String?
    @NSManaged public var adSCCM: NSObject?
    @NSManaged public var newHire: NSObject?
    @NSManaged public var lease: NSObject?
    @NSManaged public var replacement: NSObject?

}
