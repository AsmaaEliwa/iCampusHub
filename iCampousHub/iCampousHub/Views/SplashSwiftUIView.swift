//
//  SplashSwiftUIView.swift
//  iCampousHub
//
//  Created by asmaa gamal  on 28/10/2023.
//

import SwiftUI

struct SplashSwiftUIView: View {
 

    var body: some View {
        
        ZStack{
            Image("splashImage1") // Replace "splashImage" with the name of your image asset
                .resizable()
//                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity).ignoresSafeArea()
            
//
//            Button{
//
//            }label: {
                NavigationLink(destination: ContentView() ){
                    myBtn(title: "get started")
                   
              
            }
        }
    }
}
struct SplashSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SplashSwiftUIView()
    }
}
