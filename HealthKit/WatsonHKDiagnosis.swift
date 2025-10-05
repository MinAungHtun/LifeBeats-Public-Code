//
//  WatsonHKDiagnosis.swift
//  LifeBeats
//
//  Created by User on 5/20/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import HealthKit
import Firebase

struct WatsonHKDiagnosis: View {
    
    let healthStore = HKHealthStore()
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
    @State var t1 = 0
    @State var t2 = 0
    @State var t3 = 0
    @State var t4 = 0
    @State var t5 = 0
    @State var inputBar = 0
    @State var therapyIndex2 = 0
    @State var therapyDurationIndex = 0
    @State var secondFeeling = " "
    @State var therapy = " "
    @State var category = " "
    @State var sympton = " "
    @State var finalReply = " "
    @State var timeRemaining = 12
    @State var lastPadding : CGFloat = -50
    @State var problem = "Your heart rate and respiratory rate seems normal"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var categories: [String: [Therapy]] {
        Dictionary(
            grouping: therapyData,
            by: { $0.category.rawValue }
        )
    }
    
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
       //NavigationView{
        VStack{
            
            ScrollView(.vertical, showsIndicators: false){
                
                
                HStack {
                    FebeFace()
                    if(self.timeRemaining > 10)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text(self.problem).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false)).onAppear(perform: {
                                self.t1 = 1;
                            })
                    }
                   
                    }.padding()
                
                if(t1 == 1)
                {
                HStack {
                    FebeFace()
                    if(self.timeRemaining > 8)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("Are you feeling alright?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false)).padding(.trailing, 50)
                    }
                    }.padding()//.padding(.trailing, 50)
                }
                
                if(t2 == 1)
                {
                    VStack {
                Text("Yes").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    HStack{
                    FebeFace()
                    if(self.timeRemaining > 6)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("Phew, that's good to hear. How can we help you today?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(Bubble(chat:false))
                    }
                    }.padding()
                    
                    if(self.timeRemaining < 6)
                    {
                    VStack {
                Text("I would like to ...").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    }
                    
                }
                else if(t2 == 2)
                {
                    VStack {
                Text("No").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    
                    HStack{
                    FebeFace()
                    if(self.timeRemaining > 6)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("Oh no, sorry to hear that. Can we help you calm down with some meditation now?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(Bubble(chat:false))
                    }
                    }.padding()
                }
                
                
                if(t3 == 1)
                {
                    VStack {
                        Text("Yes").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                            .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                }
                else if(t3 == 2)
                {
                    VStack {
                Text("No").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    
                    HStack{
                    FebeFace()
                    if(self.timeRemaining > 4)
                    {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                    else{
                        Text("No problem, how can I help you right now \(self.userName)?").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(Bubble(chat:false))
                    }
                    }.padding()
                    
                    if(self.timeRemaining < 4)
                    {
                    VStack {
                Text("I would like to ...").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    }
                }
                
                if(t4 == 1)
                {
                    VStack {
                        
                        Text( self.secondFeeling).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                            .clipShape(Bubble(chat:true))
                        .frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                        .padding(.leading, -50)
                    }
                    
                    HStack {
                        FebeFace()
                        if(self.timeRemaining != 0)
                        {TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                        else{
                            Text(self.finalReply).font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(Bubble(chat:false))
                        }
                    }.padding()
                }
            
            }
            
        }.padding(.top, self.lastPadding)
//        .onReceive(timer) { _ in
//            if self.timeRemaining > 0 {
//                self.timeRemaining -= 1
//            }
//    print(self.timeRemaining)
//}
//        .onAppear(perform: {
//            authorizeHealthKit()
//        })
        //Text("Test")
        VStack{
        if (inputBar == 0 && self.timeRemaining < 7)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            HStack{
                
                    Button (action: {self.timeRemaining = 8; self.inputBar = 2; self.t2 = 1;}){
                    Text("Yes").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:100)}
                Button (action: {self.timeRemaining = 8; self.inputBar = 1; self.t2 = 2;}){
                        Text("No").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                            .clipShape(FeelingBubble()).frame(width:100)}
                
            }.padding(.leading, 10)
            
        }.frame(width: UIScreen.main.bounds.width, height: 100)//.padding(.top, -10)
    }
        
        else if (inputBar == 1 && self.timeRemaining < 5)
    {
        ScrollView(.vertical, showsIndicators: false)
        {
            HStack{
                
                Button (action: {self.timeRemaining = 0; self.inputBar = 4; self.therapyDurationIndex = 18; self.therapy = "meditation"; self.t3 = 1;}){
                    Text("Yes").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:100)}
                Button (action: {self.timeRemaining = 6; self.inputBar = 2; self.t3 = 2;self.lastPadding = -250}){
                        Text("No").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                            .clipShape(FeelingBubble()).frame(width:100)}
                
            }.padding(.leading, 10)
            
        }.frame(width: UIScreen.main.bounds.width, height: 100)
    }
       else if (inputBar == 2 && self.timeRemaining < 5)
       {
           ScrollView(.vertical, showsIndicators: false)
           {
               VStack{
                   HStack
                   {
                   Button (action: {self.inputBar = 4; self.secondFeeling = "be relaxed"; self.therapyIndex2 = 1;
                       self.therapy = "Sleep & Destress";
                    self.category = "Sleep";self.lastPadding = -350;
                    self.t4 = 1;
                       self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text("be  relaxed").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   Button (action: {self.inputBar = 4;  self.therapyIndex2 = 2;
                       self.secondFeeling = "feel happier";
                       self.therapy = "Meditation";
                    self.category = "Meditation";self.lastPadding = -350;
                    self.t4 = 1;
                       self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text("feel happier").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   }
                   HStack
                   {
                   Button (action: {self.inputBar = 4; self.therapyIndex2 = 3; self.secondFeeling = "be focused";
                           self.therapy = "Focus";
                    self.category = "Deep Focus";self.lastPadding = -350;
                    self.t4 = 1;
                       self.timeRemaining = 2;self.getTherapy();self.recordMood();
                       }){
                   Text("be focused").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                           .clipShape(FeelingBubble()).frame(width:130) }
                   Button (action: {self.inputBar = 4;  self.therapyIndex2 = 4; self.secondFeeling = "increase motivation"; self.therapy = "Remedies";
                    self.category = "Quick Remedies";self.lastPadding = -350;
                    self.t4 = 1;
                       self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text("increase motivation").font(Font.custom("Nexa Bold", size: 14)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   }
                   HStack
                   {
                   Button (action: {self.inputBar = 4; self.secondFeeling = "Sleep"; self.therapyIndex2 = 5;
                       self.therapy = "Sleep";
                    self.category = "Sleep";self.lastPadding = -350;
                    self.t4 = 1;self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text("     Sleep     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   Button (action: {self.inputBar = 4; self.therapyIndex2 = 6; self.secondFeeling = "Meditate";
                       self.therapy = "Meditation";
                    self.category = "Meditation";self.lastPadding = -350;
                    self.t4 = 1;self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text(" Meditate ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   }
                   HStack
                   {
                   Button (action: {self.inputBar = 4; self.therapyIndex2 = 7; self.secondFeeling = "Destress";
                           self.therapy = "Destress Remedies";
                    self.category = "Quick Remedies";self.lastPadding = -350;
                    self.t4 = 1;self.timeRemaining = 2;self.getTherapy();self.recordMood();
                       }){
                   Text("  Destress  ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                           .clipShape(FeelingBubble()).frame(width:130) }
                   Button (action: {self.inputBar = 4; self.therapyIndex2 = 8; self.secondFeeling = "Study";
                       self.therapy = "Study";
                    self.category = "Student Living";self.lastPadding = -350;
                    self.t4 = 1;self.timeRemaining = 2;self.getTherapy();self.recordMood();
                   }){
                   Text("     Study     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.green)
                       .clipShape(FeelingBubble()).frame(width:130) }
                   }
                       }.padding(.leading, 20)
           }.frame(width: UIScreen.main.bounds.width, height: 250)
       }
       else if (inputBar == 4 && self.timeRemaining == 0)
       {
       ScrollView(.horizontal, showsIndicators: false)
       {
           HStack{
                   CustomizedCategoryRow(name: " ",items: [userData.therapies[self.therapyDurationIndex]])
                       .onDisappear(perform: {
                           self.lastPadding = -1
                       })
               }.padding(.leading, 20)
       }.frame(width: UIScreen.main.bounds.width, height: 220)
       }
        }//.padding(.bottom , 100)
        }//.padding(.top, self.lastPadding)
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
    print(self.timeRemaining)
}
        .onAppear(perform: {
            authorizeHealthKit()
        })
        //}//.background(Color.black)
       //}.environment(\.colorScheme, .dark).padding(.top, -120)
    }
    
        func getTherapy()
        {
            if (self.therapyIndex2 == 5)
            {
                self.therapyDurationIndex = 17;
                self.therapy = "15 minutes sleep";
            }
            else if (self.therapyIndex2 == 2)
            {
                self.therapyDurationIndex = 21;
                self.therapy = "start your day with gratitude";
            }
            else if (self.therapyIndex2 == 3)
            {
                if(self.premium == true)
                {
                self.therapyDurationIndex = 22;
                self.therapy = "improving your focus";
                }
                else
                {
                    self.therapyDurationIndex = 21;
                    self.therapy = "gratitude";
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
                    if(self.premium == true)
                    {
                self.therapyDurationIndex = 1;
                self.therapy = "30 minutes deep focus";
                    }
                    else
                    {
                        self.therapyDurationIndex = 16;
                        self.therapy = "deep focus";
                    }
                }
            }
            else if (self.therapyIndex2 == 6)
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
                    if(self.premium == true)
                    {
                self.therapyDurationIndex = 1;
                self.therapy = "30 minutes deep focus";
                    }
                    else
                    {
                        self.therapyDurationIndex = 16;
                        self.therapy = "deep focus";
                    }
                }
            }
            else
            {
                if(self.premium == true)
                {
                self.therapyDurationIndex = 11;
                self.therapy = "end of day unwind";
                }
                else
                {
                    self.therapyDurationIndex = 32;
                    self.therapy = "quick body scan";
                }
            }

        }
        
        func recordMood()
        {
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let result = formatter.string(from: date)
            
            let db = Firestore.firestore()
            let uid = UserDefaults.standard.string(forKey: "UID")
            
            let ref = db.collection("UsageLog").document(uid!).setData([ "\(result)problem" : self.sympton ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                        }
                    }
            
        }
    
        func authorizeHealthKit()
        {
            
            let number2 = Int.random(in: 1...3)
            
            if (number2 == 1)
            {
                self.finalReply = "Thanks \(self.userName) for letting me know. I found something here that could help you \(self.therapy). Otherwise, feel free to browse our other therapies on our Discover page :)"
            }
            else if (number2 == 2)
            {
                self.finalReply = "Cool, here’s something that might help you \(self.therapy). Feel free to browse other therapies on our Discover page as well :D"
            }
            else if (number2 == 3)
            {
                self.finalReply = "Great, I found something that could help \(self.therapy). Please also browse our Discover page if you want to explore more therapies :D"
            }
            let readData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!])
            let shareData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!
    
            ])
    
    
            healthStore.requestAuthorization(toShare: shareData, read: readData) { (success, error) in
                if !success {
                    // Handle the error here.
                    print("unsuccessful")
                }
                else
                {
                    self.fetchHeartRate()
                }
            }
        }
    
        func fetchHeartRate()
        {
            guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else
            {
                return
            }
    
            guard let sampleType2 = HKObjectType.quantityType(forIdentifier: .respiratoryRate) else
            {
                return
            }
    
            let startDate = Calendar.current.date(byAdding: .minute, value: -5, to: Date())
            
            var hkArray: [HKQuantitySample] = []
            var hkQuantityArray: [Double] = []
            var hkArray1: [HKQuantitySample] = []
            var hkQuantityArray1: [Double] = []
                
            let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
    
            let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
    
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
                {
                (sample, result, error) in
                guard error == nil else{return}
                guard result != nil else{return}
                print(result ?? "nothing")
                let unit = HKUnit(from: "count/min")
                //60-100
                
                if(result!.count != 0)
                {
                for i in 0...result!.count-1
                {
                    
                    hkArray.append(result![i] as! HKQuantitySample)
                    hkQuantityArray.append(hkArray[i].quantity.doubleValue(for: unit))
                    print(hkArray[i])
                    print(hkQuantityArray[i])
                    if(hkQuantityArray[i] < 60 || hkQuantityArray[i] > 100)
                    {
                        self.problem = "Hello \(self.userName), we noticed your heart rate has not been within the usual range"
                        self.sympton = "heart"
                    }
                }
                }
            }
            
            let query2 = HKSampleQuery(sampleType: sampleType2, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
                {
                (sample, result, error) in
                guard error == nil else{return}
                guard result != nil else{return}
                print(result ?? "nothing")
    
                let unit = HKUnit(from: "count/min")
                //12-16
                if(result!.count != 0)
                {
                for i in 0...result!.count-1
                {
                    hkArray1.append(result![i] as! HKQuantitySample)
                    hkQuantityArray1.append(hkArray1[i].quantity.doubleValue(for: unit))
                    print(hkArray1[i])
                    print(hkQuantityArray1[i])
                    if(hkQuantityArray1[i] < 12 || hkQuantityArray1[i] > 16)
                    {
                        self.problem = "Hi \(self.userName), seems like your respiratory rate is not within the usual range"
                        self.sympton = "respiratory"
                    }
                }
                }
            }
            healthStore.execute(query)
            healthStore.execute(query2)
        }
}

struct WatsonHKDiagnosis_Previews: PreviewProvider {
    static var previews: some View {
        WatsonHKDiagnosis()
    }
}
