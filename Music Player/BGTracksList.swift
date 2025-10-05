//
//  BGTracksList.swift
//  LifeBeats
//
//  Created by User on 10/5/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BGTracksList: View {
    
    var category : String
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }
    @EnvironmentObject var userData: UserData
    
    var body: some View {
    ScrollView(.vertical, showsIndicators: true)
    {
        LazyVStack(alignment: .leading)
        {
            if(self.category == "Deep Focus")
            {

                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Nature"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.playingFreeBG = true;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }
                    
                    ForEach(self.categories["ASMR"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            //GlobalPlayer.sharedInstance.loopingPlayer = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = true;
                            GlobalPlayer.sharedInstance.backgroundVideoName = bgTrack.mp3Name
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }

                                          }

                
                
                if(self.premium == true)
                {
                VStack(alignment: .leading, spacing: 0) {
                    
                    
                    ForEach(self.categories["Soothing Beats"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            //GlobalPlayer.sharedInstance.loopingPlayer = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = true;
                            GlobalPlayer.sharedInstance.backgroundVideoName = bgTrack.mp3Name
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                    
                    ForEach(self.categories["Laid Back Focus Beats"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            //GlobalPlayer.sharedInstance.loopingPlayer = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = true;
                            GlobalPlayer.sharedInstance.backgroundVideoName = bgTrack.mp3Name
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                    
                ForEach(self.categories["Deep Focus"]!) { bgTrack in
                    NavigationLink(destination: DeepFocus(bgTrack: bgTrack).environmentObject(UserData())){
                                                    BGTracksListItem(bgTrack: bgTrack)}
                                              }
                    

                                          }
                }
                else if(self.premium == false)
                {
                    VStack(alignment: .leading, spacing: 0) {

                        ForEach(self.categories["Hypnotic Focus"]!) { bgTrack in
                            Button(action: {
                                GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                                GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                                GlobalPlayer.sharedInstance.playingFreeBG = true;
                                GlobalPlayer.sharedInstance.loopingPlayer = false;
                                GlobalPlayer.sharedInstance.changeBG()
                            }){
                                BGTracksListItem(bgTrack: bgTrack)}                                          }
                    }
                }
                                     
                
            }
            else if (self.category == "Sleep")
             {


                VStack(alignment: .leading, spacing: 0) {

                    ForEach(self.categories["Nature"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                    
                    ForEach(self.categories["ASMR"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.backgroundVideoName = bgTrack.mp3Name
                            //GlobalPlayer.sharedInstance.loopingPlayer = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                    
                    ForEach(self.categories["Nature Lullabies"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.backgroundVideoName = bgTrack.mp3Name
                            //GlobalPlayer.sharedInstance.loopingPlayer = true;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                }
                
//                VStack(alignment: .leading, spacing: 0) {
//
//                    ForEach(self.categories["Relaxing Lullabies"]!) { bgTrack in
//                        Button(action: {
//                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
//                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.mp3Name;
//                            GlobalPlayer.sharedInstance.playingFreeBG = true;
//                            GlobalPlayer.sharedInstance.changeBGTrackLocal()
//                        }){
//                            BGTracksListItem(bgTrack: bgTrack)}                                          }
//                }

                
                if(self.premium == true)
                {
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Sleep"]!) { bgTrack in
                    NavigationLink(destination: Sleep(bgTrack: bgTrack).environmentObject(UserData())){
                                                    BGTracksListItem(bgTrack: bgTrack)}
                                              }
                                          }
                }
                else if(self.premium == false)
                {
                    VStack(alignment: .leading, spacing: 0) {

                        ForEach(self.categories["Relaxing Lullabies"]!) { bgTrack in
                            Button(action: {
                                GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                                GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                                GlobalPlayer.sharedInstance.playingFreeBG = true;
                                GlobalPlayer.sharedInstance.loopingPlayer = false;
                                GlobalPlayer.sharedInstance.changeBG()
                            }){
                                BGTracksListItem(bgTrack: bgTrack)}                                          }
                    }
                }
             }
            else if (self.category == "Meditation")
             {
                
                


                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.categories["Nature"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}
                    
                                    }
                    
                    ForEach(self.categories["Calm Breathing"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}
                    
                                    }
                }
                

                Button(action:{
                    GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[172].name;
                    GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[172].URL;
                    GlobalPlayer.sharedInstance.playingFreeBG = true;
                    GlobalPlayer.sharedInstance.changeBG()

                }){
                        BGTracksListItem(bgTrack: self.userData.bgTracks[172])
                    
                }

                                      
                if(self.premium == true)
                {
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Meditation"]!) { bgTrack in
                    NavigationLink(destination: Meditation(bgTrack: bgTrack).environmentObject(UserData())){
                                                    BGTracksListItem(bgTrack: bgTrack)}
                                              }
                                          }
                }
             }
            else if (self.category == "Quick Remedies" || self.category == "Ace Your Day" || self.category == "Student Living" || self.category == "Mindfulness at work" || self.category == "Self Love")
             {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.categories["Nature"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}
                                          }
                }
             }
            else if (self.category == "Fitness Prep")
             {
                VStack(alignment: .leading, spacing: 0) {
                                    ForEach(self.categories["Fitness"]!) { bgTrack in
                                        Button(action: {
                                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                                            GlobalPlayer.sharedInstance.changeBG()
                                        }){
                                            BGTracksListItem(bgTrack: bgTrack)}
                                                                  }
                                          }
             }
            else
            {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.categories["Nature"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}
                                          }
                }
            }
        }.padding(.leading, 10)
    }
}
}

struct BGTracksListItem: View {
    var bgTrack : bgTrack
    var body: some View {
        VStack(alignment: .leading) {
            Text(bgTrack.name)
                .foregroundColor(.primary)
                .font(Font.custom("Nexa Bold", size: 16))
                .padding(.leading, 20)
            Text(bgTrack.category.rawValue)
                .foregroundColor(.primary)
                .font(Font.custom("Nexa Bold", size: 12))
                .padding(.leading, 20)
        }
        .padding(.trailing, 100)
        .frame(height: 50)
    }
}

struct BGTracksList_Previews: PreviewProvider {
    static var previews: some View {
        BGTracksList(category: "Deep Focus")    .environmentObject(UserData())
    }
}
