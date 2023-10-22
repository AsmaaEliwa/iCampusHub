//
//  Course+CoreDataProperties.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var name: String?
    @NSManaged public var hours: Float
    @NSManaged public var professor: Professor?
    @NSManaged public var department: Department?

}

extension Course : Identifiable {

}
