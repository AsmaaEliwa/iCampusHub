//
//  AllProfessors.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 29/10/2023.
//

import SwiftUI

struct AllProfessors: View {
    var department:Department
    
    var body: some View {
        VStack{
            List(Array(department.courses as! Set<Course> ) , id: \.self){course in
                Text(course.professor?.name ?? "")
            }
        }
    }
}

//#Preview {
////    AllProfessors()
//}
