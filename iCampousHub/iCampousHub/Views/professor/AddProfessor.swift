//
//  AddProfessor.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 29/10/2023.
//

import SwiftUI

struct AddProfessor: View {
    @State private var  name = ""
    @State private var  age  = ""
    var department: Department?
    var college:College?
    var courses:[Course]?
    @State private var selectedCourse: Course?
    func resetInput(){
        name = ""
        age = ""
    }
    
    var body: some View {
        VStack(spacing: 30){
            Text("Add Professor").font(.system(size:30 , weight: .medium))
            Divider()
                .padding()
            input(text: $name , placeholder: "Enter Name", label: "Professor Name")
            input(text: $age , placeholder: "Enter Age", label: "Professor Age")
        }.foregroundColor(.brown)
            .padding()
        List {
            ForEach(Array(department?.courses as? Set<Course> ?? []), id: \.self) { course in
                     Button(action: {
                         selectedCourse = course
                     }) {
                         HStack {
                             Text(course.name ?? "Unknown Course")
                             if course == selectedCourse {
                                 Spacer()
                                 Image(systemName: "checkmark")
                             }
                         }
                     }
                 }
             }
        Spacer()
        Button{
            if let selectedCourse = selectedCourse {
                           DataManager.shared.AddProfessor(name: name, age: age, course: selectedCourse)
                resetInput()
                       }
            
        }label: {
            Label("Save", systemImage: "person.fill").foregroundColor(.brown)
        }.padding()
        NavigationLink( destination:AllProfessors(department:department ?? Department())){
            Text("All Professors")
        }
        Spacer()
    }
}

#Preview {
    AddProfessor()
}
