//
//  Sleep.swift
//  LifeBeats
//
//  Created by User on 10/13/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct Sleep: View {
    var bgTrack : bgTrack
    var body: some View {
        if(bgTrack.name == "Lullaby")
        {
            Lullaby()
        }
        else if(bgTrack.name == "Ocean Dreaming")
        {
            OceanDreaming()
        }
        else if(bgTrack.name == "Sleepy Soundscapes Album")
        {
            SSoundAlbum()
        }
        else if(bgTrack.name == "Sleepy Acoustics")
        {
            SleepyAcoustics()
        }
        else if(bgTrack.name == "Relaxing Lullabies")
        {
            RelaxingLullabies()
        }
        else if(bgTrack.name == "Dreamy Slumber")
        {
            DreamySlumber()
        }
    }
}

struct RelaxingLullabies : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
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
    }
}


struct SleepyAcoustics : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
          
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Sleepy Acoustics"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                                          }
            }
            
        }
    }
}

struct DreamySlumber : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
          
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Dreamy Slumber"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                                          }
            }
            
        }
    }
}

struct Lullaby : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
          
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Lullaby"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.changeBG()
                        
//                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
//                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.mp3Name;
//                        GlobalPlayer.sharedInstance.playingFreeBG = true;
//                        GlobalPlayer.sharedInstance.changeBGTrackLocal()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                                          }
            }
            
        }
    }
}

struct SSoundAlbum : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
          
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Sleepy Soundscapes Album"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                                          }
            }
            
        }
    }
}


struct  OceanDreaming : View
{
    @EnvironmentObject var userData: UserData
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
          
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Ocean Dreaming"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.loopingPlayer = false;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                                          }
            }
            
        }
    }
}
struct Sleep_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        Sleep(bgTrack: userData.bgTracks[161]).environmentObject(UserData())
    }
}
