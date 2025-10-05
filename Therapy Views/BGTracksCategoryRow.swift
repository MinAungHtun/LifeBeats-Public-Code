//
//  BGTracksCategoryRow.swift
//  LifeBeats
//
//  Created by User on 8/31/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct DeepFocusRow: View
{
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    @State var color2 : Color = .primary
    @State var color3 : Color = .primary
    @State var color4 : Color = .primary
    @State var color5 : Color = .primary
    @State var color6 : Color = .primary
    @State var color7 : Color = .primary
    @State var color8 : Color = .primary
    @State var color9 : Color = .primary
    @State var color10 : Color = .primary
    
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @State var premium : Bool
    @EnvironmentObject var userData: UserData
    
    func shuffleFree()
    {
        let Index = Int.random(in: 0...3)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        GlobalPlayer.sharedInstance.loopingPlayer = false;
    }
    func shuffleFreeHypnotic()
    {
        let Index = Int.random(in: 201...206)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        GlobalPlayer.sharedInstance.loopingPlayer = false;
    }
    func shuffleASMR()
    {
        let Index = Int.random(in: 239...242)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        GlobalPlayer.sharedInstance.loopingPlayer = true;
        GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[Index].mp3Name
    }
    
        func shuffleDeepFocusBG(focusIndex : String)
        {
            //print("1")
            GlobalPlayer.sharedInstance.loopingPlayer = false;
            GlobalPlayer.sharedInstance.playingFreeBG = false
            if(focusIndex == "Acoustic Focus")
            {
                let acousticFocusIndex = Int.random(in: 14...42)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[acousticFocusIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[acousticFocusIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
           else if(focusIndex == "EDM Focus")
            {
                let EDMFocusIndex = Int.random(in: 43...66)
            GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[EDMFocusIndex].name
            GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[EDMFocusIndex].URL
            //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Focus Beats Album")
            {
                let index = Int.random(in: 1...2)
                if(index == 1)
                {
                let FBAindex = Int.random(in: 73...78)
                    GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[FBAindex].name
                    GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[FBAindex].URL
                }
                else if(index == 2)
                {
                let focusBeatsAlbumIndex = Int.random(in: 67...96)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[focusBeatsAlbumIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[focusBeatsAlbumIndex].URL
                }
               // GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Soothing Focus")
            {
                let hypnoticFocusIndex = Int.random(in: 97...117)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[hypnoticFocusIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[hypnoticFocusIndex].URL //mp3name
                //GlobalPlayer.sharedInstance.playingFreeBG = true
            }
            else if(focusIndex == "Soothing Beats")
            {
                let hypnoticFocusIndex = Int.random(in: 249...263)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[hypnoticFocusIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[hypnoticFocusIndex].URL //mp3name
                //GlobalPlayer.sharedInstance.playingFreeBG = true
            }
            else if(focusIndex == "Laid Back Focus Beats")
            {
                let hypnoticFocusIndex = Int.random(in: 264...283)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[hypnoticFocusIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[hypnoticFocusIndex].URL //mp3name
                //GlobalPlayer.sharedInstance.playingFreeBG = true
            }
            else if(focusIndex == "Jazz")
            {
                let jazzFocusIndex = Int.random(in: 151...160)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[jazzFocusIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[jazzFocusIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
        }
    
    
    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    @State var highlightc : Int = 0
    @State var highlightd : Int = 0
    @State var highlighte : Int = 0
    @State var highlightf : Int = 0
    @State var highlightg : Int = 0
    @State var highlighth : Int = 0
    @State var highlighti : Int = 0
    @State var highlightj : Int = 0
    @State var highlightk : Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //@State var popUp : Bool = false
    
    var body: some View
    {
        Text("Free").font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)

        VStack(alignment: .leading, spacing: 0) {
        ForEach(self.categories["Free"]!) { bgTrack in
            Button(action: {
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
                self.highlighte = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color5 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleFree()
            }){
                    BGTracksItem(bgTrack: bgTrack, color: self.color)
                
            }
//            Button(action: {
//                if(self.highlightj == 0)
//                {
//                    self.highlightj = 1;
//                    self.color9 = self.lifeBeatsColor
//                    GlobalPlayer.sharedInstance.BGSelected = true
//                }
//                else if (self.highlightj == 1)
//                {
//                    self.highlightj = 0;
//                    self.color9 = .primary
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//                self.highlightb = 0;
//                self.highlightc = 0;
//                self.highlightd = 0;
//                self.highlighte = 0;
//                self.highlightf = 0;
//                self.color1 = .primary;
//                self.color2 = .primary;
//                self.color3 = .primary;
//                self.color4 = .primary;
//                self.color5 = .primary;
//                self.color6 = .primary;
//                self.highlightg = 0;
//                self.color7 = .primary;
//                self.highlighth = 0;
//                self.highlighti = 0;
//                self.color8 = .primary;
//                self.highlighta = 0;
//                self.color = .primary;
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//                self.shuffleASMR()
//            }){
//                BGTracksItem(bgTrack: self.userData.bgTracks[244], color: self.color9)
//
//            }
            //ASMRRow()
            
            Button(action:{
                if(self.highlighth == 0)
                {
                    self.highlighth = 1;
                    self.color7 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if (self.highlighth == 1)
                {
                    self.highlighth = 0;
                    self.color7 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightg = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color6 = .primary;
                self.color5 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                //self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
                self.shuffleFreeHypnotic()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[196], color: self.color7)
            }
            ASMRRow()
                                      }
                                  }
        .onReceive(timer) { _ in
            
            if(GlobalPlayer.sharedInstance.bgCategoryBuffer == true)
            {
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightg = 0;
                self.highlightf = 0;
                self.highlighth = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color6 = .primary;
                self.color7 = .primary;
                self.color5 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
            }
            
        }
        
        .padding(.top, 5)
        .padding(.bottom, 10)
        
//        Button(action:{
//            if(self.highlightg == 0)
//            {
//                self.highlightg = 1;
//                self.color6 = self.lifeBeatsColor
//                if(self.premium == true)
//                {
//                GlobalPlayer.sharedInstance.BGSelected = true
//                GlobalPlayer.sharedInstance.spotifyPopup = true
//                }
//                else if(self.premium == false)
//                {
//                    GlobalPlayer.sharedInstance.popUpForBG = true
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//            }
//            else if (self.highlightg == 1)
//            {
//                self.highlightg = 0;
//                self.color6 = .primary
//                GlobalPlayer.sharedInstance.BGSelected = false
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//            }
//            self.highlighta = 0;
//            self.highlightb = 0;
//            self.highlightc = 0;
//            self.highlightd = 0;
//            self.highlighte = 0;
//            self.highlightf = 0;
//            self.color1 = .primary;
//            self.color2 = .primary;
//            self.color3 = .primary;
//            self.color4 = .primary;
//            self.color = .primary;
//            self.color5 = .primary;
//            self.color7 = .primary;
//            self.highlighth = 0;
//            self.highlighti = 0;
//            self.color8 = .primary;
//            self.highlightj = 0;
//            self.color9 = .primary;
//            GlobalPlayer.sharedInstance.playingFreeBG = true
//            GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//        }){
//
//            if(self.premium == false)
//            {
//            Text("Spotify 🔒")
//                .foregroundColor(color6)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.trailing, 100)
//            }
//            else if(self.premium == true)
//            {
//            Text("Spotify")
//                .foregroundColor(color6)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.trailing, 100)
//            }
//        }
        
//        Button(action:{
//            if(self.highlighti == 0)
//            {
//                self.highlighti = 1;
//                self.color8 = self.lifeBeatsColor
//                if(self.premium == true)
//                {
//                GlobalPlayer.sharedInstance.BGSelected = true
//                GlobalPlayer.sharedInstance.spotifyPopup = true
//                }
//                else if(self.premium == false)
//                {
//                    GlobalPlayer.sharedInstance.popUpForBG = true
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//            }
//            else if (self.highlighti == 1)
//            {
//                self.highlighti = 0;
//                self.color8 = .primary
//                GlobalPlayer.sharedInstance.BGSelected = false
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//            }
//            self.highlighta = 0;
//            self.highlightb = 0;
//            self.highlightc = 0;
//            self.highlightd = 0;
//            self.highlighte = 0;
//            self.highlightf = 0;
//            self.highlightg = 0;
//            self.color1 = .primary;
//            self.color2 = .primary;
//            self.color3 = .primary;
//            self.color4 = .primary;
//            self.color = .primary;
//            self.color5 = .primary;
//            self.color6 = .primary;
//            self.color7 = .primary;
//            self.highlighth = 0;
//            self.highlightk = 0;
//            self.color10 = .primary;
//            self.highlightj = 0;
//            self.color9 = .primary;
//            GlobalPlayer.sharedInstance.playingFreeBG = true
//            GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//        }){
//
//            if(self.premium == false)
//            {
//            Text("Apple Music 🔒")
//                .foregroundColor(color8)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.top, 20)
//                .padding(.trailing, 100)
//            }
//            else if(self.premium == true)
//            {
//            Text("Apple Music")
//                .foregroundColor(color8)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.top, 20)
//                .padding(.trailing, 100)
//            }
//        }
        
        if(self.premium == false)
        {
        Text("Premium 🔒")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
            .padding(.top, 15)
            
        }
        else if(self.premium == true)
        {
        Text("Premium")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
            .padding(.top, 15)
            
        }
        VStack(alignment: .leading, spacing: 0) {
            Button(action:{
                if(self.highlightb == 0)
                {
                    self.highlightb = 1;
                    self.color1 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                }
                else if(self.premium == false)
                {
                    GlobalPlayer.sharedInstance.popUpForBG = true
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
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
                self.highlighte = 0;
                self.highlightf = 0;
                self.color = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color5 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.highlightk = 0;
                self.color10 = .primary;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Jazz")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[161], color: self.color1)
                
            }
            Button(action:{
                if(self.highlightc == 0)
                {
                    self.highlightc = 1;
                    self.color2 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightc == 1)
                {
                    self.highlightc = 0;
                    self.color2 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color5 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.highlightk = 0;
                self.color10 = .primary;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Acoustic Focus")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[162], color: self.color2)
            }
            Button(action:{
                if(self.highlightd == 0)
                {
                    self.highlightd = 1;
                    self.color3 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightd == 1)
                {
                    self.highlightd = 0;
                    self.color3 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlighte = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color = .primary;
                self.color4 = .primary;
                self.color5 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "EDM Focus")
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[163], color: self.color3)
                
            }
            Button(action:{
                if(self.highlighte == 0)
                {
                    self.highlighte = 1;
                    self.color4 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlighte == 1)
                {
                    self.highlighte = 0;
                    self.color4 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color = .primary;
                self.color5 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Focus Beats Album")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[164], color: self.color4)
                
            }
            Button(action:{
                if(self.highlightf == 0)
                {
                    self.highlightf = 1;
                    self.color5 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightf == 1)
                {
                    self.highlightf = 0;
                    self.color5 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightg = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color6 = .primary;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.highlightk = 0;
                self.color10 = .primary;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Soothing Focus")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[165], color: self.color5)
            }
            
            
            Button(action:{
                if(self.highlightg == 0)
                {
                    self.highlightg = 1;
                    self.color6 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightg == 1)
                {
                    self.highlightg = 0;
                    self.color6 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightf = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color5 = .primary;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.highlightk = 0;
                self.color10 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Soothing Beats")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[245], color: self.color6)
            }
            
            Button(action:{
                if(self.highlightk == 0)
                {
                    self.highlightk = 1;
                    self.color10 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightk == 1)
                {
                    self.highlightk = 0;
                    self.color10 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightf = 0;
                self.highlightg = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color6 = .primary;
                self.color7 = .primary;
                self.highlighth = 0;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                self.color5 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleDeepFocusBG(focusIndex: "Laid Back Focus Beats")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[246], color: self.color10)
            }
        }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .onAppear(perform: {
            self.shuffleFree()
            self.highlighta = 0
            self.highlightb = 0
            self.highlightc = 0
            self.highlightd = 0
            self.highlighte = 0
            self.highlightf = 0
            self.highlightg = 0
            self.highlighth = 0
            self.color = .primary
            self.color1 = .primary
            self.color2 = .primary
            self.color3 = .primary
            self.color4 = .primary
            self.color5 = .primary
            self.color6 = .primary
            self.color7 = .primary
            self.highlighti = 0;
            self.color8 = .primary;
            self.highlightj = 0;
            self.highlightk = 0;
            self.color10 = .primary;
            self.color9 = .primary;
            
        })
//        .onDisappear(perform: {
//            self.shuffleFree()
//        })
    }
}

struct SleepRow : View
{
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    @State var color2 : Color = .primary
    @State var color3 : Color = .primary
    @State var color4 : Color = .primary
    @State var color5 : Color = .primary
    @State var color6 : Color = .primary
    @State var color7 : Color = .primary
    @State var color8 : Color = .primary
    @State var color9 : Color = .primary
    @State var color10 : Color = .primary
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @State var premium : Bool
    
    @EnvironmentObject var userData: UserData
    
    func shuffleFree()
    {
        let Index = Int.random(in: 0...3)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        GlobalPlayer.sharedInstance.loopingPlayer = false;
    }
    
    func shuffleFreeLullabies()
    {
        let Index = Int.random(in: 197...200)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.loopingPlayer = false;
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        
    }
    func shuffleASMR()
    {
        let Index = Int.random(in: 239...242)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        GlobalPlayer.sharedInstance.loopingPlayer = true;
        GlobalPlayer.sharedInstance.backgroundVideoName = self.userData.bgTracks[Index].mp3Name
    }
    
        func shuffleSleepBG(focusIndex : String)
        {
            //print("1")
            GlobalPlayer.sharedInstance.playingFreeBG = false
            GlobalPlayer.sharedInstance.loopingPlayer = false;
            if(focusIndex == "Lullaby")
            {
                let lullabyIndex = Int.random(in: 118...127)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[lullabyIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[lullabyIndex].URL//mp3name
                //GlobalPlayer.sharedInstance.playingFreeBG = true
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Ocean Dreaming")
            {
                let oceanDreamingIndex = Int.random(in: 128...134)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[oceanDreamingIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[oceanDreamingIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Sleepy Soundscapes Album")
            {
                let sleepySoundscapesIndex = Int.random(in: 135...145)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[sleepySoundscapesIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[sleepySoundscapesIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Sleepy Acoustics")
            {
                let sleepyAcousticsIndex = Int.random(in: 179...193)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[sleepyAcousticsIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[sleepyAcousticsIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Dreamy Slumber")
            {
                let sleepyAcousticsIndex = Int.random(in: 230...236)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[sleepyAcousticsIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[sleepyAcousticsIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
            else if(focusIndex == "Nature Lullabies")
            {
                let sleepyAcousticsIndex = Int.random(in: 284...287)
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[sleepyAcousticsIndex].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[sleepyAcousticsIndex].URL
                //GlobalPlayer.sharedInstance.changeBackGroundTrack()
            }
    
        }
    
    
    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    @State var highlightc : Int = 0
    @State var highlightd : Int = 0
    @State var highlighte : Int = 0
    @State var highlightf : Int = 0
    @State var highlightg : Int = 0
    @State var highlighth : Int = 0
    @State var highlighti : Int = 0
    @State var highlightj : Int = 0
    @State var highlightk : Int = 0
    var body: some View
    {
        Text("Free")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)

        VStack(alignment: .leading, spacing: 0) {
        ForEach(self.categories["Free"]!) { bgTrack in
            Button(action: {
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
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleFree()
            }){
                    BGTracksItem(bgTrack: bgTrack, color: self.color)
                
            }
                                      }
            
//            Button(action: {
//                if(self.highlightj == 0)
//                {
//                    self.highlightj = 1;
//                    self.color9 = self.lifeBeatsColor
//                    GlobalPlayer.sharedInstance.BGSelected = true
//                }
//                else if (self.highlightj == 1)
//                {
//                    self.highlightj = 0;
//                    self.color9 = .primary
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//                self.highlightb = 0;
//                self.highlighta = 0;
//                self.highlightc = 0;
//                self.highlightd = 0;
//                self.color = .primary;
//                self.color1 = .primary;
//                self.color2 = .primary;
//                self.color3 = .primary;
//                self.color4 = .primary;
//                self.highlighte = 0;
//                self.color5 = .primary;
//                self.highlightf = 0;
//                self.highlightg = 0;
//                self.color6 = .primary;
//                self.highlighth = 0;
//                self.color7 = .primary;
//                self.highlighti = 0;
//                self.color8 = .primary;
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//                self.shuffleASMR()
//            }){
//                    BGTracksItem(bgTrack: self.userData.bgTracks[243], color: self.color9)
//
//            }
            //ASMRRow()
            
            Button(action:{
                if(self.highlightg == 0)
                {
                    self.highlightg = 1;
                    self.color6 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true

                }
                else if (self.highlightg == 1)
                {
                    self.highlightg = 0;
                    self.color6 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.color1 = .primary;
                self.highlightb = 0;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                //self.shuffleSleepBG(focusIndex: "Lullaby")
                self.shuffleFreeLullabies()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[195], color: self.color6)

            }
            
            Button(action:{
                if(self.highlighte == 0)
                {
                    self.highlighte = 1;
                    self.color4 = self.lifeBeatsColor
                    GlobalPlayer.sharedInstance.BGSelected = true

                }
                else if (self.highlighte == 1)
                {
                    self.highlighte = 0;
                    self.color4 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color6 = .primary;
                self.highlightg = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.color1 = .primary;
                self.highlightb = 0;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Nature Lullabies")
                //self.shuffleFreeLullabies()
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[245], color: self.color4)

            }
            
            ASMRRow()
                                  }
        .onReceive(timer) { _ in
            
            if(GlobalPlayer.sharedInstance.bgCategoryBuffer == true)
            {
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.highlighte = 0;
                self.highlightg = 0;
                self.highlightf = 0;
                self.highlighth = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.color = .primary;
                self.color6 = .primary;
                self.color7 = .primary;
                self.color5 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
            }
            
        }
        .padding(.top, 5)
        .padding(.bottom, 10)
        
//        Button(action:{
//            if(self.highlighte == 0)
//            {
//                self.highlighte = 1;
//                self.color4 = self.lifeBeatsColor
//                if(self.premium == true)
//                {
//                GlobalPlayer.sharedInstance.BGSelected = true
//                GlobalPlayer.sharedInstance.spotifyPopup = true
//                }
//                else if(self.premium == false)
//                {
//                    GlobalPlayer.sharedInstance.popUpForBG = true
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//            }
//            else if (self.highlighte == 1)
//            {
//                self.highlighte = 0;
//                self.color4 = .primary
//                GlobalPlayer.sharedInstance.BGSelected = false
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//            }
//            self.highlighta = 0;
//            self.highlightb = 0;
//            self.highlightc = 0;
//            self.highlightd = 0;
//            self.color1 = .primary;
//            self.color2 = .primary;
//            self.color = .primary;
//            self.color3 = .primary;
//            self.color5 = .primary;
//            self.highlightf = 0;
//            self.highlightg = 0;
//            self.color6 = .primary;
//            self.highlighth = 0;
//            self.color7 = .primary;
//            self.highlighti = 0;
//            self.color8 = .primary;
//            self.highlightj = 0;
//            self.color9 = .primary;
//            GlobalPlayer.sharedInstance.playingFreeBG = true
//            GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//        }){
//            if(self.premium == false)
//            {
//            Text("Spotify 🔒")
//                .foregroundColor(color4)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.trailing, 100)
//            }
//            if(self.premium == true)
//            {
//            Text("Spotify")
//                .foregroundColor(color4)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.trailing, 100)
//            }
//
//        }
        
        
//        Button(action:{
//            if(self.highlighti == 0)
//            {
//                self.highlighti = 1;
//                self.color8 = self.lifeBeatsColor
//                if(self.premium == true)
//                {
//                GlobalPlayer.sharedInstance.BGSelected = true
//                GlobalPlayer.sharedInstance.spotifyPopup = true
//                }
//                else if(self.premium == false)
//                {
//                    GlobalPlayer.sharedInstance.popUpForBG = true
//                    GlobalPlayer.sharedInstance.BGSelected = false
//                }
//            }
//            else if (self.highlighti == 1)
//            {
//                self.highlighti = 0;
//                self.color8 = .primary
//                GlobalPlayer.sharedInstance.BGSelected = false
//                GlobalPlayer.sharedInstance.spotifyPopup = false
//            }
//            self.highlighta = 0;
//            self.highlightb = 0;
//            self.highlightc = 0;
//            self.highlightd = 0;
//            self.highlighte = 0;
//            self.highlightf = 0;
//            self.highlightg = 0;
//            self.color1 = .primary;
//            self.color2 = .primary;
//            self.color3 = .primary;
//            self.color4 = .primary;
//            self.color = .primary;
//            self.color5 = .primary;
//            self.color6 = .primary;
//            self.color7 = .primary;
//            self.highlighth = 0;
//            self.highlightj = 0;
//            self.color9 = .primary;
//            GlobalPlayer.sharedInstance.playingFreeBG = true
//            GlobalPlayer.sharedInstance.bgCategoryBuffer = false
//        }){
//            
//            if(self.premium == false)
//            {
//            Text("Apple Music 🔒")
//                .foregroundColor(color8)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.top, 20)
//                .padding(.trailing, 100)
//            }
//            else if(self.premium == true)
//            {
//            Text("Apple Music")
//                .foregroundColor(color8)
//                .font(Font.custom("Nexa Bold", size: 18))
//                .fontWeight(.bold)
//                .padding(.leading, 20)
//                .padding(.top, 20)
//                .padding(.trailing, 100)
//            }
//        }

        if(self.premium == false)
        {
        Text("Premium 🔒")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
            .padding(.top, 15)
        }
        else if(self.premium == true)
        {
        Text("Premium")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
            .padding(.top, 15)
        }
        

        VStack(alignment: .leading, spacing: 0) {
            Button(action:{
                if(self.highlightc == 0)
                {
                    self.highlightc = 1;
                    self.color2 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightc == 1)
                {
                    self.highlightc = 0;
                    self.color2 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightd = 0;
                self.color1 = .primary;
                self.color = .primary;
                self.color3 = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Ocean Dreaming")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[167], color: self.color2)
            }
            Button(action:{
                if(self.highlightd == 0)
                {
                    self.highlightd = 1;
                    self.color3 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightd == 1)
                {
                    self.highlightd = 0;
                    self.color3 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Sleepy Soundscapes Album")
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[168], color: self.color3)
                
            }
            Button(action:{
                if(self.highlightb == 0)
                {
                    self.highlightb = 1;
                    self.color1 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                    
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
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Lullaby")
            }){
                BGTracksItem(bgTrack: self.userData.bgTracks[166], color: self.color1)
                
            }
            Button(action:{
                if(self.highlightf == 0)
                {
                    self.highlightf = 1;
                    self.color5 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightf == 1)
                {
                    self.highlightf = 0;
                    self.color5 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color = .primary;
                self.color4 = .primary;
                self.color3 = .primary;
                self.highlighte = 0;
                self.highlightd = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighth = 0;
                self.color7 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Sleepy Acoustics")
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[194], color: self.color5)
                
            }
            Button(action:{
                if(self.highlighth == 0)
                {
                    self.highlighth = 1;
                    self.color7 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlighth == 1)
                {
                    self.highlighth = 0;
                    self.color7 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color = .primary;
                self.color4 = .primary;
                self.color5 = .primary;
                self.color3 = .primary;
                self.highlighte = 0;
                self.highlightf = 0;
                self.highlightd = 0;
                self.highlightg = 0;
                self.color6 = .primary;
                self.highlighti = 0;
                self.color8 = .primary;
                self.highlightj = 0;
                self.color9 = .primary;
                GlobalPlayer.sharedInstance.spotifyPopup = false
                GlobalPlayer.sharedInstance.bgCategoryBuffer = false
                self.shuffleSleepBG(focusIndex: "Dreamy Slumber")
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[237], color: self.color5)
                
            }
            

        }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .onAppear(perform: {
            self.shuffleFree()
            self.highlighta = 0
            self.highlightb = 0
            self.highlightc = 0
            self.highlightd = 0
            self.highlighte = 0
            self.highlightf = 0
            self.highlightg = 0
            self.highlighth = 0
            self.color = .primary
            self.color1 = .primary
            self.color2 = .primary
            self.color3 = .primary
            self.color4 = .primary
            self.color5 = .primary
            self.color6 = .primary
            self.color7 = .primary
            self.highlighti = 0;
            self.color8 = .primary;
            self.highlightj = 0;
            self.color9 = .primary;
        })
    }
}

struct FitnessRow: View {
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @EnvironmentObject var userData: UserData
    //@State var popUp : Bool = false
    
    func shuffleFitnessBG()
    {
        let Index = Int.random(in: 4...14)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    
    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    var body: some View
    {
        Text("Premium")  //🔒
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)
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
                self.color1 = .primary;
                self.shuffleFitnessBG()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[170], color: self.color)
                
            }
                        
                                  }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .onAppear(perform: {
            self.shuffleFitnessBG()
            self.highlighta = 0
            self.highlightb = 0
            self.color = .primary
            self.color1 = .primary

        })
    }
}

struct QuickRemediesRow: View {
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    @State var color2 : Color = .primary
    @State var color3 : Color = .primary

    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @EnvironmentObject var userData: UserData
    
    func shuffleFree()
    {
        let Index = Int.random(in: 0...3)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
    }
    
    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    @State var highlightc : Int = 0
    @State var highlightd : Int = 0

    var body: some View
    {
        Text("Free")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)

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
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[0].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[0].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[0], color: self.color)
                
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
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[1].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[1].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true

            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[1], color: self.color1)
                
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
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightd = 0;
                self.color = .primary;
                self.color1 = .primary;
                self.color3 = .primary;
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[2].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[2].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true

            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[2], color: self.color2)
                
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
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.color = .primary;
                self.color2 = .primary;
                self.color1 = .primary;
                GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[3].name
                GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[3].URL
                GlobalPlayer.sharedInstance.playingFreeBG = true
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[3], color: self.color3)
                
            }

            
                                  }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .onAppear(perform: {
            self.shuffleFree()
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

struct MeditationRow: View {
    
    let lifeBeatsColor = Color(red: 107.0 / 255, green: 255.0 / 255, blue: 103.0 / 255)
    @State var color : Color = .primary
    @State var color1 : Color = .primary
    @State var color2 : Color = .primary
    @State var color3 : Color = .primary
    @State var color4 : Color = .primary
    @State var color5 : Color = .primary

    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @State var premium : Bool
    
    @EnvironmentObject var userData: UserData
    
    func shuffleFree()
    {
        let random = Int.random(in: 1...4)
        if(random == 1 || random == 2 || random == 3)
        {
        let Index = Int.random(in: 0...3)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = true
        }
        else if(random == 4)
        {
            GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[172].name
            GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[172].URL
            GlobalPlayer.sharedInstance.playingFreeBG = true
        }
    }
    
    func shuffleMedBG()
    {
        let Index = Int.random(in: 146...150)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    func shuffleRelaxBreathing()
    {
        let Index = Int.random(in: 209...213)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    func shuffleJapaneseSpa()
    {
        let Index = Int.random(in: 214...225)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    func shuffleCalmShores()
    {
        let Index = Int.random(in: 226...229)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    func shuffleCalmBreathing()
    {
        let Index = Int.random(in: 288...291)
        GlobalPlayer.sharedInstance.backgroundTrackName = self.userData.bgTracks[Index].name
        GlobalPlayer.sharedInstance.backgroundTrackURL = self.userData.bgTracks[Index].URL
        GlobalPlayer.sharedInstance.playingFreeBG = false
    }
    
    @State var highlighta : Int = 0
    @State var highlightb : Int = 0
    @State var highlightc : Int = 0
    @State var highlightd : Int = 0
    @State var highlighte : Int = 0
    @State var highlightf : Int = 0

    var body: some View
    {
        Text("Free")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)

        VStack(alignment: .leading, spacing: 0) {
        ForEach(self.categories["Free"]!) { bgTrack in
            Button(action: {
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
                self.color1 = .primary;
                self.highlightc = 0;
                self.color2 = .primary;
                self.highlightd = 0;
                self.color3 = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.shuffleFree()
            }){
                    BGTracksItem(bgTrack: bgTrack, color: self.color)
                
            }
                                      }
            
            Button(action:{
                if(self.highlightf == 0)
                {
                    self.highlightf = 1;
                    self.color5 = self.lifeBeatsColor
                    
                    GlobalPlayer.sharedInstance.BGSelected = true
                    
                }
                else if (self.highlightf == 1)
                {
                    self.highlightf = 0;
                    self.color5 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color = .primary;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.shuffleCalmBreathing()
                //self.shuffleMedBG()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[248], color: self.color5)
                
            }
                                  }
        .padding(.top, 5)
        .padding(.bottom, 10)
        if(self.premium == false)
        {
        Text("Premium 🔒")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)
        }
        if(self.premium == true)
        {
        Text("Premium")
            .font(Font.custom("Nexa Bold", size: 18))
                                .fontWeight(.bold)
                                  .padding(.leading, 20)
                                  .padding(.top, 5)
        }

        VStack(alignment: .leading, spacing: 0) {
            Button(action:{
                if(self.highlightb == 0)
                {
                    self.highlightb = 1;
                    self.color1 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightb == 1)
                {
                    self.highlightb = 0;
                    self.color1 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.color = .primary;
                self.highlightc = 0;
                self.color2 = .primary;
                self.highlightd = 0;
                self.color3 = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.shuffleMedBG()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[169], color: self.color1)
                
            }
            Button(action:{
                if(self.highlightc == 0)
                {
                    self.highlightc = 1;
                    self.color2 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightc == 1)
                {
                    self.highlightc = 0;
                    self.color2 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightd = 0;
                self.color1 = .primary;
                self.color3 = .primary;
                self.color = .primary;
                self.color4 = .primary;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                //self.shuffleMedBG()
                self.shuffleRelaxBreathing()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[207], color: self.color2)
                
            }
            Button(action:{
                if(self.highlightd == 0)
                {
                    self.highlightd = 1;
                    self.color3 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlightd == 1)
                {
                    self.highlightd = 0;
                    self.color3 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlighte = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.color = .primary;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color4 = .primary;
                self.shuffleJapaneseSpa()
                //self.shuffleMedBG()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[208], color: self.color3)
                
            }
            Button(action:{
                if(self.highlighte == 0)
                {
                    self.highlighte = 1;
                    self.color4 = self.lifeBeatsColor
                    if(self.premium == true)
                    {
                    GlobalPlayer.sharedInstance.BGSelected = true
                    }
                    else if(self.premium == false)
                    {
                        GlobalPlayer.sharedInstance.popUpForBG = true
                        GlobalPlayer.sharedInstance.BGSelected = false
                    }
                }
                else if (self.highlighte == 1)
                {
                    self.highlighte = 0;
                    self.color4 = .primary
                    GlobalPlayer.sharedInstance.BGSelected = false
                }
                self.highlighta = 0;
                self.highlightb = 0;
                self.highlightc = 0;
                self.highlightd = 0;
                self.color5 = .primary;
                self.highlightf = 0;
                self.color = .primary;
                self.color1 = .primary;
                self.color2 = .primary;
                self.color3 = .primary;
                self.shuffleCalmShores()
                //self.shuffleMedBG()
            }){
                    BGTracksItem(bgTrack: self.userData.bgTracks[238], color: self.color3)
                
            }
            


        }
        .padding(.top, 5)
        .padding(.bottom, 10)
        .onAppear(perform: {
            self.shuffleFree()
            self.highlighta = 0
            self.highlightb = 0
            self.highlightc = 0
            self.highlightd = 0
            self.highlighte = 0
            self.color5 = .primary;
            self.highlightf = 0;
            self.color = .primary
            self.color1 = .primary
            self.color2 = .primary
            self.color3 = .primary
            self.color4 = .primary
        })
    }
}

struct BGTracksCategoryRow: View {
    var category : String //both category and therapy names
    var categories: [String: [bgTrack]] {
        Dictionary(
            grouping: bgTrackData,
            by: { $0.category.rawValue }
        )
    }
    @State var premium : Bool
    @EnvironmentObject var userData: UserData
    
    var body: some View {


            ScrollView(.vertical, showsIndicators: false)
            {
                LazyVStack(alignment: .leading)
                {
            
            if(self.category == "Deep Focus")
            {
                DeepFocusRow(premium: self.premium)
            }
            else if(self.category == "Sleep")
            {
               SleepRow(premium: self.premium)
            }
            else if (self.category == "Meditation")
            {
                MeditationRow(premium: self.premium)
            }
            else if (self.category == "Fitness Prep")
            {
                FitnessRow()
            }
            else if (self.category == "Quick Remedies" || self.category == "Ace Your Day" || self.category == "Student Living" || self.category == "Mindfulness at work" || self.category == "Self Love")
            {
                QuickRemediesRow()
            }
            else
            {

//                Text(self.category)
//                    .font(Font.custom("Nexa Bold", size: 18))
//                                        .fontWeight(.bold)
//                                          .padding(.leading, 20)
//                                          .padding(.top, 5)
//                VStack(alignment: .leading, spacing: 0) {
//                    ForEach(self.categories[self.category]!) { bgTrack in
//                                                Button(action:
//                                                        { print("1")
//                                                        }){
//                                                    BGTracksItem(bgTrack: bgTrack).padding(.top, 10)}
//                                              }
//                                          }
//                .padding(.top, 5)
//                .padding(.bottom, 10)
                QuickRemediesRow()
                
                
            }
                }
                
            }
            
        }
}

struct BGTracksItem: View {
    var bgTrack : bgTrack
    var color : Color?
    var body: some View {
        VStack(alignment: .leading) {
            Text(bgTrack.name)
                .foregroundColor(color ?? .primary)
                .font(Font.custom("Nexa Bold", size: 15))
                .padding(.leading, 20)
        }
        .frame(height: 30)
        .padding(.trailing, 100)
    }
}


struct BGTracksCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        BGTracksCategoryRow(category: "Deep Focus", premium: true)    .environmentObject(UserData())
    }
}
