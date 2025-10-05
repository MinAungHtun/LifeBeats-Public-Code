//
//  StoryText.swift
//  LifeBeats
//
//  Created by User on 7/30/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct StoryText: View {
    var body: some View {
VStack
        {
            Text("Help Luca gather as many of these coins and he will reward you by helping you exchange these coins for real-life crypto very soon.").font(Font.custom("Nexa Bold", size: 35)).foregroundColor(Color.black).padding(.top, 40).padding(.bottom, 40).padding(.leading, 35).padding(.trailing, 35)
        }.background(Color.white) .frame(width: UIScreen.main.bounds.width-10, height: UIScreen.main.bounds.height/2)
    }
}

struct StoryText_Previews: PreviewProvider {
    static var previews: some View {
        StoryText()
    }
}
