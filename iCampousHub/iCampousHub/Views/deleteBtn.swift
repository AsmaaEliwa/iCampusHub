//
//  deleteBtn.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 24/10/2023.
//

import SwiftUI

struct deleteBtn: View {
    var color: Color
    var title: String
    var body: some View {
            Text(title).padding(10)
                .background(color)
                .font(.system(size: 25 ,weight: .medium))
                .cornerRadius(15).foregroundColor(.white)
                .padding()
        
        
    }
}

struct deleteBtn_Previews: PreviewProvider {
    static var previews: some View {
        deleteBtn(color: .red, title: "Delete")
    }
}
