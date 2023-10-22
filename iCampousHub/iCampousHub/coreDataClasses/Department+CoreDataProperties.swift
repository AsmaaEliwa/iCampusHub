//
//  Department+CoreDataProperties.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
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
    @NSManaged public var courses: NSOrderedSet?

}

// MARK: Generated accessors for courses
extension Department {

    @objc(insertObject:inCoursesAtIndex:)
    @NSManaged public func insertIntoCourses(_ value: Course, at idx: Int)

    @objc(removeObjectFromCoursesAtIndex:)
    @NSManaged public func removeFromCourses(at idx: Int)

    @objc(insertCourses:atIndexes:)
    @NSManaged public func insertIntoCourses(_ values: [Course], at indexes: NSIndexSet)

    @objc(removeCoursesAtIndexes:)
    @NSManaged public func removeFromCourses(at indexes: NSIndexSet)

    @objc(replaceObjectInCoursesAtIndex:withObject:)
    @NSManaged public func replaceCourses(at idx: Int, with value: Course)

    @objc(replaceCoursesAtIndexes:withCourses:)
    @NSManaged public func replaceCourses(at indexes: NSIndexSet, with values: [Course])

    @objc(addCoursesObject:)
    @NSManaged public func addToCourses(_ value: Course)

    @objc(removeCoursesObject:)
    @NSManaged public func removeFromCourses(_ value: Course)

    @objc(addCourses:)
    @NSManaged public func addToCourses(_ values: NSOrderedSet)

    @objc(removeCourses:)
    @NSManaged public func removeFromCourses(_ values: NSOrderedSet)

}

extension Department : Identifiable {

}
