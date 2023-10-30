//
//  iCampousHubApp.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import SwiftUI

@main
struct iCampousHubApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
   
            WindowGroup {
                NavigationView {
                    SplashSwiftUIView()

            }
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
