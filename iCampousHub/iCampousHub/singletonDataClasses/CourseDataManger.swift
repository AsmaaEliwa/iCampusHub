//
//  CourseDataManger.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 25/10/2023.
//

import Foundation
import CoreData
class CourseDataManger {
    static let shared = CourseDataManger()
    let viewContext: NSManagedObjectContext
    private init(){
        let persistanceController = PersistenceController.shared
        viewContext = persistanceController.container.viewContext
    }
    func addCourse(name:String , hours:Float)->Course{
        let course = Course(context: viewContext)
        course.name = name
        course.hours = hours
        do {
            
            try viewContext.save()
            
            print("coures Saved")
            return course
            
        }catch {
            
            print(error)
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
           
        }
      
    }
}
