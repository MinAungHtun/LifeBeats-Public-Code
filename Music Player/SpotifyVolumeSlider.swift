//
//  SpotifyVolumeSlider.swift
//  LifeBeats
//
//  Created by User on 11/18/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SpotifyVolumeSlider: View {
    @State var volume : CGFloat = 195.0
    
     func updateVolume(value: DragGesture.Value){
        
        if value.location.x >= 0 && value.location.x <= UIScreen.main.bounds.width - 180{
            
            let progress = value.location.x / 200 //UIScreen.main.bounds.width - 80
            print(progress)
//            if(GlobalPlayer.sharedInstance.backgroundPlayer != nil)
//            {
//                GlobalPlayer.sharedInstance.backgroundPlayer.volume = Float(progress)
//            }
            withAnimation(Animation.linear(duration: 0.1))
                {self.volume = value.location.x}
        }
    }
    
    var body: some View {
            VStack{
        HStack(spacing: 15){
            Image(systemName: "speaker.3")
            
            Image(systemName: "minus")
                .foregroundColor(.black)
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                
                Capsule()
                    .fill(Color.black.opacity(0.06))
                    .frame(height: 4)
                
                Capsule()
                    .fill(Color.orange)
                    .frame(width: self.volume, height: 4)
                
                // Slider....
                
                Circle()
                    .fill(Color.orange)
                    .frame(width: 20, height: 20)
                // gesture....
                    .offset(x: self.volume)
                    .gesture(DragGesture().onChanged(self.updateVolume(value:)))
            }
            // default Frame...
            .frame(width: UIScreen.main.bounds.width - 175)
            
            Image(systemName: "plus")
                .foregroundColor(.black)
        }
        .padding(.top,25)
            }
    }
}

struct SpotifyVolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyVolumeSlider()
    }
}
