//
//  AllCollegesView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import Foundation
import SwiftUI
import CoreData






struct AllCollegesView: View {
//    @ObservedObject var dataManager = DataManager()
    @State var colleges: [College] = []
    @State private var  selectedCollege: College?
    
    var body: some View {
        VStack{
            List{
                ForEach(colleges, id: \.self) { college in
                    NavigationLink(
                                 destination: CollegeInfo(college: college),
                                 tag: college,
                                 selection: $selectedCollege
                             ) {
                                 Text(college.name ?? "")
                             }
                             .onTapGesture {
                                 selectedCollege = college
                             }
                }
                
            }
            
        }
        .onAppear {
                   // Load colleges from Core Data
            colleges = DataManager.shared.fetchData()
               }
    }
        
}
