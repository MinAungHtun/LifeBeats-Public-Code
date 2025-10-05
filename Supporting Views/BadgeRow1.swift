//
//  BadgeRow1.swift
//  LifeBeats
//
//  Created by User on 5/13/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BadgeRow1: View {
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
        
        ScrollView(.horizontal, showsIndicators: false){
        LazyHStack{
            if(self.b1 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Curiosity"; self.textBody = "Accessed and completed every therapy in Lifebeats";})
            {
            VStack{
            Image("Curiosity").resizable().frame(width: 60, height: 60)
                Text("Curiosity").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b2 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "In The Zone"; self.textBody = "Complete 3 Deep Focus sessions";})
            {
            VStack{
            Image("In The Zone").resizable().frame(width: 60, height: 60)
                Text("In The Zone").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b3 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Lifebeats Lite"; self.textBody = "Logged into app for the first time";})
            {
            VStack{
            Image("Lifebeats Lite").resizable().frame(width: 85, height: 85)
                Text("Lifebeats Lite").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor).padding(.top, -15)
            }.padding(.leading, 20).padding(.top, -5)
            }
            }
            if(self.b4 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Lifebeats Pro"; self.textBody = "Logged in 30 days in a row";})
            {
            VStack{
            Image("Lifebeats Pro").resizable().frame(width: 85, height: 85)
                Text("Lifebeats Pro").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor).padding(.top, -15)
            }.padding(.leading, 20).padding(.top, -5)
            }
            }
            if(self.b5 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Lullaby"; self.textBody = "Complete first sleep session";})
            {
            VStack{
                Image("Lullaby").resizable().frame(width: 60, height: 60)
                Text("Lullaby").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b6 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Zen Master"; self.textBody = "Complete 180 minutes of meditation";})
            {
            VStack{
            Image("Zen Master").resizable().frame(width: 60, height: 60)
                Text("Zen Master").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b7 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Mindful Beginner"; self.textBody = "Complete first meditation session";})
            {
            VStack{
            Image("Mindful Beginner").resizable().frame(width: 60, height: 60)
                Text("Mindful Beginner").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
            if(self.b8 == true)
            {
            Button(action:{self.showingAlert = true; self.title = "Mindful Veteran"; self.textBody = "Complete 60 minutes of meditation";})
            {
            VStack{
            Image("Mindful Veteran").resizable().frame(width: 60, height: 60)
                Text("Mindful Veteran").font(Font.custom("Nexa Bold", size: 14)).foregroundColor(lifeBeatsColor)
            }.padding(.leading, 20)
            }
            }
        }.onAppear(perform: {
            self.b7 = UserDefaults.standard.bool(forKey: "b7")
            //print(self.b1)
            self.b8 = UserDefaults.standard.bool(forKey: "b8")
            self.b6 = UserDefaults.standard.bool(forKey: "b6")
            self.b2 = UserDefaults.standard.bool(forKey: "b2")
            self.b5 = UserDefaults.standard.bool(forKey: "b5")
            self.b1 = UserDefaults.standard.bool(forKey: "b1")
            self.b3 = UserDefaults.standard.bool(forKey: "b3")
            self.b4 = UserDefaults.standard.bool(forKey: "b4")
        })
        }//.background(lifeBeatsColor)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.title), message: Text(self.textBody), dismissButton: .default(Text("Awesome")))
        
                }


    }
}

struct BadgeRow1_Previews: PreviewProvider {
    static var previews: some View {
        BadgeRow1()
    }
}
