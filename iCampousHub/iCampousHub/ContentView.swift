//
//  ContentView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
   
    var body: some View {
        
            ZStack{
                LinearGradient(gradient: Gradient(colors: [ .white , .brown]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Add A College").font(.system(size: 35 , weight: .medium , design: .default)).foregroundColor( .brown)
                        .padding(30)
                   
                    
                    VStack{
                        input(placeholder: "Enter College Name",label: "The College Name")
                        input(placeholder: "Enter College Address",label: "The Address")
                        input(placeholder: "Enter College Address",label: "The Address")
                        input(placeholder: "Enter College Address",label: "The Address")
                       
                        Button{
                            
                        }label: {
                            Text("Add College").padding(10)
                                .background(.white)
                                .font(.system(size: 25 ,weight: .medium))
                                .cornerRadius(15).foregroundColor(.brown)
                            
                        }.padding()
                        
                    }
                    Spacer()
                }
               
               
            }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
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
    @State private var text: String = ""
    var placeholder: String
    var label:String
    var body: some View {
        VStack{
            Text(label)
                .font(.system(size: 20 , weight: .medium , design: .default))
                .multilineTextAlignment(.leading)
                .frame(alignment: .leading)
                
                
            TextField(placeholder, text: $text ).textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
        }
    }
    
}
