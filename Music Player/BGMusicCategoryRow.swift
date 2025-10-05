//
//  BGMusicCategoryRow.swift
//  LifeBeats
//
//  Created by User on 9/21/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BGMusicCategoryRow: View{
    var category : String
    @State var selectedTrack : String = " "
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("SelectedTrack: \(self.selectedTrack)").padding(.leading, 15)

            //ScrollView(.vertical, showsIndicators: false){
            
            if(self.category == "Deep Focus")
            {
                VStack{
                Text("Nature")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Nature"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                }
                
                VStack{
                Text("Jazz")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Jazz"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                }
                VStack
                {
                Text("EDM Focus")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["EDM Focus"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                
                Text("Acoustic Focus")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Acoustic Focus"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                Text("Focus Beats Album")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Focus Beats Album"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                
                Text("Hypnotic Focus")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Hypnotic Focus"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                }
                
    
            }
            else if (self.category == "Sleep")
             {
                
                
                VStack
                {
                Text("Nature")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Nature"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                
                Text("Lullaby")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Lullaby"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                Text("Ocean Dreaming")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Ocean Dreaming"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                
                Text("Sleepy Soundscapes Album")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Sleepy Soundscapes Album"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                }
                
             }
            else if (self.category == "Meditation")
             {
                
                
                VStack
                {
                Text("Nature")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Nature"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                
                Text("Mindfulness")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Mindfulness"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                }
                
             }
            else if (self.category == "Quick Remedies")
             {
                
                
                VStack
                {
                Text("Nature")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Nature"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                }
                
             }
            else if (self.category == "Fitness")
             {
                
                
                VStack
                {
                Text("Fitness")
                                        .font(.headline)
                                        .fontWeight(.bold)
                                          .padding(.leading, 15)
                                          .padding(.top, 5)
                ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                ForEach(self.categories["Fitness"]!) { bgTrack in
                    Button(action: {self.selectedTrack = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackName = bgTrack.name;
                        GlobalPlayer.sharedInstance.backgroundTrackURL = bgTrack.URL
                    }){
                                                    BGTracksItem(bgTrack: bgTrack)}
                                              }
                                          }
                                      }.frame(height: 200)
                
                }
                
             }
                
                
            }
        
}
}

struct BGMusicCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        BGMusicCategoryRow(category: "Deep Focus")
    }
}
