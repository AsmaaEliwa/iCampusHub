//
//  AddDepartmentView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import SwiftUI
import CoreData
struct AddDepartmentView: View  {
    @State private var departmentName = ""
    @State private  var showAlert = false
    var college:College?
    func resetInput(){
        departmentName = ""
    }
    var body: some View {
       
        ZStack{
            LinearGradient(colors: [.brown , .white], startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Add Department")
                    .font(.system(size: 30 , weight: .medium))
                    .padding()
                Divider()
                input(text: $departmentName, placeholder: "Enter the department name", label: "Name")
                Button{
                    if departmentName.isEmpty {
                        showAlert = true
                    }else{
                        var newDepartment = DepartmentDataMenger.shared.AddDepartment(name:departmentName )
                        
                        college?.addToDepartments(newDepartment)
                        resetInput()
                    }
                }label: {
                    myBtn(title: "Add")
                }
                Spacer()
                    .alert(isPresented: $showAlert)  {
                        Alert(title: Text("Error"),
                              message: Text("please fill out the requirments"),
                              primaryButton: .default(Text("OK"),
                              action: {
                            showAlert = false
                        }
                        ), secondaryButton: .default(Text("cancel"))
                        )
                            
                        }
            }
        }
        
    }
}

struct AddDepartmentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
//            AddDepartmentView()

        }

    }
}

// #Preview {
//    Text("hh")
//}
