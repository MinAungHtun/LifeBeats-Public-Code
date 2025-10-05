//
//  AllBadges2.swift
//  LifeBeats
//
//  Created by User on 5/12/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct AllBadges2: View {
    @State private var showingAlert = false
    @State private var title : String = " "
    @State private var textBody : String = " "
//    @State var b1 : Bool = false
//    @State var b2 : Bool = false
//    @State var b3 : Bool = false
//    @State var b4 : Bool = false
//    @State var b5 : Bool = false
//    @State var b6 : Bool = false
//    @State var b7 : Bool = false
//    @State var b8 : Bool = false
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    var body: some View {
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
            HStack{
                Button(action:{self.showingAlert = true; self.title = "Office Maestro"; self.textBody = "Complete all Mindfulness at Work sessions";})
                {
                VStack{
                    Image("Office Maestro").resizable().frame(width: 65, height: 60)
                    Text("Office Maestro").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
                }.padding(.leading, 1)
                }
            
                Button(action:{self.showingAlert = true; self.title = "Ace that Test"; self.textBody = "Complete all Student Living sessions";})
                {
                VStack{
                Image("Ace That Test").resizable().frame(width: 65, height: 60)
                    Text("Ace that Test").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
                }.padding(.leading, 15)
                }
                Button(action:{self.showingAlert = true; self.title = "Daily Check In"; self.textBody = "Track mood on chat bot for 7 days in a row";})
                {
                VStack{
                Image("Daily Check In").resizable().frame(width: 65, height: 60)
                    Text("Daily Check In").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
                }.padding(.leading, 15)
                }
            }
            }.padding()

            HStack{
                Button(action:{self.showingAlert = true; self.title = "Sleepy Head"; self.textBody = "Set Sleep Reminder";})
                {
                VStack{
                Image("Sleepyhead").resizable().frame(width: 65, height: 60)
                    Text("Sleepy Head").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
                }.padding(.leading, 5)
                }
            
                Button(action:{self.showingAlert = true; self.title = "First Steps"; self.textBody = "Set Mindfulness Reminder";})
                {
                VStack{
                Image("First Steps").resizable().frame(width: 65, height: 60)
                    Text("First Steps").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
                }.padding(.leading, 15)
                }
            }.padding()

        }.padding(.bottom, UIScreen.main.bounds.width/1.5)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.title), message: Text(self.textBody), dismissButton: .default(Text("Awesome")))
        
                }
    }
}

struct AllBadges2_Previews: PreviewProvider {
    static var previews: some View {
        AllBadges2()
    }
}
