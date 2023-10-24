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
        LinearGradient(gradient: Gradient(colors: [ .white , .brown]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading){
            Text("College Name : \(college.name ?? "not Found")" )
            Spacer()
            Text("College Address : \(college.adress ?? "not Found")" )
            Spacer()
            Text("Number of Students  : \(college.nOfStudents ?? "not Found")" )
            Spacer()
            Text("College Payment : \(college.payment ?? 0 )" )
            Spacer()
        }
        
    }
}
