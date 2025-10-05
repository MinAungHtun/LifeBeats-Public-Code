//
//  BreathingExercise.swift
//  LifeBeats
//
//  Created by User on 6/24/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BreathingExercise: View {
    @State var animate = false
    var body: some View {
        VStack{
        ZStack
        {
            Circle().fill(Color.blue.opacity(0.25)).frame(width:350, height:350).scaleEffect(self.animate ? 1:0)
            

            Circle().fill(Color.blue.opacity(0.25)).frame(width:250, height:250).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.blue.opacity(0.25)).frame(width:150, height:150).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.blue).frame(width:30, height:30)
            
        }.padding()
        .onAppear
        {
            self.animate.toggle()
//            GlobalPlayer.sharedInstance.ads()
        }
        .onDisappear
        {
            self.animate.toggle()
        }
            VStack{
                Text("Before therapy starts, please take time to breathe in and out slowly.").font(Font.custom("Nexa Bold", size: 13)).padding().padding(.top, 10)
                Text("*If this process is taking too long or should the therapy doesn't play or if you face any issues, kindly please check internet connection and restart the therapy.").font(Font.custom("Nexa Bold", size: 8)).padding(.top, 10)
            }
        }.padding(.bottom, 40)
//        .onAppear
//            {
//                self.animate.toggle()
//        }
        .animation(Animation.easeIn(duration: 3.5).repeatForever(autoreverses: false))
    }
}

struct BreathingExercise_Previews: PreviewProvider {
    static var previews: some View {
        BreathingExercise()
    }
}
