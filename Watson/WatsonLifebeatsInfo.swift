//
//  WatsonLifebeatsInfo.swift
//  LifeBeats
//
//  Created by User on 4/25/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct IntroText1:View{
    @State var text : Int
    @State var userName : String?
    @State var timeRemaining = 8
    @Binding var dummyIB : Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View
    {
        VStack{
        if(self.text == 1)
        {
                HStack
                {
                //FebeFace()
                    if(self.timeRemaining > 6)
                    {                FebeFace()
                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                Text("Lifebeats provides you with numerous mindfulness sessions").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)
                    }
                }
                
                if(self.timeRemaining <= 6)
                {
                HStack
                {
                    //FebeFace()
                        if(self.timeRemaining > 4)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("These include sessions to help you improve your focus while working or studying, helping you sleep better and even allowing you to appreciate yourself for who you are").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)}
                }
                }
                
                if(self.timeRemaining <= 4)
                {
                HStack
                {
                   //FebeFace()
                        if(self.timeRemaining > 2)
                    //FebeFace()
                        {FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Lifebeats also analyzes your HealthKit data which allows me to give you accurate mindfulness recommendations.").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))}
                }
                }
            
            if(self.timeRemaining <= 2)
            {
            HStack
            {
               FebeFace()
                    if(self.timeRemaining > 0)
                //FebeFace()
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
            Text("You can browse the Lifebeats library of sessions on the home page or you can also ask me for suggestions if you're unsure.").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))}
            }
            }
        }
        else if(self.text == 3)
        {

                HStack
                {
                //FebeFace()
                    if(self.timeRemaining > 6)
                    {                FebeFace()
                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                Text("You can use Lifebeats as your daily mindfulness companion. It's super easy!").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        
                    }
                }
                
                if(self.timeRemaining <= 6)
                {
                HStack
                {
                   // FebeFace()
                        if(self.timeRemaining > 4)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Set up daily mindfulness reminders on the 'Settings' page so you never miss a session").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        }
                }
                }
                
                if(self.timeRemaining <= 4)
                {
                HStack
                {
                    //FebeFace()
                        if(self.timeRemaining > 2)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Always remember to use a pair of earphones during the sessions for maximum effectiveness").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        }
                }
                }
            
            
            if(self.timeRemaining <= 2)
            {
            HStack {
                FebeFace()
                if(self.timeRemaining > 0)
                {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                    Text("And don't forget to check in daily with me to track your mood so we can see how you're progressing in your journey and we'll be able to offer you recommendations accordingly.").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))
                }
                }
            }
        }
        }
        .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
                    else if self.timeRemaining == 0
                    {
                        self.dummyIB = 1
                    }
            print(self.timeRemaining)
//            if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//            {
//                GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//                GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//            }
        }
    }
}

struct WatsonLifebeatsInfo: View {

    @State var t1 = 0
    @State var t2 = 0
    @State var t3 = 0
    @State var t4 = 0
    @State var t5 = 0
    @State var inputBar = 0
    @State var bar1 = 0
    @State var bar2 = 0
    @State var userName : String = " "
    @State var occu : String = " "
    @State var lastPadding : CGFloat = -1
    @State var timeRemaining = 12
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                //LazyVStack{
                
            HStack {
                FebeFace()
                if(self.timeRemaining > 10)
                {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                    Text("Sure thing, what would you like to know about Lifebeats?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))
                }
               
                }.padding()
                
                if(self.t1 == 1)
                {
                VStack {
                    
            Text(
                        self.userName
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                HStack {
//                    FebeFace()
//                    if(self.timeRemaining > 8)
//                    {
//                        FebeFace()
//                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    //else{
                    IntroText1(text: 1, dummyIB: $bar1)
                    //}
                   
                    }.padding()
                }
                  
                
                if(self.t2 == 1)
                {
                VStack {
                    
            Text(
                        self.userName
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                HStack {
//                    FebeFace()
//                    if(self.timeRemaining > 8)
//                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
//                    else{
                        IntroText1(text: 3, dummyIB: $bar2)
                   // }
                    }.padding()
                
                }
                
                
                if(self.t4 == 1)
                {
                VStack {
            Text(self.occu).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                
                HStack {
                    FebeFace()
                    if(self.timeRemaining > 2)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("Are you ready to get started on your Lifebeats journey, \(self.userName)?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(Bubble(chat:false))
                    }
                    }.padding()
                }
                
                if(self.t5 == 1)
                {
                VStack {
            Text("Absolutely").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                }
            }
            }.padding(.top, self.lastPadding)        //.navigationBarTitle("Febe")
        .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    }
            print(self.timeRemaining)
//            if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//            {
//                GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//                GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//            }
        }
            
        if (inputBar == 0 && self.timeRemaining < 10)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                
                    Button (action: {self.timeRemaining = 0; self.inputBar = 1; self.userName = "How does this app help me?"; self.t1 = 1;}){
                    Text("How does this app help me?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:250)}
                Button (action: {self.timeRemaining = 0; self.inputBar = 2; self.userName = "How can I use Lifebeats?"; self.t2 = 1; self.lastPadding = -100}){
                        Text("How can I use Lifebeats?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                            .clipShape(FeelingBubble()).frame(width:250)}
                
            }.padding(.leading, 10)
            
        }.frame(width: UIScreen.main.bounds.width, height: 120)
        
    }
        else if (inputBar == 1 && self.bar1 == 1)//self.timeRemaining < 8)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                
                Button (action: {
                    self.timeRemaining = 4; self.t4 = 1; self.inputBar = 3; self.occu = "Back to Home Screen"; self.lastPadding = -250;
                    self.presentationMode.wrappedValue.dismiss();
                }){
                Text("Back to Home Screen").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:250) }
                Button (action: {
                    self.timeRemaining = 0; self.t2 = 1; self.t1 = 0; self.inputBar = 2; self.userName = "How can I use Lifebeats?"; self.lastPadding = -100;
                }){
                Text("How can I use Lifebeats?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:250) }
                
                    }.padding(.leading, 20)
        }.frame(width: UIScreen.main.bounds.width, height: 120)
    }
        else if (inputBar == 2 && self.bar2 == 1)//self.timeRemaining < 6)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                
                Button (action: {
                    self.timeRemaining = 4; self.t4 = 1; self.inputBar = 3; self.occu = "Back to Home Screen"; self.lastPadding = -250;
                    self.presentationMode.wrappedValue.dismiss();
                }){
                Text("Back to Home Screen").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:250) }
                Button (action: {
                    self.timeRemaining = 0; self.t1 = 1; self.t2 = 0; self.inputBar = 1;
                    self.userName = "How does this app help me?"
                }){
                Text("How does this app help me?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:250) }
                
                    }.padding(.leading, 20)
        }.frame(width: UIScreen.main.bounds.width, height: 120)
    }
    else if (inputBar == 3 && self.timeRemaining < 2)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                HStack
                {
                Button (action: {
                    self.timeRemaining = 0; self.t5 = 1;               self.presentationMode.wrappedValue.dismiss();
                }){
                Text("Absolutely").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:150) }
                }
                    }.padding(.leading, 20)
        }.frame(width: UIScreen.main.bounds.width, height: 60)
    }
        
   // }
    }
}

struct WatsonLifebeatsInfo_Previews: PreviewProvider {
    static var previews: some View {
        WatsonLifebeatsInfo()
    }
}
