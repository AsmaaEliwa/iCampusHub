//
//  myBtn.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 21/10/2023.
//

import Foundation
import SwiftUI

struct myBtn: View{
    var title:String
    var body: some View {
  
        Text(title).padding(10)
            .background(.white)
            .font(.system(size: 25 ,weight: .medium))
            .cornerRadius(15).foregroundColor(.brown)
            .padding()
    
    }
}
