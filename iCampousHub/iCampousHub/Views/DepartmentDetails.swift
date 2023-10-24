//
//  DepartmentDetails.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import SwiftUI

struct DepartmentDetails: View {
    var department:Department?
    var college:College?
    @State private var showAddCourseAlert = false
    var body: some View {
        ZStack{
            LinearGradient(colors: [.brown ,.white], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Department Information").font(.system(size: 30 , weight: .medium )).padding()
                Divider()
                Text("Department Name : \(department?.name ?? "")")
                HStack{
                    Button{
                        showAddCourseAlert = true
                    }label: {
                        deleteBtn(color: .green, title: "Add Course")
                    }
                    Button{
                        
                    }label: {
                        deleteBtn(color: .red, title: "Delete Department")
                    }
                    
                }
                Spacer()
                    .alert(isPresented: $showAddCourseAlert) {
                        Alert(title: Text("Add Course To This Department")
                             
                        )
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
