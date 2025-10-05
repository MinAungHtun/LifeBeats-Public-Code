//
//  WatsonWidget.swift
//  LifeBeats
//
//  Created by User on 7/7/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import FirebaseAnalytics
import Firebase

struct WatsonWidget: View {
    @State var randomGreeting: String = " "
    //@State var showingProfile = false
    @State var category:String?
    @State var therapyIndex: Int = 0
    @State var therapyIndex2: Int = 0
    @State var therapyDurationIndex: Int = 11
    @State var firstText = 1
    @State var firstReply = 1
    @State var secondFeeling: String = " "
    @State var therapy: String = " "
    @State var secondFeelingReply = 0
    @State var reply = 0
    @State var reply2 = 0
    @State var inputBar = 0
    @State var yesReply = 0
    @State var durationReply = 0
    @State var before6pm : Bool?
    @State var after6pm : Bool?
    @State var after9pm : Bool?
    @State var before9pm : Bool?
    @State var morning : Bool?
    @State var afternoon : Bool?
    @State var evening : Bool?
    @State var feelingReply = 0
    @State var feeling: String = " "
    @State var greeting: String = " "
    @State var therapyPlaying : Bool? = false
    @State var isStudent : Bool = false
    @State var isEmployed : Bool = false
    @State var userName : String = " "
    @State var occu : String = " "
    @State var positiveReply : String = " "
    @State var negativeReply : String = " "
    @State var finalReply : String = " "
    @State var lastPadding : CGFloat = -1
    
//    var userName : String
//        {
//            get {
//                return (UIApplication.shared.delegate as? AppDelegate)!.userName
//            }
//        }

    var weekDay : String
        {
            get {
                return (UIApplication.shared.delegate as? AppDelegate)!.dayOftheWeek
            }
        }
    
    var categories: [String: [Therapy]] {
        Dictionary(
            grouping: therapyData,
            by: { $0.category.rawValue }
        )
    }
    
    @EnvironmentObject var userData: UserData
    
    @State var timeRemaining = 8
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       

    
    var body: some View {
        VStack{
           // if(self.therapyPlaying == false){
            ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
                if (firstText == 1)
                {
            HStack {
                FebeFace()
                if(self.timeRemaining > 6)
                {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                    Text(self.randomGreeting).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                    .clipShape(Bubble(chat:false))
                }
               
                }.padding()
                }
                if (firstReply == 1)
                {
                    VStack {
                        if(self.timeRemaining <= 5)
                        {
                        Text(
                        "I am feeling..."
                    ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                        }

                    }
                    
                }
                if (feelingReply == 1)
                {
                    VStack {
                        
                Text(
                            self.feeling
                    ).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                        

                    }
                    
                }
                if (reply == 1)
                {
                    HStack {
                        FebeFace()
                        if(self.timeRemaining > 3)
                        {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                            Text(self.positiveReply).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false))
                        }
                       
                    }.padding()
                    VStack {
                        if(self.timeRemaining <= 2)
                        {
                        Text("I would like to...").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                            .clipShape(Bubble(chat:true))
                            .frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                        }
                       
                    }.padding()
                }
                if (reply == 2)
                {
                    HStack {
                        FebeFace()
                        if(self.timeRemaining > 3)
                        {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                            Text(self.negativeReply).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false))
                        }
                       
                    }.padding()
                    VStack {
                        if(self.timeRemaining <= 2)
                        {
                        Text("I would like to...").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                            .clipShape(Bubble(chat:true))
                            .frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                        }
                       
                    }.padding()
                }
                if (secondFeelingReply == 1)
                {
                    VStack {
                        
                        Text( self.secondFeeling).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                            .clipShape(Bubble(chat:true))
                        .frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                    }
                }
                if (reply2 == 1)
                {
                    HStack {
                        FebeFace()
                        if(self.timeRemaining != 0)
                        {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                            Text(self.finalReply).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false))
                                .onAppear(perform: {self.lastPadding = -180})
                                //.onDisappear(perform: {
                                  //  self.lastPadding = -1
                                //})
                        }
                    }.padding()
                }
