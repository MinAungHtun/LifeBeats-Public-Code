//
//  ProfileBG.swift
//  LifeBeats
//
//  Created by User on 11/5/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct ProfileBG: View {
    @State var morning : Bool?
    @State var afternoon : Bool?
    @State var evening : Bool?
    @State var night : Bool?
    @State var imageName : String?
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

    
    var body: some View {
        Image(self.imageName ?? "Morning 1").resizable().frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/2.7).padding(.bottom, UIScreen.main.bounds.height/4)
            .listRowInsets(EdgeInsets())
            .padding(.top, -200)
            .onAppear(perform: {
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
            })
    }
}

struct ProfileBG_Previews: PreviewProvider {
    static var previews: some View {
        ProfileBG()
    }
}
