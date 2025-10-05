//
//  AllBadges.swift
//  LifeBeats
//
//  Created by User on 1/23/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct AllBadges: View {
    @State private var showingAlert = false
    @State private var title : String = " "
    @State private var textBody : String = " "
    @State var b1 : Bool = false
    @State var b2 : Bool = false
    @State var b3 : Bool = false
    @State var b4 : Bool = false
    @State var b5 : Bool = false
    @State var b6 : Bool = false
    @State var b7 : Bool = false
    @State var b8 : Bool = false
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false){
        
        VStack{
            ScrollView(.horizontal, showsIndicators: false){
        HStack{
            Button(action:{self.showingAlert = true; self.title = "Curiosity"; self.textBody = "Accessed and completed every therapy in Lifebeats";})
            {
            VStack{
            Image("Curiosity").resizable().frame(width: 60, height: 60)
                Text("    Curiosity    ").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 5)
            }
            Button(action:{self.showingAlert = true; self.title = "In The Zone"; self.textBody = "Complete 3 Deep Focus sessions";})
            {
            VStack{
            Image("In The Zone").resizable().frame(width: 60, height: 60)
                Text(" In The Zone ").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            Button(action:{self.showingAlert = true; self.title = "Lifebeats Lite"; self.textBody = "Logged into app for the first time";})
            {
            VStack{
            Image("Lifebeats Lite").resizable().frame(width: 80, height: 80)
                Text("  Lifebeats Lite  ").font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor).padding(.top, -15)
            }.padding(.leading, 20).padding(.top, -5)
            }
            }
            }.padding()
            ScrollView(.horizontal, showsIndicators: false){
            HStack{
            Button(action:{self.showingAlert = true; self.title = "Lifebeats Pro"; self.textBody = "Logged in 30 days in a row";})
            {
            VStack{
            Image("Lifebeats Pro").resizable().frame(width: 80, height: 80)
                Text(" Lifebeats Pro ").font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor).padding(.top, -15)
            }.padding(.leading, 5).padding(.top, -5)
            }
            Button(action:{self.showingAlert = true; self.title = "Lullaby"; self.textBody = "Complete first sleep session";})
            {
            VStack{
                Image("Lullaby").resizable().frame(width: 60, height: 60)
                Text("    Lullaby    ").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            
            Button(action:{self.showingAlert = true; self.title = "Zen Master"; self.textBody = "Complete 180 minutes of meditation";})
            {
            VStack{
            Image("Zen Master").resizable().frame(width: 60, height: 60)
                Text("   Zen Master   ").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            }.padding()
            ScrollView(.horizontal, showsIndicators: false){
            HStack{
            Button(action:{self.showingAlert = true; self.title = "Mindful Beginner"; self.textBody = "Complete first meditation session";})
            {
            VStack{
            Image("Mindful Beginner").resizable().frame(width: 60, height: 60)
                Text("Mindful Beginner").font(Font.custom("Nexa Bold", size: 12)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 1)
            }
            
            Button(action:{self.showingAlert = true; self.title = "Mindful Veteran"; self.textBody = "Complete 60 minutes of meditation";})
            {
            VStack{
            Image("Mindful Veteran").resizable().frame(width: 60, height: 60)
                Text("Mindful Veteran").font(Font.custom("Nexa Bold", size: 12)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 15)
            }
            Button(action:{self.showingAlert = true; self.title = "Love Thyself"; self.textBody = "Complete all Self Love sessions";})
            {
            VStack{
            Image("Love Thyself").resizable().frame(width: 65, height: 60)
                    Text("Love Thyself").font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 15)
            }
            }
            }.padding()
            //AllBadges2()
            
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
        }.padding(.top, -10)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.title), message: Text(self.textBody), dismissButton: .default(Text("Awesome")))
        
                }
        }
    }
//}

struct AllBadges_Previews: PreviewProvider {
    static var previews: some View {
        AllBadges()
    }
}
