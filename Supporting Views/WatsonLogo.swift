//
//  WatsonLogo.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 4/5/20.


import SwiftUI

struct WatsonLogo: View {
    
    var body: some View {
        VStack{
                    NavigationLink(destination: WatsonView()){
                        Image("Logo").renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 2))
                        .shadow(radius: 20)
                        .accessibility(label: Text("AI Chat"))                .frame(width: 30.0, height: 30.0)
                    }
            
        }
    }
}


struct WatsonLogo_Previews: PreviewProvider {
    static var previews: some View {
        WatsonLogo()
    }
}
