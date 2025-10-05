//
//  FebeFace.swift
//  LifeBeats
//
//  Created by User on 4/24/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct FebeFace: View {
    var body: some View {
        VStack{
            Image("Febe").resizable().renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 2))
                        .shadow(radius: 20)
                        .accessibility(label: Text("Febe"))
                            .frame(width: 45.0, height: 45.0)
        }
    }
}

struct MemberFace: View {
    
    var imageName : String
   // var name : String
    var body: some View {
        VStack{
            Image(imageName).resizable().renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.white,lineWidth: 2))
                        .shadow(radius: 20)
                        .accessibility(label: Text("Febe"))
                            .frame(width: 40.0, height: 40.0)
           // Text(name).font(Font.custom("Nexa Bold", size: 10))
        }
    }
}

struct FebeFace_Previews: PreviewProvider {
    static var previews: some View {
        FebeFace()
    }
}
