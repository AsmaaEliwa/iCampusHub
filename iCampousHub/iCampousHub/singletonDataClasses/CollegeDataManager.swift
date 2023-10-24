//
//  CollegeDataManager.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import Foundation
import CoreData

class CollegeDataManager{
    static let shared = CollegeDataManager()
    let viewContext: NSManagedObjectContext
    private init(){
        let presestanceController = PersistenceController.shared
         viewContext = presestanceController.container.viewContext
    }
    func addCollege(name:String , address: String , nOfStudents:String, yearPayment:Float){
        let college = College(context:viewContext)
        college.adress = address
        college.name = name
        college.nOfStudents = nOfStudents
        college.payment = yearPayment
        do {
            try? viewContext.save()
            print("College saved")
        }catch{
            print("Error saving college: \(error)")
        }
    }
    func fetchColleges()->[College]{
        let request: NSFetchRequest<College> = College.fetchRequest()
         
         do {
             let colleges = try viewContext.fetch(request)
             return colleges
         } catch {
             print("Error fetching colleges: \(error)")
             return []
         }
    }
    
}
