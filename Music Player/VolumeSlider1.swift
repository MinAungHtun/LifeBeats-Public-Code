//
//  VolumeSlider1.swift
//  LifeBeats
//
//  Created by User on 10/19/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct VolumeSlider1: View {
    @State var volume : CGFloat = 195.0
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
     func updateVolume(value: DragGesture.Value){
        
        if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 180{
            
            let progress = value.location.x / 240 //UIScreen.main.bounds.width - 80
            print(progress)
            if(GlobalPlayer.sharedInstance.backgroundPlayer != nil)
            {
                GlobalPlayer.sharedInstance.backgroundPlayer.volume = Float(progress)
                GlobalPlayer.sharedInstance.volumeBG = value.location.x
            }
            withAnimation(Animation.linear(duration: 0.1))
                {self.volume = value.location.x}
        }
    }
    
    
    
    var body: some View {
        VStack{
            Text("Soundscape").font(Font.custom("Nexa Bold", size: 16))
            VStack{
        HStack(spacing: 15){
            Image(systemName: "speaker.3")
            
            Image(systemName: "minus")
                .foregroundColor(.white)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                Capsule()
                    .fill(Color.black.opacity(0.06))
                    .frame(height: 4)
                
                Capsule()
                    .fill(self.lifeBeatsColor)
                    .frame(width: self.volume, height: 4)
                
                // Slider....
                
                Circle()
                    .fill(self.lifeBeatsColor)
                    .frame(width: 20, height: 20)
                // gesture....
                    .offset(x: self.volume)
                    .gesture(DragGesture().onChanged(self.updateVolume(value:)))
            }
            // default Frame...
            .frame(width: UIScreen.main.bounds.width - 175)
            
            Image(systemName: "plus")
                .foregroundColor(.white)
        }
        .padding(.top,10)
            }
        }
        .onAppear(perform: {
            self.volume = GlobalPlayer.sharedInstance.volumeBG ?? 195.0
        })
    }
}

struct VolumeSlider1_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider1()
    }
}
