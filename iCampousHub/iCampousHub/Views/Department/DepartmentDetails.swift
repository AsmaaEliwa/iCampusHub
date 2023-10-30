//
//  DepartmentDetails.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import SwiftUI
import CoreData
struct DepartmentDetails: View {
    @State var  department:Department
    var college:College?
    @State private var showCourseInput = false
    @State private var courseName = ""
    @State private var courseHours = ""
    @State var courses: [Course]
    @State var selectedCourse:Course?
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.brown ,.white], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Department Information").font(.system(size: 30 , weight: .medium )).padding()
                Divider()
                VStack{
                    Text("Department Name : \(department.name ?? "")").padding()
                    Text("Department courses").padding()
                    Divider()
                    List {
                        ForEach(Array(department.courses as? Set<Course> ?? [])){ course in
                            NavigationLink(destination: CourseDetails(course: course), tag: course, selection: $selectedCourse) {
                                Text(course.name ?? "")
                            }
                            .onTapGesture {
                                selectedCourse = course
                            }
                        }
                    }
            
                    HStack{
                        Button{
                            showCourseInput = true
                        }label: {
                            Label("Add Course",systemImage: "book.fill")
                        }
                        Button{
                            
                        }label: {
                            deleteBtn(color: .red, title: "Delete Department")
                        }
                    }
                    Button{
                        
                    }label: {
                        NavigationLink(destination:AddProfessor(department:department, courses:department.courses as? [Course] ?? [])){
                            Label("Add Professor",systemImage: "person.fill")
                        }
                      
                    }
                }
                Spacer()
                    .sheet(isPresented: $showCourseInput) {
                      
                        CourseInputView(courseName: $courseName, courseHours: $courseHours,department: $department,showCourseInput:$showCourseInput, courses: $courses )
                    }
            }
            
            
        }.onAppear(){
            courses = (department.courses as? [Course] ?? [])
        }
        }
    }


//struct DepartmentDetails_Previews: PreviewProvider {
//    static var previews: some View {
////        DepartmentDetails(department: Department())
//    }
//}
struct CourseInputView: View {
    @Binding var courseName: String
    @Binding var courseHours: String
    @Binding var  department:Department
    @State var course:Course?
    @Binding var showCourseInput:Bool
    @Binding var  courses :[Course]
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    Spacer()
                    Button{
                        showCourseInput = false
                    }label: {
                        Image(systemName: "xmark").foregroundColor(Color(.label) ).imageScale(.large).frame(width: 40 , height: 40)
                    }
                    
                }
                Form {
                    Section(header: Text("Enter course details:")) {
                        input(text: $courseName, placeholder: "Enter Course Name", label: "Course Name")
                        input(text: $courseHours, placeholder: "Enter Course Hours", label: "Course Hours")
                        HStack{
                            Spacer()
                            Button{
                                DataManager.shared.saveCourseData(name: courseName, department: department, hours: Float(courseHours) ?? 0)
                                
                               
    
                                showCourseInput = false
                            }label: {
                                deleteBtn(color: .brown, title: "Add")
                            }
                            Spacer()
                        }
                        
                    }
                }
            }
        }
    }
}
