//
//  ASMRRow.swift
//  LifeBeats
//
//  Created by User on 8/24/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct ASMRRow: View {
    @EnvironmentObject var userData: UserData
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    @State var color2 : Color = .primary
    @State var color3 : Color = .primary

    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    @State var highlightc : Int = 0
    @State var highlightd : Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        Text("ASMR").font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 20)
        
        VStack(alignment: .leading, spacing: 0) {
        
            Button(action:{
                if(self.highlighta == 0)
                {
                    self.highlighta = 1;
                    self.color = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if (self.highlighta == 1)
                {
                    self.highlighta = 0;
                    self.color = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }

                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;

                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = true
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[239].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[239].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
                GlobalPlayer.sharedInstance.loopingPlayer = true;
                GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[239].mp3Name
                //self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
                //self.shuffleFreeHypnotic()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[239], color: self.color)
            }
            
            Button(action:{
                if(self.highlightb == 0)
                {
                    self.highlightb = 1;
                    self.color1 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if (self.highlightb == 1)
                {
                    self.highlightb = 0;
                    self.color1 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }

                self.highlighta = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color = .primary;
                self.color2 = .primary;
                self.color3 = .primary;

                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = true
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[240].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[240].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
                GlobalPlayer.sharedInstance.loopingPlayer = true;
                GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[240].mp3Name
                //self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
                //self.shuffleFreeHypnotic()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[240], color: self.color1)
            }
            
            Button(action:{
                if(self.highlightc == 0)
                {
                    self.highlightc = 1;
                    self.color2 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if (self.highlightc == 1)
                {
                    self.highlightc = 0;
                    self.color2 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }

                self.highlightb = 0;
                self.highlighta = 0;
                self.highlightd = 0;
                self.color1 = .primary;
                self.color = .primary;
                self.color3 = .primary;

                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = true
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[241].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[241].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
                GlobalPlayer.sharedInstance.loopingPlayer = true;
                GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[241].mp3Name
                //self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
                //self.shuffleFreeHypnotic()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[241], color: self.color2)
            }
            
            Button(action:{
                if(self.highlightd == 0)
                {
                    self.highlightd = 1;
                    self.color3 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if (self.highlightd == 1)
                {
                    self.highlightd = 0;
                    self.color3 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }

                self.highlightb = 0;
                self.highlightc = 0;
                self.highlighta = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color = .primary;

                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = true
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[242].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[242].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
                GlobalPlayer.sharedInstance.loopingPlayer = true;
                GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[242].mp3Name
                //self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
                //self.shuffleFreeHypnotic()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[242], color: self.color3)
            }

        }        .padding(.top, 5)
        .padding(.bottom, 10)
        //.padding()
        .onReceive(timer) { _ in
            
            if(GlobalPlayer.sharedInstance.bgCategoryBuffer == false)
            {
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color = .primary;
            }
            
        }
        .onAppear(perform: {
            self.highlighta = 0
            self.highlightb = 0
            self.highlightc = 0
            self.highlightd = 0
            self.color = .primary
            self.color1 = .primary
            self.color2 = .primary
            self.color3 = .primary
        })
    }
}

struct ASMRRow_Previews: PreviewProvider {
    static var previews: some View {
        ASMRRow()
    }
}
