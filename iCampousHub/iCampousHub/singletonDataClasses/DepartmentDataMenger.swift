//
//  DepartmentDataMenger.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import Foundation
import CoreData
import SwiftUI
class DepartmentDataMenger {
    static let  shared = DepartmentDataMenger()
    let  viewContext: NSManagedObjectContext
    private init(){
        let persistenceController = PersistenceController.shared
        viewContext = persistenceController.container.viewContext
    }
    
    func AddDepartment(name: String)->Department{
        withAnimation {
            let department = Department(context: viewContext)
            department.name = name

            do {
                 try viewContext.save()
                print("Department Saved")
                return department
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func fetchDepartments()->[Department]{
        var request: NSFetchRequest<Department> = Department.fetchRequest()
        do {
           let departments =  try viewContext.fetch(request)
            return departments
        }catch{
            print(error)
        }
        return []
    }
    
    
}
