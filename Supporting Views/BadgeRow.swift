//
//  BadgeRow.swift
//  LifeBeats
//
//  Created by User on 12/11/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct BadgeRow: View {
    
    
//    @State private var showingAlert = false
//    @State private var title : String = " "
//    @State private var textBody : String = " "
//    @State var b1 : Bool = false
//    @State var b2 : Bool = false
//    @State var b3 : Bool = false
//    @State var b4 : Bool = false
//    @State var b5 : Bool = false
//    @State var b6 : Bool = false
//    @State var b7 : Bool = false
//    @State var b8 : Bool = false
//
//    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    var body: some View {
        
        
     ScrollView(.horizontal, showsIndicators: false){
        HStack{
        
        BadgeRow1()
        BadgeRow2()
        
        }
     }
    }
}

struct BadgeRow_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRow()
    }
}
