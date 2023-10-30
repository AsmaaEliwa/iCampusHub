//
//  CourseDetails.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 30/10/2023.
//

import SwiftUI

struct CourseDetails: View {
    var college:College?
    @State var course: Course?
    var department: Department?
    
    var body: some View {
        VStack{
            Text("Course Details").font(.system(size: 30,weight: .medium)).foregroundColor(.brown)
                .padding()
                Divider()
            Text("Course Name : \(course?.name ?? "")")
           Text("Course Name : \(course?.hours ?? 0)")
            List{
                ForEach(Array(course?.students as? Set<Student> ?? [] ) , id:\.self ){student in
                   Text( student.name ?? "")
                }
            }
            Button{
                
            }label: {
                NavigationLink(destination: AddStudent(course:course ?? Course())){
                    Label("Add Student",systemImage: "person.fill").foregroundColor(.brown)
                }
            }
            Spacer()
        }
       
    }
}

#Preview {
    CourseDetails()
}
