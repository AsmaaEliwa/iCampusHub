//
//  Professor+CoreDataProperties.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//
//

import Foundation
import CoreData


extension Professor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Professor> {
        return NSFetchRequest<Professor>(entityName: "Professor")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var course: Course?

}

extension Professor : Identifiable {

}
