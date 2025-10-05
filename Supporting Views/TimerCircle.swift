//
//  TimerCircle.swift
//  LifeBeats
//
//  Created by User on 12/20/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct TimerCircle: View {
    
    @State var timeRemaining : String = " "
    @State var paused : Bool = false
    @State var started : Bool = false
    @State var duration:TimeInterval = GlobalPlayer.sharedInstance.elaspedTime!
    @State var durationCGF:CGFloat = GlobalPlayer.sharedInstance.timeCG!
    @State var currentDuration:CGFloat = GlobalPlayer.sharedInstance.elapsedTimeCG!
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //@State var timeRemaining1 = 1
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Circle()
//                .trim(from: 0, to: (currentDuration/durationCGF))
                .trim(from: (currentDuration/durationCGF), to: 1)
                .fill(Color.orange)
                .frame(width: 310, height: 310)
                // Moving View...
                //.offset(x:  45 / 2)
                .rotationEffect(.init(degrees: -90))
                .animation(.linear)
            
            Circle().fill(self.lifeBeatsColor).frame(width: 300, height: 300)
            
            Text(self.timeRemaining)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .onReceive(timer1) { _ in
//                    if self.timeRemaining1 > 0 {
//                        self.timeRemaining1 -= 1
//                    }
//                    else if self.timeRemaining1 == 0
//                    {
           // print(GlobalPlayer.sharedInstance.playing)
            print(self.duration)
            self.timeString(time: self.duration)
                        if(GlobalPlayer.sharedInstance.playing == true)
                        {
                            self.duration = GlobalPlayer.sharedInstance.elaspedTime!
                            self.currentDuration = GlobalPlayer.sharedInstance.elapsedTimeCG!
                            self.durationCGF = GlobalPlayer.sharedInstance.timeCG!
                            self.paused = false
                            self.started = true
                            //self.timeString(time: self.duration)
                            if self.duration > 0 {
                                self.duration -= 0
                                self.currentDuration -= 0
                                GlobalPlayer.sharedInstance.elaspedTime = self.duration
                                GlobalPlayer.sharedInstance.elapsedTimeCG = self.currentDuration
                                //self.timeString(time: self.duration)
                            }

                        }
                        if(GlobalPlayer.sharedInstance.paused == true)
                        {
                            self.paused = true
                        }
            //self.timeRemaining1 = 1
            //}
        }
//        .onReceive(timer) { _ in
//            if(self.paused == false && self.started == true)
//            {
//                    if self.duration > 0 {
//                        self.duration -= 1
//                        self.currentDuration -= 1
//                        GlobalPlayer.sharedInstance.elaspedTime = self.duration
//                        GlobalPlayer.sharedInstance.elapsedTimeCG = self.currentDuration
//                    }
//            self.timeString(time: self.duration)
//            }
//        }
        .onAppear(perform: {
            self.timeString(time: GlobalPlayer.sharedInstance.elaspedTime!)
            self.duration = GlobalPlayer.sharedInstance.elaspedTime!
            self.currentDuration = GlobalPlayer.sharedInstance.elapsedTimeCG!
            print("heyy\(self.currentDuration)")
            print("heyy\(durationCGF)")
        })
    }
    
    
    func timeString(time:TimeInterval)
    {
        //let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        self.timeRemaining = String(format:"%02i:%02i", minutes, seconds)
    }
}


struct LifeTimer: View {
    
    @State var timeRemaining : String = " "
    @State var duration:TimeInterval = GlobalPlayer.sharedInstance.timeTilLife
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    //@State var timeRemaining1 = 1
    let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
//            if(GlobalPlayer.sharedInstance.gameLives == 5)
//            {
//                Text("Full")
//            }
//            else
//            {
            Text(self.timeRemaining)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            //}
        }
        .onReceive(timer1) { _ in
//                    if self.timeRemaining1 > 0 {
//                        self.timeRemaining1 -= 1
//                    }
//                    else if self.timeRemaining1 == 0
//                    {
           // print(GlobalPlayer.sharedInstance.playing)
            print(self.duration)
            self.timeString(time: self.duration)
            //self.duration = GlobalPlayer.sharedInstance.timeTilLife

                            //self.timeString(time: self.duration)
                            if self.duration > 0 {
                                self.duration -= 1
                                GlobalPlayer.sharedInstance.timeTilLife = self.duration
                            }
            else
            {
                GlobalPlayer.sharedInstance.timeTilLife = 3600.0
            }
        }
            //self.timeRemaining1 = 1
            //}
        
//        .onReceive(timer) { _ in
//            if(self.paused == false && self.started == true)
//            {
//                    if self.duration > 0 {
//                        self.duration -= 1
//                        self.currentDuration -= 1
//                        GlobalPlayer.sharedInstance.elaspedTime = self.duration
//                        GlobalPlayer.sharedInstance.elapsedTimeCG = self.currentDuration
//                    }
//            self.timeString(time: self.duration)
//            }
//        }
        .onAppear(perform: {
            self.timeString(time: GlobalPlayer.sharedInstance.timeTilLife)
            self.duration = GlobalPlayer.sharedInstance.timeTilLife
            
        })
    }
    
    
    func timeString(time:TimeInterval)
    {
        //let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        self.timeRemaining = String(format:"%02i:%02i", minutes, seconds)
    }
}


struct TimerCircle_Previews: PreviewProvider {
    static var previews: some View {
        TimerCircle()
    }
}
