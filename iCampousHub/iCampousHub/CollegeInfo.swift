//
//  CollegeInfo.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 23/10/2023.
//

import Foundation
import SwiftUI
struct CollegeInfo:View{
    var college : College
    var body: some View{
        ZStack{
            LinearGradient(gradient: Gradient(colors: [ .white , .brown]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("College Info").font(.system(size: 30 , weight: .medium))
                Divider()
                myText(title: "College Name : \(college.name ?? "not Found")" )
                   
                myText(title: "College Address : \(college.adress ?? "not Found")" )
                  
                myText(title: "Number of Students  : \(college.nOfStudents ?? "not Found")" )
                
                myText(title: "College Payment : \(college.payment ?? 0 )" )
                    

                VStack{
                    NavigationLink(destination: AddDepartmentView(college:college)){
                        myBtn(title: "Add A department")
                    }
                    HStack{
                        Button{
                            
                        }label: {
                            deleteBtn(color: .red , title: "Delete")
                        }
                        Button{
                            
                        }label: {
                            deleteBtn(color: .green , title: "Edit")
                        }
                        
                    }
                }
                .padding()
                NavigationLink(destination: AllDepartmentsView(college: college)){
                    Text("All Departments")
                }
                Spacer()
            }
            
        }
    }
}
struct myText:View {
    var title: String
    var body: some View{
        Text(title).font(.system(size: 15 , weight: .medium )).padding()
    }
    
}
