//
//  WatsonFirstTime.swift
//  LifeBeats
//
//  Created by User on 4/25/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase
import Purchases


struct IntroText3:View
{
    @State var text : Int
    @State var userName : String?
    @State var timeRemaining : Int
    @Binding var dummyIB : Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack
        {
            if(self.text == 1)
            {
                HStack
                {
                        if(self.timeRemaining > 4)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Thanks for sharing that with me! I'll be able to help you out more accurately with this information").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        }
                }
                
                if(self.timeRemaining <= 4)
                {
                HStack
                {
                    FebeFace()
                        if(self.timeRemaining > 2)
                        {                //FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("If you don't mind, could you also let me know your age group? This will help me understand your needs even better").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))
                        }
                }
                }
                
            }
            else if(self.text == 2)
            {
                HStack
                {
                        if(self.timeRemaining > 4)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Got it, thank you for letting me know.").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        }
                }
                
                if(self.timeRemaining <= 4)
                {
                HStack
                {
                        if(self.timeRemaining > 2)
                        {                FebeFace()
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("I think I have what I need now to help you out here on Lifebeats,\(self.userName!)").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)
                        }
                }
                }
                
                if(self.timeRemaining <= 2)
                {
                HStack
                {
                    FebeFace()
                        if(self.timeRemaining > 0)
                        {
                            TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                Text("Are you ready to get started on your Lifebeats journey, \(self.userName!)?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
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



struct IntroText2:View{
    @State var text : Int
    @State var showLan : Bool = true
    @State var userName : String?
    @State var finished : Bool = false
    @State var timeRemaining : Int
    @Binding var dummyIB : Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        VStack{
        if(self.text == 1)
        {
            HStack
            {
                    if(self.timeRemaining > 4)
                    {                FebeFace()
                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                Text("Hi and welcome to Lifebeats!").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 10)
                        
                    }
            }
            
            if(self.timeRemaining <= 4)
            {
            HStack
            {
                    if(self.timeRemaining > 2)
                    {                FebeFace()
                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                Text("My name is Febe and I will be your assistant here on Lifebeats. I'm excited to see you here!").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray).clipShape(Bubble(chat:false)).padding(.leading, 50)
                    }
            }
            }
            
            if(self.timeRemaining <= 2)
            {
            HStack
            {
                FebeFace()
                    if(self.timeRemaining > 0)
                    {                //FebeFace()
                        TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                Text("Could you give me your nickname or handle?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.trailing, 20)
                    }
            }
            }
        }
        else if(self.text == 3)
        {
            HStack
            {
                if(self.timeRemaining > 6)
                {                FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                Text("I'm happy to meet you \(self.userName!)").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.trailing, 30)
                }
            }
            
            if(self.timeRemaining <= 6)
            {
            HStack
            {
                if(self.timeRemaining > 4)
                {                FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                Text("As your assistant here on Lifebeats, my job is to help you understand your emotions better while helping you decide what type of mindfulness will be most appropriate to help you on your journey").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false)).padding(.leading, 50)
                }
            }
            }
            

            if(self.timeRemaining <= 4)
            {
            HStack {
                //FebeFace()
                if(self.timeRemaining > 2)
                {              FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                    VStack{
                    HStack{
            Text("Please choose a language (if not English)").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))}
                    
                        
                        if(self.showLan == true)
                        {
                        HStack{

                        Button (action: {
                            //self.t1 = 1; self.ad = true
                            self.showLan = false
                            self.finished = true
                            self.timeRemaining = 2
                            UserDefaults.standard.set("id", forKey: "lang")
                        }){
                        Text("Indonesian").font(Font.custom("Nexa Bold", size: 10)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:80) }
                        Button (action: {
                            //self.t1 = 1; self.ad = true
                            self.showLan = false
                            self.finished = true
                            self.timeRemaining = 2
                            UserDefaults.standard.set("es", forKey: "lang")
                        }){
                        Text("Spanish").font(Font.custom("Nexa Bold", size: 10)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:80) }
                        Button (action: {
                            //self.t1 = 1; self.ad = true
                            self.showLan = false
                            self.finished = true
                            self.timeRemaining = 2
                            UserDefaults.standard.set("zh-CN", forKey: "lang")
                        }){
                        Text("Mandarin").font(Font.custom("Nexa Bold", size: 10)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:80) }
                        Button (action: {
                            //self.t1 = 1; self.ad = true
                            self.showLan = false
                            self.finished = true
                            self.timeRemaining = 2
                            UserDefaults.standard.set("en", forKey: "lang")
                        }){
                        Text("Eng").font(Font.custom("Nexa Bold", size: 10)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:80) }
                        
                        }.padding(.top, 10)}
                    }
                }

                
                
            }

            }
            if(self.timeRemaining <= 2 && self.finished == true)
            {
            HStack
            {
                FebeFace()
                if(self.timeRemaining > 0)
                {                //FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                Text("For me to understand you better, could you let me know what your occupation is?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
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
                    else if (self.timeRemaining == 0 && self.text == 1)
                    {
                        self.dummyIB = 1
                    }
                    else if (self.timeRemaining == 0 && self.text == 3 && self.finished == true)
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

struct WatsonFirstTime: View {
    
    @State var t1 = 0
    @State var t2 = 0
    @State var t3 = 0
    @State var t4 = 0
    @State var t5 = 0
    @State var bar1 = 0
    @State var bar2 = 0
    @State var bar3 = 0
    @State var bar4 = 0
    @State var inputBar = 0
    @State var yesReply = 0
    @State var durationReply = 0
    @State var feelingReply = 0
    @State var info = 0
    @State var tutorial = 0
    @State var feeling: String = " "
    @State var greeting: String = " "
    @State var messageText: String = " "
   // @State var name : String = " "
    @State var name : String = " "
    @State var occu : LocalizedStringKey = " "
    @State var occu1 : String = " "
    @State var age : String = " "
    @State var lastPadding : CGFloat = -1
    let db = Firestore.firestore()
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    @State var timeRemaining = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    var body: some View {
        
        if(self.info == 1 && self.timeRemaining == 0)
        {
            FirstWatsonInfo()
        }
        else if(self.tutorial == 1 && self.timeRemaining == 0)
        {
            SUTutorial()
        }
        else
        {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
           // LazyVStack{
                
            HStack {

                    IntroText2(text: 1, timeRemaining: 6, dummyIB: $bar1)
                
                }.padding()
                
                if(self.t1 == 1)
                {
                VStack {
                    
            Text(
                        self.name
                ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                
                HStack {

                        IntroText2(text: 3,userName: self.name, timeRemaining: 8, dummyIB: $bar2)
                    
                   
                    }.padding()
                }
                
                
                if(self.t2 == 1)
                {
                VStack {
            Text(self.occu).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                
                HStack {

                        IntroText3(text: 1, timeRemaining: 6, dummyIB: $bar3)
                    
                    }.padding()
                }
                
                if(self.t3 == 1)
                {
                VStack {
            Text(self.age).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                    .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                }
                
                HStack {

                        IntroText3(text: 2,userName: self.name, timeRemaining: 6, dummyIB: $bar4)
                    
                    }.padding()
                }
                
                
                if(self.t4 == 1)
                {
                    VStack {
                Text("Yes").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                HStack {
                    FebeFace()
                    if(self.timeRemaining > 2)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("Awesome, feel free to check back with me anytime to track your mood and get mindfulness recommendations").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(Bubble(chat:false))
                    }
                    }.padding()
                }
                
                if(self.t5 == 1)
                {
                    VStack {
                Text("Tell me more about lifebeats").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                }
                
            }
            }.padding(.top, self.lastPadding) 
        .onAppear(perform:
        {
            UserDefaults.standard.set(true, forKey: "newUserAdd")
            print("Something")
        })
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
if (inputBar == 0 && self.bar1 == 1)
{
    ChatTextField(sendAction: sendName)
}
        
else if (inputBar == 1 && self.bar2 == 1)
    {
    
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                HStack
                {
                Button (action: {
                    self.lastPadding = -400; self.occu = "Full time Employed"; self.occu1 = "Full time Employed"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("   Full time Employed   ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                Button (action: {
                    self.lastPadding = -400; self.occu = "Part time Employed"; self.occu1 = "Part time Employed"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("   Part time Employed   ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                }
                HStack
                {
                Button (action: {
                    self.lastPadding = -400; self.occu = "Full time Student"; self.occu1 = "Full time Student"; self.t2 = 1; self.inputBar = 2;
                    }){
                Text("     Full time Student     ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:180) }
                Button (action: {
                    self.lastPadding = -400; self.occu = "Part time Student"; self.occu1 = "Part time Student"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("     Part time Student     ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                }
                HStack
                {
                    Button (action: {self.lastPadding = -400; self.occu = "Freelance"; self.occu1 = "Freelance"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("             Freelance             ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                    Button (action: {self.lastPadding = -400; self.occu = "Homemaker"; self.occu1 = "Homemaker"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("            Homemaker            ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                }
                HStack
                {
                    Button (action: {self.lastPadding = -400; self.occu = "Stay at home parents"; self.t2 = 1; self.inputBar = 2; self.occu1 = "Stay at home parents";
                    }){
                Text("Stay at home parents").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:180) }
                    Button (action: {self.lastPadding = -400; self.occu = "Retired"; self.occu1 = "Retired"; self.t2 = 1; self.inputBar = 2;
                }){
                Text("                Retired                ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                }
                HStack
                {
                    Button (action: {self.lastPadding = -400; self.occu = "Unemployed"; self.t2 = 1; self.inputBar = 2; self.occu1 = "Unemployed";
                    }){
                Text("            Unemployed           ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:180) }
                    Button (action: {self.lastPadding = -400; self.occu = "Prefer not to say"; self.t2 = 1; self.inputBar = 2; self.occu1 = "Prefer not to say";
                }){
                Text("        Prefer not to say       ").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:180) }
                }
                    }
        }.frame(width: UIScreen.main.bounds.width, height: 300).padding(.top, 20)
               
    }
    else if (inputBar == 2 && self.bar3 == 1)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                HStack
                {
                    Button (action: {self.lastPadding = -600; self.age = "13-18"; self.t3 = 1; self.inputBar = 3;
                        self.addToDB();
                    }){
                    Text("13-18").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:100)}
                    Button (action: {self.lastPadding = -600; self.age = "18-25"; self.t3 = 1; self.inputBar = 3;
                        self.addToDB();
                    }){
                        Text("18-25").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(lifeBeatsColor)
                            .clipShape(FeelingBubble()).frame(width:100)}
                }
                HStack
                {
                    Button (action: {self.lastPadding = -600; self.age = "25-45"; self.t3 = 1; self.inputBar = 3;
                        self.addToDB();
                    }){
                    Text("25-45").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:100)}
                    Button (action: {self.lastPadding = -600; self.age = "45-65"; self.t3 = 1; self.inputBar = 3;
                        self.addToDB();
                    }){
                    Text("45-65").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:100)}
                }
                
                HStack
                {
                    Button (action: {self.lastPadding = -600; self.age = "65 and up"; self.t3 = 1; self.inputBar = 3;
                        self.addToDB();
                    }){
                Text("65 and up").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(lifeBeatsColor)
                    .clipShape(FeelingBubble()).frame(width:150)}
                }
            }.padding(.leading, 10)
            
        }.frame(width: UIScreen.main.bounds.width, height: 150).padding(.top, 25)

    }
        else if (inputBar == 3 && self.bar4 == 1)
                {
                    ScrollView(.vertical, showsIndicators: false)
                    {
                        VStack{
                            
                            Button (action: {self.lastPadding = -850; self.t4 = 1; self.timeRemaining = 4; self.tutorial = 1;}){
                                Text("Yes").font(Font.custom("Nexa Bold", size: 13)).padding().foregroundColor(.white).background(lifeBeatsColor)
                                    .clipShape(FeelingBubble()).frame(width:130)}
                            Button (action: {self.lastPadding = -750; self.t5 = 1; self.info = 1; self.timeRemaining = 2;}){
                                    Text("Tell me more about Lifebeats").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                                        .clipShape(FeelingBubble()).frame(width:250)}
                            
                        }.padding(.leading, 10)
                        
                    }.frame(width: UIScreen.main.bounds.width, height: 100)
                    
                }
        }
    //}
    }
    
    private func sendName(name:String)
    {
        self.messageText = name
        if (self.messageText == "" || self.messageText == " " || self.messageText == "  " || self.messageText == "   " || self.messageText == "    " || self.messageText == "     ")
        {
            print("Nothing")
        }
        else
        {
            UserDefaults.standard.set(name, forKey: "userName")
            self.name = name
            self.t1 = 1;
            self.inputBar = 1;
            self.lastPadding = -220;
//            let uid = UserDefaults.standard.string(forKey: "UID")!
//            let email = UserDefaults.standard.string(forKey: "email")
//            self.name = name
//            let docRef = db.collection("Users").document(uid)
//
//            docRef.getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let docData = document.data()
//                    //print(docData!["name"]!)
//                    let name = docData!["name"] as! String
//                    UserDefaults.standard.set(name, forKey: "userName")
//                   // self.uAlreadyExist = true
//                } else {
//                    print("Document does not exist")
//                }
//            }
            //self.page = page + 1
        }
        
    }
    
    
    func addToDB()
    {
       // print(userAlreadyExist)
        
            let calendar = Calendar.current
           // let refreshDate = calendar.startOfDay(for: .currentTimeTomorrow)
            let date = Date()
            let components = calendar.dateComponents(
                [.hour, .minute, .second, .nanosecond],
                from: date
            )

            let tomorrow = calendar.nextDate(
                after: date,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let yesterday = calendar.nextDate(
                after: date,
                matching: components,
                matchingPolicy: .nextTime,
                direction: .backward
            )
            
            let t1 = calendar.nextDate(
                after: tomorrow!,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let t2 = calendar.nextDate(
                after: t1!,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let t3 = calendar.nextDate(
                after: t2!,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let t4 = calendar.nextDate(
                after: t3!,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let t5 = calendar.nextDate(
                after: t4!,
                matching: components,
                matchingPolicy: .nextTime
            )
            
            let t6 = calendar.nextDate(
                after: t5!,
                matching: components,
                matchingPolicy: .nextTime
            )
                        
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let result = formatter.string(from: tomorrow!)
            let result1 = formatter.string(from: date)
            let result2 = formatter.string(from: yesterday!)
            UserDefaults.standard.set(result, forKey: "tomorrow")
            UserDefaults.standard.set(result1, forKey: "today")
            UserDefaults.standard.set(result2, forKey: "yesterday")
            
        let uid = UserDefaults.standard.string(forKey: "UID")
        let email = UserDefaults.standard.string(forKey: "email")
            UserDefaults.standard.set(0, forKey: "usageTime")
            Purchases.debugLogsEnabled = true
            Purchases.configure(withAPIKey: "FdZDlXwfNwZUaEzhmjFEDpLDmbpBdLVy", appUserID: uid)
            let ref = db.collection("Users").document(uid!).setData([
            "ageRange": self.age,
            "email": email ?? "nil",
            "name": self.name,
            "occupation": self.occu1,
                "lastLoggedInDate": result1,
                "nextWeekDate": t6!,
                "totalSessions": 0,
                "5minsDestressCompleted": false,
                "angerManagementCompleted": false,
                "anxietyReliefCompleted": false,
                "approachingDeadlinesCompleted": false,
                "beforeAGatheringCompleted": false,
                "deepFocusCompleted": false,
                "endOfDayUnwindCompleted": false,
                "gratitudeCompleted": false,
                "improvingYourFocusCompleted": false,
                "meditationCompleted": false,
                "midDayDestressCompleted": false,
                "onTheGoBreathingCompleted": false,
                "postStudyUnwindCompleted": false,
                "preWorkOutPreparationCompleted": false,
                "sleepCompleted": false,
                "studyBreakCompleted": false,
                "mindfulBeginner": false,
                "mindfulVeteran": false,
                "zenMaster": false,
                "lullaby": false,
                "inTheZone": false,
                "curiosity": false,
                "lifebeatsLite": true,
                "lifebeatsPro": false,
                "febeIntroduced": true,
                "1.9.1Introduced": true,
                "sleepPerWeek": 0,
                "meditationPerDay": 0.0,
                "meditationPerWeek": 0.0,
                "focusPerWeek": 0,
                "consecutiveDays": 1,
                "Lives": 5
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        print("added")
                        UserDefaults.standard.set(self.name, forKey: "userName")
                        UserDefaults.standard.set(self.occu1, forKey: "occupation")
                    }
                }
            
            
            UserDefaults.standard.set(false, forKey: "bd8")
            UserDefaults.standard.set(false, forKey: "bd7")
            UserDefaults.standard.set(false, forKey: "bd6")
            UserDefaults.standard.set(false, forKey: "bd5")
            UserDefaults.standard.set(false, forKey: "bd4")
            UserDefaults.standard.set(false, forKey: "bd3")
            UserDefaults.standard.set(false, forKey: "bd2")
            UserDefaults.standard.set(false, forKey: "bd1")
        UserDefaults.standard.set(5, forKey: "Lives")
        UserDefaults.standard.set(Date(), forKey: "creationTime")
            
            
            let ref1 = db.collection("UsageLog").document(uid!).setData([
            "email": email ?? "nil",
            "name": self.name,
            "totalMinutes": 0,
            result1: 0
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        print("added")
                        UserTimer.sharedInstance.timerStarts()
                    }
                }
    }
}

struct WatsonFirstTime_Previews: PreviewProvider {
    static var previews: some View {
        WatsonFirstTime()
    }
}
