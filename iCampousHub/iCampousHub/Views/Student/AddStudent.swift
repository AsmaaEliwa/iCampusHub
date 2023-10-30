//
//  AddStudent.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 30/10/2023.
//

import SwiftUI

struct AddStudent: View {
    var course: Course
    @State var name = ""
    @State var age = ""
    var body: some View {
        VStack{
            Text("Add Student").font(.system(size: 30,weight: .medium)).foregroundColor(.brown)
                .padding()
                Divider()
            input(text: $name, placeholder: "Enter Name", label: "Student Name").padding()
            input(text: $age, placeholder: "Enter Age", label: "Student Age").padding()
            Button{
                DataManager.shared.addStudent(name: name, age: Int16(age) ?? 0 , course: course)
            } label:{
                Label("Add Studen",systemImage: "person.fill").foregroundColor(.brown)
            }
            Spacer()
        }
    }
}

//#Preview {
//    AddStudent(course: <#T##Course#>, name: English)
//}
