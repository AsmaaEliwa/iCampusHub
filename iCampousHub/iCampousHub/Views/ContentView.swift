//
//  ContentView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State private var collegeName = ""
    @State private var collegeAdress = ""
    @State private var noOfStudents = ""
    @State private var yearPayment = ""
    @State private var isAlertPresented = false
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \College.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<College>
    func resetInputs(){
         collegeName = ""
        collegeAdress = ""
         noOfStudents = ""
         yearPayment = ""
    }
//    func validationAlert(){
//
//
//          let alert = Alert(
//              title: Text("Validation Error"),
//              message: Text("Please fill in all the fields."),
//              dismissButton: .default(Text("OK")) {
//                  // This block is executed when the OK button is pressed
//                  isAlertPresented = false
//              }
//          )
//
//          // Present the alert using the .alert modifier
////        self.alert(isPresented: isAlertPresented ? alert : nil)
//    }
    var body: some View {
        NavigationSplitView {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [ .white , .brown]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Add A College").font(.system(size: 35 , weight: .medium , design: .default)).foregroundColor( .brown)
                        .padding(30)
                    Divider()
                    
                    VStack{
                        input( text:$collegeName, placeholder:"Enter College Name",label: "The College Name")
                        input(text:$collegeAdress , placeholder: "Enter College Address", label:"College Address" )
                        input(text:$noOfStudents,placeholder: "Enter Number Of Students",label: "Number Of Students")
                        input(text: $yearPayment , placeholder: "Enter Year Payment",label: "Year Payment")
                        NavigationLink(destination: AllCollegesView()){
                        Button{
                            if collegeName.isEmpty || collegeAdress.isEmpty || noOfStudents.isEmpty || yearPayment.isEmpty {
                                isAlertPresented = true
                                
                                
                            }else{
                                CollegeDataManager.shared.addCollege(name: collegeName, address: collegeAdress , nOfStudents: noOfStudents, yearPayment: Float(yearPayment) ?? 0)
                                resetInputs()
                            }
                            
                            }label: {
                                myBtn(title: "Add College")
                            }
                        }
  
                    }.alert(isPresented: $isAlertPresented) {
                        Alert(
                            title: Text("Error"),
                            message: Text("please fill out the requirments."),
                            primaryButton: .default(Text("OK"), action: {
                                // Handle the OK button action
                                isAlertPresented = false
                            }),
                            secondaryButton: .cancel(Text("Cancel"), action: {
                                // Handle the Cancel button action
                                isAlertPresented = false
                            })
                        )
                    }
                    
                    Spacer()
                }
                
                
            }
        }detail:{
            Text("Select a Landmark")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = College(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}

struct input: View{
    @Binding var text: String
    var placeholder: String
    var label:String
    var body: some View {
        VStack(alignment: .leading){
            Text(label)
                .font(.system(size: 20 , weight: .medium , design: .default))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                
                
            TextField(placeholder, text: $text ).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
        }.padding(.leading)
    }
    
}

