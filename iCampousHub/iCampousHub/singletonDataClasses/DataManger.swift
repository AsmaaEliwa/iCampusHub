//
//  DataManger.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 29/10/2023.
//

import Foundation
import CoreData
import UIKit
import SwiftUI
class DataManager: ObservableObject {
     static let shared = DataManager()
    let container: NSPersistentContainer
    private init(){
        container = NSPersistentContainer(name: "iCampousHub")
        container.loadPersistentStores{(description , error) in
            if let error = error {
                print(error)
            }else{
             print("sucessfully loaded")
            }
            
        }
    }

    func saveData(name: String, address: String, nOfStudents: String, yearPayment: Float) {
        if let entity = NSEntityDescription.entity(forEntityName: "College", in: container.viewContext) {
            let college = NSManagedObject(entity: entity, insertInto: container.viewContext)

            college.setValue(name, forKey: "name")
            college.setValue(address, forKey: "adress")
            college.setValue(nOfStudents, forKey: "nOfStudents")
            college.setValue(yearPayment, forKey: "payment")
            college.setValue(Date(), forKey: "timestamp")

            do {
                try container.viewContext.save()
                print("College Added")
            } catch {
                print("Error saving college: \(error)")
            }
        }
    }
    
    
    func fetchData() -> [College] {
        let fetchRequest: NSFetchRequest<College> = College.fetchRequest()

        do {
            let colleges = try container.viewContext.fetch(fetchRequest)
            return colleges
        } catch {
            print("Error fetching data: \(error)")
            return []
        }
    }
    
    
    
    
    ////////////
    func saveDepartmentData(name: String , college:College) {
    if let entity = NSEntityDescription.entity(forEntityName: "Department", in: container.viewContext) {
        let department = NSManagedObject(entity: entity, insertInto: container.viewContext)

        department.setValue(name, forKey: "name")
        college.addToDepartments(department as! Department)

      
    

        do {
           let result =  try container.viewContext.save()
            print("Department Added")
            return result 
   
        } catch {
            print("Error saving Department: \(error)")
        }
    }
}
    
//    func fetchDepartmentsData() -> [Department] {
//        let fetchRequest: NSFetchRequest<Department> = Department.fetchRequest()
//
//        do {
//            let departments = try container.viewContext.fetch(fetchRequest)
//            return departments
//        } catch {
//            print("Error fetching data: \(error)")
//            return []
//        }
//    }
//    
    
    
    func saveCourseData(name: String , department:Department , hours:Float) {
    if let entity = NSEntityDescription.entity(forEntityName: "Course", in: container.viewContext) {
        let course = NSManagedObject(entity: entity, insertInto: container.viewContext)

        course.setValue(name, forKey: "name")
        course.setValue(hours, forKey: "hours")
        department.addToCourses(course as! Course)

      
    

        do {
           let result =  try container.viewContext.save()
            print("Course Added")
//            return result
   
        } catch {
            print("Error saving Course: \(error)")
        }
    }
}
  
    func AddProfessor(name:String , age:String ,course:Course){
        if let entity = NSEntityDescription.entity(forEntityName: "Professor", in: container.viewContext) {
            let professor = NSManagedObject(entity: entity, insertInto: container.viewContext)

            professor.setValue(name, forKey: "name")
            professor.setValue(age, forKey: "age")
            professor.setValue(course, forKey: "course")
//            professor.course = course

          
        

            do {
               let result =  try container.viewContext.save()
                print("Professor Added")
    //            return result
       
            } catch {
                print("Error saving Professor: \(error)")
            }
        }
    }
    
    
    func addStudent(name:String , age:Int16 , course:Course){
        
        if let entity = NSEntityDescription.entity(forEntityName: "Student", in: container.viewContext) {
            let student = NSManagedObject(entity: entity, insertInto: container.viewContext)

            student.setValue(name, forKey: "name")
            student.setValue(age, forKey: "age")
            course.addToStudents(student as! Student)


          
        

            do {
               let result =  try container.viewContext.save()
                print("Student Added")
    //            return result
       
            } catch {
                print("Error saving Student: \(error)")
            }
        }
    }
    
    
    
    
    
    
    
}