//                if (yesReply == 1)
//                {
//                    VStack {
//                        Text("Yes").padding().foregroundColor(.white).background(Color.blue)
//                            .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
//                            .padding(.leading, -50)
//                }
//                }
            }
            }.padding(.top, self.lastPadding)
            //.onAppear(perform: {GlobalPlayer.sharedInstance.stopMusic()})
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
if (inputBar == 0 && self.timeRemaining <= 5)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                HStack
                {
                    Button (action: {self.reply = 1;self.feelingReply = 1;self.feeling = "Calm"; self.inputBar = 1; self.therapyIndex = 10;self.timeRemaining = 5;}){
                    Text("      Calm      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                        .clipShape(FeelingBubble()).frame(width:130)}
                    Button (action: {self.reply = 1;self.feelingReply = 1;self.feeling = "Grateful"; self.inputBar = 1; self.therapyIndex = 11;self.timeRemaining = 5;}){
                        Text("    Grateful    ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                            .clipShape(FeelingBubble()).frame(width:130)}
                }
                HStack
                {
                    Button (action: {self.reply = 1;self.feelingReply = 1;self.feeling = "Motivated"; self.inputBar = 1; self.therapyIndex = 12;self.timeRemaining = 5;}){
                    Text("  Motivated  ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                        .clipShape(FeelingBubble()).frame(width:130)}
                    Button (action: {self.reply = 1;self.feelingReply = 1;self.feeling = "Happy"; self.inputBar = 1; self.therapyIndex = 9;self.timeRemaining = 5;}){
                    Text("      Happy      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                        .clipShape(FeelingBubble()).frame(width:130)}
                }
                
                HStack
                {
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Meh"; self.inputBar = 1; self.therapyIndex = 8;self.timeRemaining = 5;}){
                Text("       Meh        ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.yellow)
                    .clipShape(FeelingBubble()).frame(width:130)}
                    Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Sad"; self.inputBar = 1; self.therapyIndex = 7;self.timeRemaining = 5;}){
                    Text("       Sad        ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                        .clipShape(FeelingBubble()).frame(width:130)}
                }
                HStack
                {
                Button (action: {self.reply = 2; self.feelingReply = 1;self.feeling = "Tired"; self.inputBar = 1; self.therapyIndex = 1; self.timeRemaining = 5;}){
                Text("      Tired      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                    .clipShape(FeelingBubble()).frame(width:130) }
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Stressed"; self.inputBar = 1; self.therapyIndex = 2;self.timeRemaining = 5;}){
                Text("   Stressed    ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                    .clipShape(FeelingBubble()).frame(width:130)}
                }
                
                HStack
                {
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Anxious"; self.inputBar = 1; self.therapyIndex = 3;self.timeRemaining = 5;}){
                Text("    Anxious    ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                    .clipShape(FeelingBubble()).frame(width:130)}
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Angry"; self.inputBar = 1; self.therapyIndex = 5;self.timeRemaining = 5;}){
                Text("      Angry       ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                        .clipShape(FeelingBubble()).frame(width:130)}
                }
                HStack
                {
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Demotivated"; self.inputBar = 1; self.therapyIndex = 4;self.timeRemaining = 5;}){
                Text("Demotivated").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(Color.red)
                    .clipShape(FeelingBubble()).frame(width:130)}
                Button (action: {self.reply = 2;self.feelingReply = 1;self.feeling = "Depressed"; self.inputBar = 1; self.therapyIndex = 6;self.timeRemaining = 5;}){
                Text("  Depressed  ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.red)
                    .clipShape(FeelingBubble()).frame(width:130)}
                }
            }.padding(.leading, 10)
            
        }.frame(width: UIScreen.main.bounds.width, height: 350)
        
    }
    else if (inputBar == 1 && self.timeRemaining < 3)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
                HStack
                {
                Button (action: {self.inputBar = 2; self.reply2 = 1; self.secondFeelingReply = 1; self.secondFeeling = "be relaxed"; self.therapyIndex2 = 1;
                    self.therapy = "Sleep & Destress";
                    self.category = "Sleep";
                    self.timeRemaining = 2;self.getTherapy();self.recordMood();
                }){
                Text("be  relaxed").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                Button (action: {self.inputBar = 2; self.reply2 = 1; self.secondFeelingReply = 1; self.therapyIndex2 = 2;
                    self.secondFeeling = "feel happier";
                    self.therapy = "Meditation";
                    self.category = "Meditation";
                    self.timeRemaining = 2;self.getTherapy();self.recordMood();
                }){
                Text("feel happier").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                }
                HStack
                {
                Button (action: {self.inputBar = 2; self.reply2 = 1; self.secondFeelingReply = 1; self.therapyIndex2 = 3; self.secondFeeling = "be focused";
                        self.therapy = "Focus";
                        self.category = "Deep Focus";
                    self.timeRemaining = 2;self.getTherapy();self.recordMood();
                    }){
                Text("be focused").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                        .clipShape(FeelingBubble()).frame(width:130) }
                Button (action: {self.inputBar = 2; self.reply2 = 1; self.secondFeelingReply = 1; self.therapyIndex2 = 4; self.secondFeeling = "increase motivation"; self.therapy = "Remedies";
                    self.category = "Quick Remedies";
                    self.timeRemaining = 2;self.getTherapy();self.recordMood();
                }){
                Text("increase motivation").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                }

//                    }.padding(.leading, 20)
//        }.frame(width: UIScreen.main.bounds.width, height: 150)
//    }
//    else if (inputBar == 4 && self.timeRemaining < 3)
//    {
//        ScrollView(.vertical, showsIndicators: false)
//        {
//            VStack{
                HStack
                {
                Button (action: {self.inputBar = 2;  self.secondFeelingReply = 1; self.secondFeeling = "Sleep"; self.therapyIndex2 = 5;
                    self.therapy = "Sleep";self.reply2 = 1;
                    self.category = "Sleep";self.timeRemaining = 2;self.getTherapy();self.recordMood();
                }){
                Text("     Sleep     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                Button (action: {self.inputBar = 2; self.secondFeelingReply = 1; self.therapyIndex2 = 6; self.secondFeeling = "Meditate";
                    self.therapy = "Meditation";
                    self.category = "Meditation";self.timeRemaining = 2;self.getTherapy();self.reply2 = 1;self.recordMood();
                }){
                Text(" Meditate ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                }
                HStack
                {
                Button (action: {self.inputBar = 2;  self.secondFeelingReply = 1; self.therapyIndex2 = 7; self.secondFeeling = "Destress";
                        self.therapy = "Destress Remedies";
                    self.category = "Quick Remedies";self.timeRemaining = 2;self.getTherapy();self.reply2 = 1;self.recordMood();
                    }){
                Text("  Destress  ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                        .clipShape(FeelingBubble()).frame(width:130) }
                Button (action: {self.inputBar = 2; self.secondFeelingReply = 1; self.therapyIndex2 = 8; self.secondFeeling = "Study";
                    self.therapy = "Study";
                    self.category = "Student Living";self.timeRemaining = 2;self.getTherapy();self.reply2 = 1;self.recordMood();
                }){
                Text("     Study     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                    .clipShape(FeelingBubble()).frame(width:130) }
                }
                    }.padding(.leading, 20)
        }.frame(width: UIScreen.main.bounds.width, height: 400)
//        .onAppear(perform: {
//            self.recordMood()
//        })
    }
    else if (inputBar == 2 && self.timeRemaining == 0)
    {
    ScrollView(.horizontal, showsIndicators: false)
    {
        HStack{
                CustomizedCategoryRow(name: " ",items: [userData.therapies[self.therapyDurationIndex]])
//                    .onDisappear(perform: {
//                        self.lastPadding = -1
//                    })
            
            Button (action: {self.inputBar = 5;
            }){
            Text("Explore Options").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                .clipShape(FeelingBubble()).frame(width:200)
                
            }
            }.padding(.leading, 20)
    }.frame(width: UIScreen.main.bounds.width, height: 220)
    }
    else if (inputBar == 5)
    {
        CustomizedCategoryRow( name: "Browse Categories", items: [userData.therapies[16], userData.therapies[17],userData.therapies[18]])
    }
//    else if(inputBar == 6)
//    {
//        ScrollView(.horizontal, showsIndicators: false)
//        {
//        HStack
//        {
//        CategoryRow(categoryName: self.category!, items: self.categories[self.category!]!)
//            Button(action:{self.inputBar = 4; self.timeRemaining = 0})
//            {
//                Text("Explore Others")
//            }.padding()
//        }
//        }
//    }
           // }
//            else if(self.therapyPlaying == true)
//            {
//                TherapyDetail(therapy: self.userData.therapies[self.therapyDurationIndex])
//                    .environmentObject(self.userData).onAppear(perform: {
//                        self.lastPadding = 0;
//                    })
//            }
            
    }
        .onAppear(perform: randomizeResponse)
//        .onDisapper(perform:
//                        {
//                            self.lastPadding = 0
//                        })
//        .navigationBarTitle(title: "Febe")
    }
    
    func recordMood()
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        
        let ref = db.collection("UsageLog").document(uid!).setData([ "\(result)Mood" : self.feeling ], merge: true){ err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        print("added")
                    }
                }
    }
    
    func localizeLang (inputLang:String)
    {
        if(inputLang == "es")
        {
            self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
            self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
            self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
            if(self.morning == true)
            {
                self.greeting = "Buenos días"
            }
            else if(self.afternoon == true)
            {
                self.greeting = "Buenas tardes"
            }
            else if(self.evening == true)
            {
                self.greeting = "Buenas noche"
            }
            else
            {
                self.greeting = "Buenos días"
            }
            let number = Int.random(in: 1...4)
            let num2 = Int.random(in: 1...5)
           let num1 = Int.random(in: 1...5)
            let number2 = Int.random(in: 1...3)
            if (number == 1)
            {
                self.randomGreeting = "Me alegro de verte de nuevo \(self.userName). ¿Cómo te va hoy?                            "
            }
            else if (number == 2)
            {
                self.randomGreeting = "Espero que haya sido un buen día para ti \(self.userName). ¿Cómo te va hoy?                                "
            }
            else if (number == 3)
            {
                self.randomGreeting = "Es estupendo tenerte aquí \(self.greeting) \(self.userName). ¿Cómo te sientes actualmente?           "
            }
            else if (number == 4)
            {
                self.randomGreeting = "Contento \(self.weekDay)! Es estupendo tenerte aquí \(self.userName). ¿Cómo te sientes actualmente?"
            }
            else if (number == 5)
            {
                self.randomGreeting = "\(self.greeting). ¿Le puedo ayudar en algo?                        "
            }
            
            if (number2 == 1)
            {
                self.finalReply = "Gracias por informarme \(self.userName). He encontrado algo aquí que podría ayudarte \(self.therapy). Si no es así, no dudes en buscar otras terapias en nuestra página de Discover"
            }
            else if(number2 == 2)
            {
                self.finalReply = "Genial, aquí hay algo que podría ayudarte\(self.therapy). No dudes en buscar otras terapias en nuestra página de Discover"
            }
            else if(number2 == 3)
            {
                self.finalReply = "Genial, he encontrado algo que podría ayudarte\(self.therapy). Navega también por nuestra página Discover si quieres explorar más terapias"
            }
            
            if(num1 == 1)
            {
                self.positiveReply = "Perfecto, te sugeriremos una terapia para ti"
            }
            else if(num1 == 2)
            {
                self.positiveReply = "Genial, tenemos una idea de cómo podemos ayudarte hoy"
            }
            else if(num1 == 3)
            {
                self.positiveReply = "Vamos a encontrar una terapia para que te sientas mejor"
            }
            else if(num1 == 4)
            {
                self.positiveReply = "Así es. Tenemos una terapia perfecta para ti"
            }
            else if(num1 == 5)
            {
                self.positiveReply = "Buenas noticias. Prueba nuestra terapia. Te hará sentir mejor"
            }
            
            if(num2 == 1)
            {
                self.negativeReply = "Es muy triste pero podemos ayudarte a sentirte mejor"
            }
            else if(num2 == 2)
            {
                self.negativeReply = "Malas noticias. Prueba esto para animarte"
            }
            else if(num2 == 3)
            {
                self.negativeReply = "Es muy triste. Te ayudaremos a sentirte mejor"
            }
            else if(num2 == 4)
            {
                self.negativeReply = "Lamento escuchar eso pero podemos ayudarte"
            }
            else if(num2 == 5)
            {
                self.negativeReply = "Tenemos una terapia perfecta para hacerte sentir mejor"
            }
        }
        else if(inputLang == "id")
        {
            self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
            self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
            self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
            if(self.morning == true)
            {
                self.greeting = "Selamat pagi"
            }
            else if(self.afternoon == true)
            {
                self.greeting = "Selamat siang"
            }
            else if(self.evening == true)
            {
                self.greeting = "Selamat malam"
            }
            else
            {
                self.greeting = "Selamat pagi"
            }
            let number = Int.random(in: 1...4)
            let num2 = Int.random(in: 1...5)
           let num1 = Int.random(in: 1...5)
            let number2 = Int.random(in: 1...3)
            if (number == 1)
            {
                self.randomGreeting = "Senang bertemu denganmu lagi \(self.userName).  Apa kabarmu hari ini?                            "
            }
            else if (number == 2)
            {
                self.randomGreeting = "Hei \(self.userName).  Bagaimana kabarnya hari ini?”                               "
            }
            else if (number == 3)
            {
                self.randomGreeting = "Senang bertemu kamu disini \(self.greeting)\(self.userName).  Bagaimana perasaanmu?           "
            }
            else if (number == 4)
            {
                self.randomGreeting = "Senang bertemu kamu disini \(self.userName).  Bagaimana perasaanmu?"
            }
            else if (number == 5)
            {
                self.randomGreeting = "Sangat menyenangkan melihatmu disini. Senang \(self.weekDay).Bagaimana perasaanmu saat ini?                        "
            }
            
            if (number2 == 1)
            {
                self.finalReply = "Terima kasih telah memberi tahu saya \(self.userName).  Saya menemukan sesuatu yang dapat membantu kamu disini \(self.therapy). Jika tidak, jangan ragu untuk menelusuri terapi kami yang lain di halaman Temukan kami"
            }
            else if(number2 == 2)
            {
                self.finalReply = "Keren, ini sesuatu yang mungkin bisa membantu kamu\(self.therapy).  Silakan menelusuri terapi lain di halaman Temukan kami juga"
            }
            else if(number2 == 3)
            {
                self.finalReply = "Bagus, saya menemukan sesuatu yang bisa membantu \(self.therapy).  Silakan juga menelusuri halaman Temukan kami jika kamu ingin mengetahui lebih banyak terapi"
            }
            
            if(num1 == 1)
            {
                self.positiveReply = "Bagus, kami punya ide bagaimana kami bisa membantu kamu hari ini"
            }
            else if(num1 == 2)
            {
                self.positiveReply = "Sempurna, kami akan menyarankan sebuah terapi untuk kamu"
            }
            else if(num1 == 3)
            {
                self.positiveReply = "Kami akan mencocokkan sebuah terapi agar kamu merasa lebih baik"
            }
            else if(num1 == 4)
            {
                self.positiveReply = "Cara terbaik.  Kami memiliki terapi yang sempurna untukmu"
            }
            else if(num1 == 5)
            {
                self.positiveReply = "Kabar baik.  Coba terapi kami.  Terapi yang akan membuatmu merasa lebih baik"
            }
            
            if(num2 == 1)
            {
                self.negativeReply = "Ini sangat menyedihkan tetapi kami bisa membantu kamu untuk merasa lebih baik"
            }
            else if(num2 == 2)
            {
                self.negativeReply = "Kabar buruk.  Coba ini untuk meringankan dirimu sendiri"
            }
            else if(num2 == 3)
            {
                self.negativeReply = "Hal yang menyedihkan.  Kami akan membantu kamu untuk merasa lebih baik"
            }
            else if(num2 == 4)
            {
                self.negativeReply = "Saya prihatin mendengarnya tetapi kami dapat membantu"
            }
            else if(num2 == 5)
            {
                self.negativeReply = "Kami punya terapi yang sempurna untuk membuat kamu merasa lebih baik"
            }
        }
        else if(inputLang == "zh-CN")
        {
            self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
            self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
            self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
            if(self.morning == true)
            {
                self.greeting = "早上好"
            }
            else if(self.afternoon == true)
            {
                self.greeting = "下午好"
            }
            else if(self.evening == true)
            {
                self.greeting = "晚上好"
            }
            else
            {
                self.greeting = "早上好"
            }
            let number = Int.random(in: 1...4)
            let num2 = Int.random(in: 1...5)
           let num1 = Int.random(in: 1...5)
            let number2 = Int.random(in: 1...3)
            if (number == 1)
            {
                self.randomGreeting = "很高兴再次见到你\(self.userName)，你今天过得好吗？                            "
            }
            else if (number == 2)
            {
                self.randomGreeting = "嘿，\(self.userName)，今天过得怎么样，伙计？                               "
            }
            else if (number == 3)
            {
                self.randomGreeting = "很高兴有你在这里 \(self.greeting), \(self.userName)！你感觉怎么样？           "
            }
            else if (number == 4)
            {
                self.randomGreeting = "快乐\(self.weekDay)！我希望这对你来说是一件好事。今天怎么样?"
            }
            else if (number == 5)
            {
                self.randomGreeting = "很高兴您能来到这里 \(self.userName)。你目前感觉如何？                        "
            }
            
            if (number2 == 1)
            {
                self.finalReply = "感谢您让我知道 \(self.userName)。我在这里找到了一些可以帮助您\(self.therapy) 的东西。否则，请随时在我们的发现页面上浏览我们的其他疗法"
            }
            else if(number2 == 2)
            {
                self.finalReply = "很酷，这里有一些可能对你有帮助的东西 \(self.therapy)。也可以在我们的发现页面上随意浏览其他疗法：D"
            }
            else if(number2 == 3)
            {
                self.finalReply = "太好了，我找到了可以帮助\(self.therapy) 的东西。如果您想探索更多疗法，也请浏览我们的发现页面：D"
            }
            
            if(num1 == 1)
            {
                self.positiveReply = "太好了，我们知道如何在今天为您提供帮助"
            }
            else if(num1 == 2)
            {
                self.positiveReply = "完美，我们会为您推荐一种疗法"
            }
            else if(num1 == 3)
            {
                self.positiveReply = "我们将为您匹配一种疗法让您感觉更好"
            }
            else if(num1 == 4)
            {
                self.positiveReply = "一路走好。我们为您准备了完美的疗法"
            }
            else if(num1 == 5)
            {
                self.positiveReply = "好消息。试试我们的疗法。它会让你感觉更好"
            }
            
            if(num2 == 1)
            {
                self.negativeReply = "很伤心，但我们可以帮助您感觉更好"
            }
            else if(num2 == 2)
            {
                self.negativeReply = "坏消息。试试这个让自己轻松起来"
            }
            else if(num2 == 3)
            {
                self.negativeReply = "伤心事。我们将帮助您感觉更好"
            }
            else if(num2 == 4)
            {
                self.negativeReply = "我很遗憾听到这个消息，但我们可以提供帮助"
            }
            else if(num2 == 5)
            {
                self.negativeReply = "我们有完美的疗法让您感觉更好"
            }
        }
    }
    
    func randomizeResponse()
    {
        self.firstText = 1
        self.firstReply = 1
        self.secondFeeling = " "
        self.therapy = " "
        self.secondFeelingReply = 0
        self.reply = 0
        self.reply2 = 0
        self.inputBar = 0
        self.yesReply = 0
        self.durationReply = 0
        self.feelingReply = 0
        self.lastPadding = -1
        self.timeRemaining = 8
        let lang = UserDefaults.standard.string(forKey: "lang") ?? "en"
        self.userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
        self.occu = UserDefaults.standard.string(forKey: "occupation") ?? "User"
        self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
        self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
        self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)
        if(self.occu == "Full time Student" || self.occu == "Part time Student")
        {
            self.isStudent = true
        }
        if(self.occu == "Full time Employed" || self.occu == "Part time Employed")
        {
            self.isEmployed = true
        }
        if(lang != "en")
        {
            localizeLang(inputLang: lang)
        }
        else
        {
            if(self.morning == true)
            {
                self.greeting = "Good morning"
            }
            else if(self.afternoon == true)
            {
                self.greeting = "Good afternoon"
            }
            else if(self.evening == true)
            {
                self.greeting = "Good evening"
            }
            else
            {
                self.greeting = "Good morning"
            }
        let number = Int.random(in: 1...5)
        let num2 = Int.random(in: 1...5)
        let number1 = Int.random(in: 25...37)
        let num1 = Int.random(in: 38...49)
        let number2 = Int.random(in: 1...3)
        self.before6pm = evaluateTime(from: 6,to: 18, toMinutes: 0, toSeconds: 0)
        self.after6pm = evaluateTime(from: 18,to: 23, toMinutes: 59, toSeconds: 59)
        self.after9pm = evaluateTime(from: 21,to: 23, toMinutes: 59, toSeconds: 59)
        self.before9pm = evaluateTime(from: 6,to: 21, toMinutes: 0, toSeconds: 0)
        //before then after and if both conditions are not met, therapy for after.
        
        
        if (number == 1)
        {
            self.randomGreeting = "Nice to see you again \(self.userName), How are you doing today?                            "
        }
        else if (number == 2)
        {
            self.randomGreeting = "Hey there \(self.userName), How's it going today, mate?                                "
        }
        else if (number == 3)
        {
            self.randomGreeting = "Great to have you here \(self.greeting), \(self.userName)! How are you feeling?           "
        }
        else if (number == 4)
        {
            self.randomGreeting = "Happy \(self.weekDay)! I hope it's been a good one for you. How's it going today?"
        }
        else if (number == 5)
        {
            self.randomGreeting = "It's great to have you here \(self.userName). How are you currently feeling?                               "
        }
        
        if(num2 == 5)
        {
    self.positiveReply = "\(self.userName)."+userData.conversations[number1].line
        self.negativeReply = "\(self.userName)."+userData.conversations[num1].line
        }
        else if(num2 > 0 && num2 < 5)
        {
            self.positiveReply = userData.conversations[number1].line
            self.negativeReply = userData.conversations[num1].line
        }
        
        if (number2 == 1)
        {
            self.finalReply = "Thanks for letting me know \(self.userName). I found something here that could help you \(self.therapy). Otherwise, feel free to browse our other therapies on our Discover page"
        }
        else if (number2 == 2)
        {
            self.finalReply = "Cool, here’s something that might help you \(self.therapy). Feel free to browse other therapies on our Discover page as well :D"
        }
        else if (number2 == 3)
        {
            self.finalReply = "Great, I found something that could help \(self.therapy). Please also browse our Discover page if you want to explore more therapies :D"
        }
        }
        Analytics.setScreenName("Watson", screenClass: "Main")
    }
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
    
    func getTherapy()
    {
        if (self.therapyIndex == 1 && self.therapyIndex2 == 1 && self.after9pm == true)
        {
            self.therapyDurationIndex = 17;
            self.therapy = "15 minutes sleep";
        }
        else if (self.therapyIndex2 == 5)
        {
            self.therapyDurationIndex = 17;
            self.therapy = "15 minutes sleep";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 1 && self.before9pm == true)
        {
            self.therapyDurationIndex = 17;
            self.therapy = "15 minutes sleep";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 1)
        {
            self.therapyDurationIndex = 17;
            self.therapy = "15 minutes sleep";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 3)
        {
            self.therapyDurationIndex = 22;
            self.therapy = "improving your focus";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 4)
        {
            self.therapyDurationIndex = 24;
            self.therapy = "seeking balance";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 4 && self.isEmployed == true)
        {
            self.therapyDurationIndex = 28;
            self.therapy = "setting time boundaries";
        }
        else if (self.therapyIndex == 1 && self.therapyIndex2 == 7)
        {
            self.therapyDurationIndex = 13;
            self.therapy = "post study unwind";
        }
        else if (self.therapyIndex == 1)
        {
            let random = Int.random(in: 1...8)
            if (random == 1)
            {
            self.therapyDurationIndex = 15;
            self.therapy = "study break";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
            }
            else if (random == 3)
            {
            self.therapyDurationIndex = 14;
            self.therapy = "5 minutes destress";
            }
            else if (random == 4)
            {
            self.therapyDurationIndex = 8;
            self.therapy = "midday destress";
            }
            else if (random == 5)
            {
            self.therapyDurationIndex = 11;
            self.therapy = "end of day unwind";
            }
            else if (random == 6)
            {
            self.therapyDurationIndex = 13;
            self.therapy = "post study unwind";
            }
            else if (random == 7)
            {
            self.therapyDurationIndex = 24;
            self.therapy = "seeking balance";
            }
            else if (random == 8)
            {
            self.therapyDurationIndex = 34;
            self.therapy = "dealing with physical pain";
            }
        }
        else if(self.therapyIndex == 2 && self.isStudent == true && self.therapyIndex2 == 4 && self.before6pm == true)
        {
            self.therapyDurationIndex = 15;
            self.therapy = "study break";
        }
        else if(self.therapyIndex == 2 && self.isStudent == true && (self.therapyIndex2 == 1 || self.therapyIndex2 == 4) && self.after6pm == true)
        {
            self.therapyDurationIndex = 13;
            self.therapy = "post study unwind";
        }
        else if((self.therapyIndex == 2 && self.therapyIndex2 == 1 && self.before6pm == true && self.isEmployed == true)||(self.therapyIndex == 2 && self.therapyIndex2 == 2 && self.before6pm == true && self.isEmployed == true))
        {
            self.therapyDurationIndex = 29;
            self.therapy = "desk meditation";
        }
        else if((self.therapyIndex == 2 && self.therapyIndex2 == 1 && self.after6pm == true && self.isEmployed == true)||(self.therapyIndex == 2 && self.therapyIndex2 == 2 && self.after6pm == true && self.isEmployed == true))
        {
            self.therapyDurationIndex = 11;
            self.therapy = "end of day unwind";
        }
        else if ((self.therapyIndex == 2 && self.therapyIndex2 == 2 && self.before6pm == true)||(self.therapyIndex == 2 && self.therapyIndex2 == 4 && self.before6pm == true))
        {
            self.therapyDurationIndex = 8;
            self.therapy = "mid day destress";
        }
        else if ((self.therapyIndex == 2 && self.therapyIndex2 == 2 && self.after6pm == true)||(self.therapyIndex == 2 && self.therapyIndex2 == 4 && self.after6pm == true)||(self.therapyIndex == 2 && self.therapyIndex2 == 1 && self.after6pm == true))
        {
            self.therapyDurationIndex = 11;
            self.therapy = "end of day unwind";
        }
        else if ((self.therapyIndex == 2 && self.therapyIndex2 == 2)||(self.therapyIndex == 2 && self.therapyIndex2 == 4)||(self.therapyIndex == 2 && self.therapyIndex2 == 1))
        {
            self.therapyDurationIndex = 11;
            self.therapy = "end of day unwind";
        }
        else if (self.therapyIndex == 2 && self.therapyIndex2 == 1 && self.before6pm == true)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if(self.therapyIndex == 2 && self.isStudent == true && self.therapyIndex2 == 3)
        {
            self.therapyDurationIndex = 16;
            self.therapy = "deep focus";
        }
        else if(self.therapyIndex == 2 && self.therapyIndex2 == 6)
        {
            let random = Int.random(in: 1...2)
            if(random == 1)
            {
            self.therapyDurationIndex = 41;
            self.therapy = "full body scan";
            }
            else
            {
                self.therapyDurationIndex = 42;
                self.therapy = "walking meditation";
            }
        }
        else if(self.therapyIndex == 2 && self.therapyIndex2 == 7 && self.isEmployed == true && self.before6pm == true)
        {
            self.therapyDurationIndex = 8;
            self.therapy = "mid day destress";
        }
        else if (self.therapyIndex == 2 && self.therapyIndex2 == 8)
        {
            self.therapyDurationIndex = 25;
            self.therapy = "managing exam stress";
        }
        else if (self.therapyIndex == 2)
        {
            let random = Int.random(in: 1...11)
            if (random == 1)
            {
            self.therapyDurationIndex = 15;
            self.therapy = "study break";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
            }
            else if (random == 3)
            {
            self.therapyDurationIndex = 14;
            self.therapy = "5 minutes destress";
            }
            else if (random == 4)
            {
            self.therapyDurationIndex = 10;
            self.therapy = "anxiety relief";
            }
            else if (random == 5)
            {
            self.therapyDurationIndex = 8;
            self.therapy = "midday destress";
            }
            else if (random == 6)
            {
            self.therapyDurationIndex = 19;
            self.therapy = "approaching deadlines";
            }
            else if (random == 7)
            {
            self.therapyDurationIndex = 24;
            self.therapy = "seeking balance";
            }
            else if (random == 8)
            {
            self.therapyDurationIndex = 34;
            self.therapy = "dealing with physical pain";
            }
            else if (random == 9)
            {
            self.therapyDurationIndex = 35;
            self.therapy = "reducing envy";
            }
            else if (random == 10)
            {
            self.therapyDurationIndex = 41;
            self.therapy = "full body scan";
            }
            else if (random == 11)
            {
            self.therapyDurationIndex = 42;
            self.therapy = "walking meditation";
            }
        }
        else if (self.therapyIndex == 3 && self.therapyIndex2 == 1)
        {
            self.therapyDurationIndex = 10;
            self.therapy = "anxiety relief";
        }
        else if (self.therapyIndex == 3 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if (self.therapyIndex == 3)
        {
            let random = Int.random(in: 1...5)
            if (random == 1)
            {
            self.therapyDurationIndex = 10;
            self.therapy = "anxiety relief";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
            }
            else if (random == 3)
            {
            self.therapyDurationIndex = 14;
            self.therapy = "5 minutes destress";
            }
            else if (random == 4)
            {
            self.therapyDurationIndex = 19;
            self.therapy = "approaching deadlines";
            }
            else if (random == 5)
            {
            self.therapyDurationIndex = 20;
            self.therapy = "before a gathering";
            }
        }
        else if ((self.therapyIndex == 4 && self.therapyIndex2 == 4)||(self.therapyIndex == 4 && self.therapyIndex2 == 3))
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 0;
            self.therapy = "10 minutes deep focus";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 1;
            self.therapy = "30 minutes deep focus";
            }
        }
        else if (self.therapyIndex == 4 && self.therapyIndex2 == 3)
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 12;
            self.therapy = "pre-workout preparation";
            }
            else if(random == 2)
            {
            self.therapyDurationIndex = 22;
            self.therapy = "improving your focus";
            }
        }
        else if(self.therapyIndex == 4 && self.therapyIndex2 == 4 && self.isEmployed == true)
        {
            self.therapyDurationIndex = 16;
            self.therapy = "deep focus";
        }
        else if(self.therapyIndex == 4 && self.therapyIndex2 == 6)
        {
            self.therapyDurationIndex = 42;
            self.therapy = "walking meditation";
        }
        else if ( self.therapyIndex == 4 )
        {
            let random = Int.random(in: 1...8)
            if (random == 1)
            {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 14;
            self.therapy = "5 minutes destress";
            }
            else if (random == 3)
            {
            self.therapyDurationIndex = 20;
            self.therapy = "before a gathering";
            }
            else if (random == 4)
            {
            self.therapyDurationIndex = 0;
            self.therapy = "10 minutes deep focus";
            }
            else if (random == 5)
            {
            self.therapyDurationIndex = 1;
            self.therapy = "30 minutes deep focus";
            }
            else if (random == 6)
            {
            self.therapyDurationIndex = 24;
            self.therapy = "seeking balance";
            }
            else if (random == 7)
            {
            self.therapyDurationIndex = 35;
            self.therapy = "reducing envy";
            }
            else if (random == 8)
            {
            self.therapyDurationIndex = 42;
            self.therapy = "walking meditation";
            }
        }
        else if (self.therapyIndex == 5 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 9;
            self.therapy = "anger management";
        }
        else if (self.therapyIndex == 5 && self.therapyIndex2 == 1)
        {
            self.therapyDurationIndex = 9;
            self.therapy = "anger management";
        }
        else if (self.therapyIndex == 5 && self.therapyIndex2 == 4)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if (self.therapyIndex == 5)
        {
            let random = Int.random(in: 1...2)
            if(random == 1)
            {
            self.therapyDurationIndex = 9;
            self.therapy = "anger management";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 35;
            self.therapy = "reducing envy";
            }
        }
        else if (self.therapyIndex == 7 && self.therapyIndex2 == 1)
        {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
        }
        else if (self.therapyIndex == 7 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if (self.therapyIndex == 6 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if (self.therapyIndex == 6 && self.therapyIndex2 == 1)
        {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
        }
        else if ((self.therapyIndex == 8 && self.therapyIndex2 == 1)||(self.therapyIndex == 8 && self.therapyIndex2 == 2))
        {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
        }
        else if ((self.therapyIndex == 8 && self.therapyIndex2 == 6)||(self.therapyIndex == 8 && self.therapyIndex2 == 7))
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 6;
            self.therapy = "10 minutes unguided meditation";
            }
        }
        else if (self.therapyIndex == 8 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 21;
            self.therapy = "start your day with gratitude";
        }
        else if ( self.therapyIndex == 8 )
        {
            let random = Int.random(in: 1...4)
            if (random == 1)
            {
            self.therapyDurationIndex = 7;
            self.therapy = "on the go breathing";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 14;
            self.therapy = "5 minutes destress";
            }
            else if (random == 3)
            {
            self.therapyDurationIndex = 11;
            self.therapy = "end of day unwind";
            }
            else if (random == 4)
            {
            self.therapyDurationIndex = 21;
            self.therapy = "start your day with gratitude";
            }
        }
        else if (self.therapyIndex == 10 && self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 21;
            self.therapy = "start your day with gratitude";
        }
        else if (self.therapyIndex == 10)
        {
            self.therapyDurationIndex = 21;
            self.therapy = "start your day with gratitude";
        }
        else if (self.therapyIndex == 12 && self.therapyIndex2 == 3)
        {
            let random = Int.random(in: 1...2)
            if(random == 1)
            {
            self.therapyDurationIndex = 0;
            self.therapy = "10 mins deep focus";
            }
            else if(random == 2)
            {
                self.therapyDurationIndex = 1;
                self.therapy = "30 mins deep focus";
            }
        }
        else if (self.therapyIndex2 == 2)
        {
            self.therapyDurationIndex = 21;
            self.therapy = "start your day with gratitude";
        }
        else if (self.therapyIndex2 == 3)
        {
            let random = Int.random(in: 1...2)
            if(random == 1)
            {
            self.therapyDurationIndex = 22;
            self.therapy = "improving your focus";
            }
            else if (random == 2)
            {
                self.therapyDurationIndex = 43;
                self.therapy = "thought hunter";
            }
        }
        else if (self.therapyIndex2 == 4)
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 0;
            self.therapy = "10 minutes deep focus";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 1;
            self.therapy = "30 minutes deep focus";
            }
        }
        else if (self.therapyIndex2 == 6)
        {
            let random = Int.random(in: 1...3)
            if (random == 1)
            {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 6;
            self.therapy = "10 minutes unguided meditation";
            }
            else if (random == 3)
            {
                self.therapyDurationIndex = 43;
                self.therapy = "thought hunter";
            }
        }
        else if (self.therapyIndex2 == 7)
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 5;
            self.therapy = "10 minutes meditation";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 6;
            self.therapy = "10 minutes unguided meditation";
            }
        }
        else if ( self.therapyIndex2 == 3 )
        {
            let random = Int.random(in: 1...2)
            if (random == 1)
            {
            self.therapyDurationIndex = 0;
            self.therapy = "10 minutes deep focus";
            }
            else if (random == 2)
            {
            self.therapyDurationIndex = 1;
            self.therapy = "30 minutes deep focus";
            }
        }
        else
        {
            self.therapyDurationIndex = 1;
        }

    }
}

struct WatsonWidget_Previews: PreviewProvider {
    static var previews: some View {
        WatsonWidget()
    }
}
