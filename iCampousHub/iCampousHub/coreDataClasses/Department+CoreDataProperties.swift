//
//  Department+CoreDataProperties.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 29/10/2023.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var name: String?
    @NSManaged public var college: College?
    @NSManaged public var courses: NSSet?
    @NSManaged public var professors: NSSet?

}

// MARK: Generated accessors for courses
extension Department {

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSSet)

}

// MARK: Generated accessors for professors
extension Department {

    @objc(addProfessorsObject:)
    @NSManaged public func addToProfessors(_ value: Professor)

    @objc(removeProfessorsObject:)
    @NSManaged public func removeFromProfessors(_ value: Professor)

    @objc(addProfessors:)
    @NSManaged public func addToProfessors(_ values: NSSet)

    @objc(removeProfessors:)
    @NSManaged public func removeFromProfessors(_ values: NSSet)

}

extension Department : Identifiable {

}
