//
//  SystemButton.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 28/10/2023.
//

import SwiftUI

struct SystemButton: View {
    var title:String
    var body: some View {
        Button{
            
        }label: {
            Label(title ,systemImage: "book.fill")
        }.buttonStyle(.bordered)
            .controlSize(.large)
            .tint(.brown)
//                }
    }
}

struct SystemButton_Previews: PreviewProvider {
    static var previews: some View {
        SystemButton(title: "get started")
    }
}
