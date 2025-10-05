//
//  Waves.swift
//  LifeBeats
//
//  Created by User on 3/7/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct Waves: View {
    
    let universalSize = UIScreen.main.bounds
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    @State var isAnimated = false
    
    var body: some View {
        ZStack {
            getSinWave(interval: universalSize.width, amplitude: 200, baseline: -50 + universalSize.height/2)
                .foregroundColor(lifeBeatsColor.opacity(0.4))
                //.padding(.top, -universalSize.height-150)
                //.frame(height: 200)
//                .offset(x: isAnimated ? -1*universalSize.width : 0)
//            .animation(
//                Animation.linear(duration: 2)
//                .repeatForever(autoreverses: false)
//            )
            getSinWave(interval: universalSize.width*1.2, amplitude: 150, baseline: 50 + universalSize.height/2)
                .foregroundColor(lifeBeatsColor.opacity(0.4))
                //.padding(.top, -universalSize.height-100)
                //.frame(height: 150)
//                .offset(x: isAnimated ? -1*(universalSize.width*1.2) : 0)
//            .animation(
//                Animation.linear(duration: 5)
//                .repeatForever(autoreverses: false)
//            )
        }.onAppear(){
            self.isAnimated = true
        }

    }
    
    
    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path{path in
            path.move(to: CGPoint(x: 0, y: baseline
            ))
            path.addCurve(
                to: CGPoint(x: 1*interval,y: -baseline),
                control1: CGPoint(x: interval * (0.35),y: -amplitude - baseline),
                control2: CGPoint(x: interval * (0.65),y: amplitude - baseline)
            )
//            path.addCurve(
//                to: CGPoint(x: 2*interval,y: baseline),
//                control1: CGPoint(x: interval * (1.35),y: -amplitude - baseline),
//                control2: CGPoint(x: interval * (1.65),y: amplitude - baseline)
//            )
            path.addLine(to: CGPoint(x: 2*interval, y: -universalSize.height+200))
            path.addLine(to: CGPoint(x: 0, y: -universalSize.height+200))


        }

    }
    
//    func getSinWave(interval:CGFloat, amplitude: CGFloat = 100 ,baseline:CGFloat = UIScreen.main.bounds.height/2) -> Path {
//        Path{path in
//            path.move(to: CGPoint(x: baseline, y: 0
//            ))
//            path.addCurve(
//                to: CGPoint(x: baseline,y: 1*interval),
//                control1: CGPoint(x: amplitude + baseline,y: interval * (0.35)),
//                control2: CGPoint(x: -amplitude + baseline,y: interval * (0.65))
//            )
//            path.addCurve(
//                to: CGPoint(x: baseline,y: 2*interval),
//                control1: CGPoint(x: amplitude + baseline,y: interval * (1.35)),
//                control2: CGPoint(x: -amplitude + baseline,y: interval * (1.65))
//            )
//            path.addLine(to: CGPoint(x: universalSize.width-200, y: 2*interval))
//            path.addLine(to: CGPoint(x: universalSize.width-200, y: 0))
//
//
//        }
//
//    }

}

struct Waves_Previews: PreviewProvider {
    static var previews: some View {
        Waves()
    }
}
