//
//  AllDepartmentsView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//
import Foundation
import SwiftUI
import CoreData
struct AllDepartmentsView: View {
    var college: College?
    @State private var courses:[Course] = []
    @State private var selectedDepartment:Department?
    var departmentArray: [Department] {
        college?.departments?.array as? [Department] ?? []
    }
    //    var  departments: [Department] = DepartmentDataMenger.shared.fetchDepartments()
    var body: some View {
        VStack{
            List{
                ForEach(departmentArray,id: \.self){department in
                    NavigationLink(
                        destination:DepartmentDetails(department: department , college: college, courses: courses),
                        tag: department,
                        selection: $selectedDepartment
                    ){
                        Text(department.name ?? "")
                        
                    }.onTapGesture {
                        selectedDepartment = department
//                                                courses = department.courses as! [Course]
                    }
                    
                }
                
            } .onAppear {
                // Fetch courses for the initial selected department or a default department if needed
                if let initialDepartment = selectedDepartment {
//                    courses = initialDepartment.courses as! [Course]
                }
            }
        }
    }
}
struct AllDepartmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AllDepartmentsView()
    }
}
