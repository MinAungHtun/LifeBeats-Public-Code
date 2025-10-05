//
//  BadgeRow2.swift
//  LifeBeats
//
//  Created by User on 5/12/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BadgeRow2: View {
    @State private var showingAlert = false
    @State private var title : String = " "
    @State private var textBody : String = " "
    @State var b9 : Bool = false
    @State var b10 : Bool = false
    @State var b11 : Bool = false
    @State var b12 : Bool = false
    @State var b13 : Bool = false
    @State var b14 : Bool = false
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
        LazyHStack{
            if(self.b9 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Love Thyself"; self.textBody = "Complete all Self Love sessions";})
            {
            VStack{
                Image("Love Thyself").resizable().background(lifeBeatsColor).frame(width: 65, height: 60)
                Text("Love Thyself").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b10 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Office Maestro"; self.textBody = "Complete all Mindfulness at Work sessions";})
            {
            VStack{
            Image("Office Maestro").resizable().frame(width: 65, height: 60)
                Text("Office Maestro").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b11 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Ace that Test"; self.textBody = "Complete all Student Living sessions";})
            {
            VStack{
            Image("Ace That Test").resizable().frame(width: 65, height: 60)
                Text("Ace that Test").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b12 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Daily Check In"; self.textBody = "Track mood on chat bot for 7 days in a row";})
            {
            VStack{
            Image("Daily Check In").resizable().frame(width: 65, height: 60)
                Text("Daily Check In").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b13 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Sleepy Head"; self.textBody = "Set Sleep Reminder";})
            {
            VStack{
            Image("Sleepyhead").resizable().frame(width: 65, height: 60)
                Text("Sleepy Head").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b14 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "First Steps"; self.textBody = "Set Mindfulness Reminder";})
            {
            VStack{
            Image("First Steps").resizable().frame(width: 65, height: 60)
                Text("First Steps").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }

        }.onAppear(perform: {
            self.b9 = UserDefaults.standard.bool(forKey: "b9")
            //print(self.b1)
            self.b10 = UserDefaults.standard.bool(forKey: "b10")
            self.b11 = UserDefaults.standard.bool(forKey: "b11")
            self.b12 = UserDefaults.standard.bool(forKey: "b12")
            self.b13 = UserDefaults.standard.bool(forKey: "b13")
            self.b14 = UserDefaults.standard.bool(forKey: "b14")
        })
        }//.background(lifeBeatsColor)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.title), message: Text(self.textBody), dismissButton: .default(Text("Awesome")))
        
                }


    }
}

struct BadgeRow2_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRow2()
    }
}
