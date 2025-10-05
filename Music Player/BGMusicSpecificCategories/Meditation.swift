//
//  Meditation.swift
//  LifeBeats
//
//  Created by User on 10/13/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct Meditation: View {
    var bgTrack : bgTrack
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @EnvironmentObject var userData: UserData
    var body: some View {
        ScrollView(.vertical, showsIndicators: false)
        {
            LazyVStack(alignment: .leading, spacing: 0)
            {
                if(bgTrack.name == "Mindfulness"){
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Mindfulness"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                }}
                else if(bgTrack.name == "Relax Breathing"){
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Relax Breathing"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                }}
                else if(bgTrack.name == "Japanese Spa"){
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Japanese Spa"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                }}
                else if(bgTrack.name == "Calm Shores"){
                VStack(alignment: .leading, spacing: 0) {
                ForEach(self.categories["Calm Shores"]!) { bgTrack in
                    Button(action: {
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL;
                        GlobalPlayer.sharedInstance.changeBG()
                    }){
                        BGTracksListItem(bgTrack: bgTrack)}
                                              }

                }}
            }
            
        }
    }
}

struct Meditation_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        Meditation(bgTrack: userData.bgTracks[161]).environmentObject(UserData())
    }
}
