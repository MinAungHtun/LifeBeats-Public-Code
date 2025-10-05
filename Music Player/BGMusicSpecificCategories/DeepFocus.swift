//
//  DeepFocus.swift
//  LifeBeats
//
//  Created by User on 10/13/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct DeepFocus: View {
    var bgTrack : bgTrack
    var body: some View {
        if(bgTrack.name == "Jazz")
        {
            Jazz()
        }
        else if(bgTrack.name == "Acoustic Focus")
        {
            AcousticFocus()
        }
        else if(bgTrack.name == "EDM Focus")
        {
            EDMFocus()
        }
        else if(bgTrack.name == "Focus Beats Album")
        {
            FocusBeatsAlbum()
        }
        else if(bgTrack.name == "Soothing Focus")
        {
            SoothingFocus()
        }
        else if(bgTrack.name == "Hypnotic Focus")
        {
            HypnoticFocus()
        }
    }
}

struct HypnoticFocus : View
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

                    ForEach(self.categories["Hypnotic Focus"]!) { bgTrack in
                        Button(action: {
                            GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                            GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                            GlobalPlayer.sharedInstance.loopingPlayer = false;
                            GlobalPlayer.sharedInstance.playingFreeBG = true;
                            GlobalPlayer.sharedInstance.changeBG()
                        }){
                            BGTracksListItem(bgTrack: bgTrack)}                                          }
                }
            }
            
        }
    }
}

struct Jazz : View
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
                ForEach(self.categories["Jazz"]!) { bgTrack in
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

struct AcousticFocus : View
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
                ForEach(self.categories["Acoustic Focus"]!) { bgTrack in
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

struct EDMFocus : View
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
                ForEach(self.categories["EDM Focus"]!) { bgTrack in
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

struct FocusBeatsAlbum : View
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
                ForEach(self.categories["Focus Beats Album"]!) { bgTrack in
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

struct SoothingFocus : View
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
                ForEach(self.categories["Soothing Focus"]!) { bgTrack in
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

struct DeepFocus_Previews: PreviewProvider {
    
    static var previews: some View {
        let userData = UserData()
        DeepFocus(bgTrack: userData.bgTracks[161]).environmentObject(UserData())
    }
}
