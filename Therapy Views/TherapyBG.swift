//
//  TherapyBG.swift
//  LifeBeats
//
//  Created by User on 3/27/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct TherapyBG: View {
    @State var morning : Bool?
    @State var afternoon : Bool?
    @State var evening : Bool?
    @State var night : Bool?
    @State var imageName : String?
    @State var categoryName : String
    @State var count : Int  = 0
    @State var loop: Bool = GlobalPlayer.sharedInstance.loopingPlayer
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func evaluateTime(from: Int, to: Int, toMinutes: Int, toSeconds: Int) -> Bool
    {

        let calendar = Calendar.current
        let now = Date()
        let from_today = calendar.date(
          bySettingHour: from,
          minute: 0,
          second: 0,
          of: now)!

        let to_today = calendar.date(
          bySettingHour: to,
          minute: toMinutes,
          second: toSeconds,
          of: now)!

        if now >= from_today &&
          now <= to_today
        {
            return true
        }
        else
        {
            return false
        }
    }

    
    func normalBG()
    {
        self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
        self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
        self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
        if(self.morning == true)
        {
            self.imageName = "Morning 1"
        }
        else if(self.afternoon == true)
        {
            self.imageName = "Afternoon 2"
        }
        else if(self.evening == true)
        {
            self.imageName = "Evening 2"
        }
        else
        {
            self.imageName = "Morning 1"
        }
    }
    
    
    
    var body: some View {
        
        if(self.loop == true)
        {
            LoopingPlayer().padding(.top, -50)
                .onReceive(timer) { _ in
                    self.loop = GlobalPlayer.sharedInstance.loopingPlayer
                    if(GlobalPlayer.sharedInstance.videoChangeBuffer == true)
                    {
                        self.count = self.count+1
                        if(self.count >= 1)
                        {
                            GlobalPlayer.sharedInstance.loopingPlayer = true;
                            self.count = 0;
                            GlobalPlayer.sharedInstance.videoChangeBuffer = false;
                        }
                    }
                }
        }
        else
        {
        
        Image(self.imageName ?? "Morning 1").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .listRowInsets(EdgeInsets())
            .onReceive(timer) { _ in
                self.loop = GlobalPlayer.sharedInstance.loopingPlayer
                if(GlobalPlayer.sharedInstance.videoChangeBuffer == true)
                {
                    self.count = self.count+1
                    if(self.count >= 1)
                    {
                        GlobalPlayer.sharedInstance.loopingPlayer = true;
                        self.count = 0;
                        GlobalPlayer.sharedInstance.videoChangeBuffer = false;
                    }
                }
                if(GlobalPlayer.sharedInstance.backgroundTrackName == "Birds in forest")
                {
                    self.imageName = "birds in forest"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Ocean Waves")
                {
                    self.imageName = "ocean"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Camp Fire")
                {
                    self.imageName = "campfire"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "White Noise")
                {
                    self.imageName = "white noise"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Tibetan")
                {
                    self.imageName = "tibetan-meditation"
                }
                else
                {
                normalBG()
                }
            }
            .onAppear(perform: {
                if(GlobalPlayer.sharedInstance.backgroundTrackName == "Birds in forest")
                {
                    self.imageName = "birds in forest"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Ocean Waves")
                {
                    self.imageName = "ocean"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Camp Fire")
                {
                    self.imageName = "campfire"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "White Noise")
                {
                    self.imageName = "white noise"
                }
                else if(GlobalPlayer.sharedInstance.backgroundTrackName == "Tibetan")
                {
                    self.imageName = "tibetan-meditation"
                }
                else
                {
                normalBG()
                }
            })
        }
    }
}

//struct TherapyBG_Previews: PreviewProvider {
//    static var previews: some View {
//        TherapyBG()
//    }
//}
