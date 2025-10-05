//
//  WatsonIntroExisting.swift
//  LifeBeats
//
//  Created by User on 4/25/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct IntroText:View{

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
            HStack {
                //FebeFace()
                if(self.timeRemaining > 6)
                {                FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("Hi and welcome back to Lifebeats \(self.userName!)").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)}}
            
            if(self.timeRemaining <= 6)
            {
            HStack {
                //FebeFace()
                if(self.timeRemaining > 4)
                {                FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("My name is Febe and I will be your assistant here on Lifebeats moving forward").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)}}
            }
            
            if(self.timeRemaining <= 4)
            {
            HStack {
                //FebeFace()
                if(self.timeRemaining > 2)
                {                FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("I'll be helping you understand your emotions better and what type of mindfulness will be most appropriate to help you on your journey").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false)).padding(.leading, 50)}}
            }
            
            
            if(self.timeRemaining <= 2)
            {
            HStack {
                FebeFace()
                if(self.timeRemaining > 0)
                {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("Are you ready to resume your Lifebeats journey, \(self.userName!)?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))}}
            }
        }
        else if(self.text == 5)
        {

        Text("Awesome, feel free to check back with me anytime to track your mood and get mindfulness recommendations").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
        .clipShape(Bubble(chat:false))
            
        }
        }.onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            else if self.timeRemaining == 0
            {
                self.dummyIB = 1
            }
//    if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//    {
//        GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//        GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//    }
}
    }
}


struct WatsonIntroExisting: View {
    
    @State var t1 = 0
    @State var t2 = 0
    @State var t3 = 0
    @State var inputBar = 0
    @State var t4 = 0
    @State var t5 = 0
    @State var bar1 = 0
    @State var bar2 = 0
    @State var info = 0
    @State var feelingReply = 0
    @State var userName : String = " "
    @State var occu : String = " "
    @State var lastPadding : CGFloat = -1
    @State var timeRemaining = 0
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    var body: some View {
        
        if(self.info == 1 && self.timeRemaining == 0)
        {
            WatsonLifebeatsInfo()
        }
        else
        {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                
            HStack {
                    
                IntroText(text: 1, userName: self.userName, dummyIB: self.$bar1)
                            
                }.padding()
                
                if(self.t3 == 1)
                {
                VStack {
            Text(self.occu).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                }

                if(self.t4 == 1)
                {
                HStack {
                    FebeFace()
                    if(self.timeRemaining != 0)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        IntroText(text: 5, dummyIB: self.$bar1)
                    }
                    }.padding()
                
                }
                
                if(self.t5 == 1)
                {
                VStack {
            Text("Back to Home Screen").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
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
//                if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//                {
//                    GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//                    GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//                }
            }
        if (inputBar == 0 && self.bar1 == 1)
                {
                    ScrollView(.vertical, showsIndicators: false)
                    {
                        VStack{
                            
                            Button (action: {self.timeRemaining = 2; self.t3 = 1; self.occu = "Yes"; self.inputBar = 1; self.t4 = 1; self.lastPadding = -150;
                                let ref1 = self.db.collection("Users").document(self.uid).setData([ "febeIntroduced" : true ], merge: true){ err in
                                            if let err = err {
                                                print("Error adding document: \(err)")
                                            } else {
                                                //print("Document added with ID: \(ref!.documentID)")
                                                print("added")
                                            }
                                        }
                                
                            }){
                                Text("Yes").font(Font.custom("Nexa Bold", size: 13)).padding().foregroundColor(.white).background(lifeBeatsColor)
                                    .clipShape(FeelingBubble()).frame(width:130)}
                            Button (action: {self.timeRemaining = 2; self.t3 = 1; self.occu = "Tell me more about Lifebeats"; self.info = 1; self.lastPadding = -150;
                                let ref1 = self.db.collection("Users").document(self.uid).setData([ "febeIntroduced" : true ], merge: true){ err in
                                            if let err = err {
                                                print("Error adding document: \(err)")
                                            } else {
                                                //print("Document added with ID: \(ref!.documentID)")
                                                print("added")
                                            }
                                        }
                                
                            }){
                                    Text("Tell me more about Lifebeats").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                                        .clipShape(FeelingBubble()).frame(width:250)}
                            
                        }.padding(.leading, 10)
                        
                    }.frame(width: UIScreen.main.bounds.width, height: 100)
                    
                }
                else if (inputBar == 1 && self.timeRemaining == 0)
                {
                    ScrollView(.vertical, showsIndicators: false)
                    {
                        VStack{
                            HStack
                            {
                            Button (action: {
                                self.timeRemaining = 0; self.t5 = 1;
                                
                                
                                
                                self.presentationMode.wrappedValue.dismiss();
                            }){
                            Text("Back to Home Screen").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                                .clipShape(FeelingBubble()).frame(width:180) }
                            }
                                }.padding(.leading, 20)
                    }.frame(width: UIScreen.main.bounds.width, height: 50)
                }
        }
        }

}

struct WatsonIntroExisting_Previews: PreviewProvider {
    static var previews: some View {
        WatsonIntroExisting()
    }
}
