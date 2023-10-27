//
//  DepartmentDetails.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import SwiftUI

struct DepartmentDetails: View {
    @State var  department:Department?
    var college:College?
    @State private var showCourseInput = false
    @State private var courseName = ""
    @State private var courseHours = ""
    @State private var courses: [Course] = []
//    var courses: [Course] {
//           department?.courses?.array as? [Course] ?? []
//       }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.brown ,.white], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Department Information").font(.system(size: 30 , weight: .medium )).padding()
                Divider()
                VStack{
                Text("Department Name : \(department?.name ?? "")")
                    List {
                                           ForEach(Array(courses as? Set<Course> ?? []), id: \.self) { course in
                                               
                                               Text(course.name ?? "")
                                           }
                                       }
                    .navigationBarTitle("Courses")
                    HStack{
                        Button{
                            showCourseInput = true
                        }label: {
                            deleteBtn(color: .green, title: "Add Course")
                        }
                        Button{
                            
                        }label: {
                            deleteBtn(color: .red, title: "Delete Department")
                        }
                    }
                }
                Spacer()
                    .sheet(isPresented: $showCourseInput) {
                        CourseInputView(courseName: $courseName, courseHours: $courseHours,department: $department,courses:$courses)
                    }
            }
            
            
        }
    }
}

struct DepartmentDetails_Previews: PreviewProvider {
    static var previews: some View {
        DepartmentDetails()
    }
}
struct CourseInputView: View {
    @Binding var courseName: String
    @Binding var courseHours: String
    @Binding var  department:Department?
    @State var course:Course?
    @Binding var  courses :[Course]
    var body: some View {
        Form {
            Section(header: Text("Enter course details:")) {
                input(text: $courseName, placeholder: "Enter Course Name", label: "Course Name")
                input(text: $courseHours, placeholder: "Enter Course Hours", label: "Course Hours")
                Button{
                  let course =   CourseDataManger.shared.addCourse(name: courseName , hours: Float(courseHours) ?? 0)
                    
                    department?.addToCourses(course)
                    
                    courses.append( course)
                }label: {
                    deleteBtn(color: .brown, title: "Add")
                }.frame(alignment:.center)
            }
        }
    }
}
