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
                        destination:DepartmentDetails(department: department , college: college),
                            tag: department,
                            selection: $selectedDepartment
                    ){
                        Text(department.name ?? "")
                        
                    }.onTapGesture {
                        selectedDepartment = department
                    }
                  
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
