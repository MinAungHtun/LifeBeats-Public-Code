//
//  TypingAnimation.swift
//  LifeBeats
//
//  Created by User on 9/6/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct TypingAnimation: View {
    @State var animate = false
    var body: some View {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.gray)
    }
}

struct TypingFebeAnimation: View {
    @State var animate = false
    var body: some View {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    //.background(Color.gray)
    }
}

struct TypingAnimationWithText: View {
    @State var animate = false
    var text : String
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 3
    var body: some View {
        if(self.timeRemaining > 1)
        {
        VStack(alignment: .leading)
    {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .onReceive(timer) { _ in
        //print(self.timeRemaining)
        
        self.timeRemaining -= 1
        print(self.timeRemaining)
    }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.gray)
    .clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)
        }
        }
        else
        {
            Text(LocalizedStringKey(self.text)).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))
        }
    }
}

struct TypingAnimationWithText1: View {
    @State var animate = false
    var text : String
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 3
    var body: some View {
        if(self.timeRemaining > 1)
        {
        VStack(alignment: .leading)
    {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .onReceive(timer) { _ in
        //print(self.timeRemaining)
        
        self.timeRemaining -= 1
        print(self.timeRemaining)
    }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.gray)
    .clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)
        }
        }
        else
        {
            Text(LocalizedStringKey(self.text)).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))
        }
    }
}


struct TypingAnimationWithText2: View {
    @State var animate = false
    var text : String
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 3
    var body: some View {
        if(self.timeRemaining > 1)
        {
        VStack(alignment: .leading)
    {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .onReceive(timer) { _ in
        //print(self.timeRemaining)
        
        self.timeRemaining -= 1
        print(self.timeRemaining)
    }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.gray)
    .clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)
        }
        }
        else
        {
            Text(LocalizedStringKey(self.text)).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))
        }
    }
}

struct TypingAnimationWithText3: View {
    @State var animate = false
    var text : String
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timeRemaining = 3
    var body: some View {
        if(self.timeRemaining > 1)
        {
        VStack(alignment: .leading)
    {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .onReceive(timer) { _ in
        //print(self.timeRemaining)
        
        self.timeRemaining -= 1
        print(self.timeRemaining)
    }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.gray)
    .clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)
        }
        }
        else
        {
            Text(LocalizedStringKey(self.text)).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))
        }
    }
}


struct SearchAnimation: View {
    @State var animate = false
    var body: some View {
    HStack
        {
            Circle().fill(Color.white.opacity(0.25)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)

            Circle().fill(Color.white.opacity(0.5)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
            
            Circle().fill(Color.white.opacity(0.75)).frame(width:10, height:10).scaleEffect(self.animate ? 1:0)
        
        }.onAppear
            {
                self.animate.toggle()
        }
    .padding()
    .animation(Animation.linear(duration: 0.75).repeatForever(autoreverses: false))
    .background(Color.black)
    }
}


public extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

struct TypingAnimation_Previews: PreviewProvider {
    static var previews: some View {
        TypingAnimation().clipShape(Bubble(chat:false))
    }
}
