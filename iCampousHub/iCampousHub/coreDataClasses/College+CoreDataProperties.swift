//
//  College+CoreDataProperties.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 29/10/2023.
//
//

import Foundation
import CoreData


extension College {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<College> {
        return NSFetchRequest<College>(entityName: "College")
    }

    @NSManaged public var adress: String?
    @NSManaged public var name: String?
    @NSManaged public var nOfStudents: String?
    @NSManaged public var payment: Float
    @NSManaged public var timestamp: Date?
    @NSManaged public var departments: NSOrderedSet?

}

// MARK: Generated accessors for departments
extension College {

    @objc(insertObject:inDepartmentsAtIndex:)
    @NSManaged public func insertIntoDepartments(_ value: Department, at idx: Int)

    @objc(removeObjectFromDepartmentsAtIndex:)
    @NSManaged public func removeFromDepartments(at idx: Int)

    @objc(insertDepartments:atIndexes:)
    @NSManaged public func insertIntoDepartments(_ values: [Department], at indexes: NSIndexSet)

    @objc(removeDepartmentsAtIndexes:)
    @NSManaged public func removeFromDepartments(at indexes: NSIndexSet)

    @objc(replaceObjectInDepartmentsAtIndex:withObject:)
    @NSManaged public func replaceDepartments(at idx: Int, with value: Department)

    @objc(replaceDepartmentsAtIndexes:withDepartments:)
    @NSManaged public func replaceDepartments(at indexes: NSIndexSet, with values: [Department])

    @objc(addDepartmentsObject:)
    @NSManaged public func addToDepartments(_ value: Department)

    @objc(removeDepartmentsObject:)
    @NSManaged public func removeFromDepartments(_ value: Department)

    @objc(addDepartments:)
    @NSManaged public func addToDepartments(_ values: NSOrderedSet)

    @objc(removeDepartments:)
    @NSManaged public func removeFromDepartments(_ values: NSOrderedSet)

}

extension College : Identifiable {

}
