//
//  TherapyColumn.swift
//  LifeBeats
//
//  Created by User on 5/4/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI


struct QuickRemediesColumn: View {
    
    let userData = UserData()

    
    var body: some View
    {
        VStack{
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[7]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[7])
                        }
                        
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[8]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[8])
                        }
                        }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[9]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[9])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[10]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[10])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[11]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[11])
                            }
                            
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[14]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[14])
                            }
                            }
                    }
                }
        }
    }
}

struct AceYourDayColumn: View {
    
    let userData = UserData()
    
    var body: some View
    {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[12]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[12])
                        }
                        
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[19]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[19])
                        }
                        }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[20]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[20])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[21]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[21])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[22]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[22])
                            }
                            }
                        
                    }
                    }
    }
}

struct StudentLivingColumn: View {
    
    let userData = UserData()
    
    var body: some View
    {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[13]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[13])
                        }
                        
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[15]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[15])
                        }
                        }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[23]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[23])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[24]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[24])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[25]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[25])
                            }
                            }
                        
                    }
                    }
    }
}

struct MindfulnessAtWorkColumn: View {
    
    let userData = UserData()
    
    var body: some View
    {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[26]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[26])
                        }
                        
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[27]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[27])
                        }
                        }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[28]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[28])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[29]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[29])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[30]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[30])
                            }
                            }
                        
                    }
                    }
    }
}

struct SelfLoveColumn: View {
    
    let userData = UserData()
    
    var body: some View
    {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                    HStack(alignment: .top, spacing: 0){
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[31]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[31])
                        }
                        
                        NavigationLink(
                             destination: TherapyDetail(
                                 therapy: userData.therapies[32]
                             ).environmentObject(UserData())
                         )
                        {
                            ColumnCategoryItem(therapy: userData.therapies[32])
                        }
                        }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[33]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[33])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[34]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[34])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[35]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[35])
                            }
                            }
                        
                    }
                    }
    }
}


struct BeginnerMindfulnessColumn: View {
    
    let userData = UserData()
    
    var body: some View
    {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[41]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[41])
                            }
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[42]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[42])
                            }
                            }
                        
                        HStack(alignment: .top, spacing: 0){
                            NavigationLink(
                                 destination: TherapyDetail(
                                     therapy: userData.therapies[43]
                                 ).environmentObject(UserData())
                             )
                            {
                                ColumnCategoryItem(therapy: userData.therapies[43])
                            }
                            }
                        
                    }
                    }
    }
}

struct TherapyColumn: View {
    var name: String
    
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }
    @State var payBufferToggle : Bool = false
   // @State var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var player : Bool = false
    @State var paused : Bool = false
    @State var playing : Bool = false
    //GlobalPlayer.sharedInstance.playing
    @State var enlargePlayer : Bool = false
    @State var categoryName : String = " "
    @State var greetingText : String = " "
    @State var therapyName : String = " "
    @State var description : String = " "
    @State var duration : String = " "
    let userData = UserData()
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.name).font(Font.custom("Nexa Bold", size: 20))
        .fontWeight(.heavy)
          .padding(.leading, 15)
          .padding(.top, 5)
            VStack{
            if(self.name == "Quick Remedies")
            {
                QuickRemediesColumn()
            }
            else if(self.name == "Ace Your Day")
            {
                AceYourDayColumn()
            }
            else if(self.name == "Student Living")
            {
                StudentLivingColumn()
            }
            else if(self.name == "Mindfulness at Work")
            {
                MindfulnessAtWorkColumn()
            }
            else if(self.name == "Self Love")
            {
                SelfLoveColumn()
            }
            else if(self.name == "Beginner Mindfulness")
            {
                BeginnerMindfulnessColumn()
            }
            }
            .sheet(isPresented: $payBufferToggle)
            {
                PaymentBuffer()
            }
            if(self.premium == false)
            {
                Button(action: {self.payBufferToggle.toggle()})
                    {Text("Remove Ads").font(Font.custom("Nexa Bold", size: 16))}.padding(.leading, 150)
                AdsView()
            }
        if(self.player == true)
        {
            NavigationLink(destination:                 EnlargedMinimizedPlayer(categoryName: self.categoryName, therapyName: self.therapyName, description: self.description, duration: self.duration, playing: self.paused))
            {
            HStack(spacing: 30)
            {
                VStack{
                    Text(self.therapyName).font(Font.custom("Nexa Bold", size: 16)).padding(.top, 5).padding(.trailing, 5).padding(.leading, 5)
                    Text(self.categoryName).font(Font.custom("Nexa Bold", size: 12))
                }
                if(self.paused == true)
                {
                    Button(action:
                            {GlobalPlayer.sharedInstance.continueMusic();
                                self.paused=false;self.playing=true
                    })
                    {
                    Image(systemName: "play.fill")
                    }
                    .padding()
                }
                else if(self.paused == false){
                    Button(action: {GlobalPlayer.sharedInstance.pauseMusic();self.paused=true;self.playing=false;
                })
                {
                Image(systemName: "pause.fill")
                }
                .padding()
                }
                Button(action: {GlobalPlayer.sharedInstance.stopMusic();self.player = false})
                {
                Image(systemName: "multiply.circle")
                }
                .padding()
            }
            }.padding(.leading, 50)
            .padding(.bottom, 15)
        }

        }
        .onReceive(timer) { _ in
            self.player = GlobalPlayer.sharedInstance.playing
            self.therapyName = GlobalPlayer.sharedInstance.therapySongName ?? " "
            self.paused = GlobalPlayer.sharedInstance.paused
            self.categoryName = GlobalPlayer.sharedInstance.categoryName ?? " "
self.description = Singletons.sharedInstance.therapyDescription ?? " "
self.duration = Singletons.sharedInstance.duration ?? " "
//            if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//            {
//                GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//                GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//            }
            
        }
    }
}

struct TherapyColumn_Previews: PreviewProvider {
    static var previews: some View {
        Text("1")
    }
}
