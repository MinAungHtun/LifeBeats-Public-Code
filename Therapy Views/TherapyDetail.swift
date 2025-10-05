//
//  TherapyDetail.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 2/29/20.
// * adding (s) to min is already used for cache

import SwiftUI
import FirebaseAnalytics
import Firebase
import ActivityKit

//@available(iOS 16.1, *)
struct TherapyDetail: View {
    
    @State var info:Int? = 0
    @EnvironmentObject var userData: UserData
    var therapy:Therapy
    @State var duration : String = " "
    @State var description : String = " "
    @State var imageName : String = "black"
    @State var timePicker = false
    @State var bgMusicIndex : Int = 0
    @State var categoryName : String = " "
    @State var deepFocusClicked : Int = 0
    @State var meditationClicked : Int = 0
    @State var duration1 : Bool = false
    @State var duration2 : Bool = false
    @State var duration3 : Bool = false
    @State var timeRemaining = 0
    @State var showStartTherapy : Bool = false
    @State var payBufferToggle : Bool = false
   // @State private var activity: Activity<WidgetAttribute>? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
//    var premium : Bool
//    {
//        get {
//            return (UIApplication.shared.delegate as? AppDelegate)!.premium
//                    }
//    }
    @State var premium : Bool = (UIApplication.shared.delegate as? AppDelegate)!.premium
    
   // @State var showPayBuffer : Bool = false
    
    //let timer1 = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    func logTherapy()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let totalSessions = docData?["totalSessions"] as? Int ?? 0
                let usageTherapy = docData?[self.therapy.name] as? Int ?? 0
                let ref = db.collection("Users").document(uid!).setData([ self.therapy.name : usageTherapy+1 ], merge: true) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
                let ref1 = db.collection("Users").document(uid!).setData([ "totalSessions" : totalSessions+1 ], merge: true) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
            } else {
                print("Document does not exist")
            }
        }
    }
    
    func assignTracks ()
    {
        if(self.therapy.name == "Deep Focus"
            && self.deepFocusClicked == 0
        )
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.tenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.tenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.time = 600.0
            GlobalPlayer.sharedInstance.timeCG = 600.0
            GlobalPlayer.sharedInstance.elaspedTime = 600.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
        }
        else if(self.therapy.name == "Meditation"
                 && self.meditationClicked == 0
        )
        {
            GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl
            GlobalPlayer.sharedInstance.time = 600.0
            GlobalPlayer.sharedInstance.timeCG = 600.0
            GlobalPlayer.sharedInstance.elaspedTime = 600.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
        }
        else if(therapy.name == "Sleep")
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.fifteenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.fifteenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.fifteenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.therapySongName = " Sleep ";
            GlobalPlayer.sharedInstance.time = 900.0
            GlobalPlayer.sharedInstance.timeCG = 900.0
            GlobalPlayer.sharedInstance.elaspedTime = 900.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 900.0
        }
        else if(therapy.name == "10 min Deep Focus")
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.tenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.tenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.therapySongName = "10 min Deep Focus";
            GlobalPlayer.sharedInstance.time = 600.0
            GlobalPlayer.sharedInstance.timeCG = 600.0
            GlobalPlayer.sharedInstance.elaspedTime = 600.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
        }
        else if(therapy.name == "30 mins Deep Focus")
        {
            GlobalPlayer.sharedInstance.therapySongName = "30 mins Deep Focus";
            GlobalPlayer.sharedInstance.therapySongURL = therapy.thirtyMinsUrl1
            GlobalPlayer.sharedInstance.subURL1 = therapy.thirtyMinsUrl2
            GlobalPlayer.sharedInstance.subURL2 = therapy.thirtyMinsUrl3
            GlobalPlayer.sharedInstance.subURL3 = therapy.thirtyMinsUrl4
            GlobalPlayer.sharedInstance.subURL4 = therapy.thirtyMinsUrl5
            GlobalPlayer.sharedInstance.time = 1800.0
            GlobalPlayer.sharedInstance.timeCG = 1800.0
            GlobalPlayer.sharedInstance.elaspedTime = 1800.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 1800.0
        }
        else if(therapy.name == "15 min Sleep")
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.fifteenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.fifteenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.fifteenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.therapySongName = " Sleep ";
            GlobalPlayer.sharedInstance.time = 900.0
            GlobalPlayer.sharedInstance.timeCG = 900.0
            GlobalPlayer.sharedInstance.elaspedTime = 900.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 900.0
        }
        else if(therapy.name == "10 min Meditation")
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.fifteenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.fifteenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.fifteenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongName = "10 min Meditation";
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.time = 600.0
            GlobalPlayer.sharedInstance.timeCG = 600.0
            GlobalPlayer.sharedInstance.elaspedTime = 600.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
        }
        else if(therapy.name == "Unguided")
        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.fifteenMinsUrl1
//            GlobalPlayer.sharedInstance.subURL1 = therapy.fifteenMinsUrl2
//            GlobalPlayer.sharedInstance.subURL2 = therapy.fifteenMinsUrl3
            GlobalPlayer.sharedInstance.therapySongName = "Unguided Meditation";
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.time = 600.0
            GlobalPlayer.sharedInstance.timeCG = 600.0
            GlobalPlayer.sharedInstance.elaspedTime = 600.0
            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
        }
        else if(therapy.category.rawValue == "Quick Remedies" || therapy.category.rawValue == "Ace Your Day" || therapy.category.rawValue == "Student Living" || therapy.category.rawValue == "Self Love" || therapy.category.rawValue == "Mindfulness at work" || therapy.category.rawValue == "Beginner Mindfulness")
        {
            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
            GlobalPlayer.sharedInstance.time = therapy.time
            GlobalPlayer.sharedInstance.timeCG = therapy.timeCG
            GlobalPlayer.sharedInstance.elaspedTime = therapy.time
            GlobalPlayer.sharedInstance.elapsedTimeCG = therapy.timeCG
        }
//        else
//        {
//            GlobalPlayer.sharedInstance.therapySongURL = therapy.url
//            GlobalPlayer.sharedInstance.time = therapy.time
//            GlobalPlayer.sharedInstance.timeCG = therapy.timeCG
//            GlobalPlayer.sharedInstance.elaspedTime = therapy.time
//            GlobalPlayer.sharedInstance.elapsedTimeCG = therapy.timeCG
//        }
        
        
    }
    
    func shuffleIntro()
    {
        if(therapy.category.rawValue == "ASMR")
        {
            let number = Int.random(in: 2...4) //
            if (number == 1)
            {
            GlobalPlayer.sharedInstance.backgroundVideoName = "Bubble Wrap"
            }
           else if (number == 2)
            {
            GlobalPlayer.sharedInstance.backgroundVideoName = "Gift Wrapping"
            }
           else if (number == 3)
            {
            GlobalPlayer.sharedInstance.backgroundVideoName = "Soda Water"
            }
           else if (number == 4)
            {
            GlobalPlayer.sharedInstance.backgroundVideoName = "Stone Beach Waves"
            }
        }
    }
    
    var body: some View {
        VStack{

            if(self.premium == false && therapy.free == false)
            {
                //ScrollView{
            Text("🔒Premium only. Some mindfulness recommendations by Febe will require a Lifebeats Premium subscription").font(Font.custom("Nexa Bold", size: 13))
                PaymentBuffer()//.padding(.top, -80)
                //}

            }
            else
            {
        if (self.info == 0)
        {
            VStack{
                ScrollView(.vertical, showsIndicators: false){
                LazyVStack{
                    Text(therapy.name)
                        .font(Font.custom("Nexa Bold", size: 23))
                    .fontWeight(.bold)
                    .listRowInsets(EdgeInsets())
//
                    if (therapy.name == "Sleep")
                    {
                        Text("15 mins")
                            .font(Font.custom("Nexa Bold", size: 18))
                        .fontWeight(.semibold)
                        .listRowInsets(EdgeInsets())
                    }
                    else
                    {
                    Text(self.duration)
                        .font(Font.custom("Nexa Bold", size: 18))
                    .fontWeight(.semibold)
                    .listRowInsets(EdgeInsets())
                    }

                        Image(self.imageName).resizable().frame(width: UIScreen.main.bounds.width, height: 250)
                        .listRowInsets(EdgeInsets())
                    

                        Text(self.description).font(Font.custom("Nexa Bold", size: 16)).font(.body).fontWeight(.regular).padding(.leading, 10).padding(.top,10)
                                          .listRowInsets(EdgeInsets())
                    
            if(therapy.name == "Deep Focus")
                {
                    ScrollView(.horizontal, showsIndicators: false)
                    {
                        HStack{
                            Button (action: {self.duration = "10 mins";
                                self.description = "Enjoy short bursts of mental energy with this 10 minute brain tuning session. Perfect if you are feeling sluggish at work or school";
                                self.imageName = "Deep Focus 10 mins";
                            GlobalPlayer.sharedInstance.therapySongName = "10 min Deep Focus";
                                self.deepFocusClicked = 1;
                                self.duration1 = true;
                                self.duration2 = false;
                                GlobalPlayer.sharedInstance.therapySongURL = therapy.url
//                                GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl1
//                                GlobalPlayer.sharedInstance.subURL1 = therapy.tenMinsUrl2
//                                GlobalPlayer.sharedInstance.subURL2 = therapy.tenMinsUrl3
                                GlobalPlayer.sharedInstance.time = 600.0
                                GlobalPlayer.sharedInstance.timeCG = 600.0
                                GlobalPlayer.sharedInstance.elaspedTime = 600.0
                                print(GlobalPlayer.sharedInstance.elaspedTime)
                                GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
                            }){
                                Text("10 mins").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(self.duration1 ? Color.green : Color.gray)
                                .clipShape(FeelingBubble()).frame(width:100)
                                
                            }
                            Button (action: {
                                if(self.premium == false)
                                {
                                    self.payBufferToggle = true
                                }
                                else if(self.premium == true)
                                {
                                self.duration = "30 mins";
                                self.description = "Need to activate mental beast mode? Get in the zone with this 30 minute session and be the most productive version of yourself";
                                self.imageName = "Deep Focus 30 mins";
                                    GlobalPlayer.sharedInstance.therapySongName = "30 mins Deep Focus";
                                self.deepFocusClicked = 1;
                                self.duration1 = false;
                                self.duration2 = true;
                                GlobalPlayer.sharedInstance.therapySongURL = therapy.thirtyMinsUrl1
                                GlobalPlayer.sharedInstance.subURL1 = therapy.thirtyMinsUrl2
                                GlobalPlayer.sharedInstance.subURL2 = therapy.thirtyMinsUrl3
                                GlobalPlayer.sharedInstance.subURL3 = therapy.thirtyMinsUrl4
                                GlobalPlayer.sharedInstance.subURL4 = therapy.thirtyMinsUrl5
                                GlobalPlayer.sharedInstance.time = 1800.0
                                GlobalPlayer.sharedInstance.timeCG = 1800.0
                                GlobalPlayer.sharedInstance.elaspedTime = 1800.0
                                GlobalPlayer.sharedInstance.elapsedTimeCG = 1800.0
                                }
                            }){
                            Text("30 mins").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(self.duration2 ? Color.green : Color.gray)
                                .clipShape(FeelingBubble()).frame(width:100)
                                
                            }
                        }.padding()
                    }.frame(width: UIScreen.main.bounds.width, height: 80).listRowInsets(EdgeInsets())
                }
            else if (therapy.name == "Meditation")
            {
                ScrollView(.horizontal, showsIndicators: false)
                {
                    HStack{
//                        Button (action: {self.duration = "5 mins";
//                             self.description = "Need a quick time-out from your hectic day? Commit just 5 minutes and feel the difference immediately";
//                            self.imageName = "Meditation 5 mins";
//                            self.meditationClicked = 1;
//                            self.duration1 = true;
//                            self.duration2 = false;
//                            self.duration3 = false;
//                            GlobalPlayer.sharedInstance.therapySongURL = therapy.fiveMinsUrl
//                            GlobalPlayer.sharedInstance.time = 300.0
//                            GlobalPlayer.sharedInstance.timeCG = 300.0
//                            GlobalPlayer.sharedInstance.elaspedTime = 300.0
//                            GlobalPlayer.sharedInstance.elapsedTimeCG = 300.0
//                        }){
//                            Text("5 mins").padding().foregroundColor(.white).background(self.duration1 ? Color.green : Color.gray)
//                            .clipShape(FeelingBubble()).frame(width:100)
//
//                        }
                        Button (action: {self.duration = "10 mins";
                             self.description = "Lifebeats' most popular mindfulness option, immerse yourself in 10 minutes of pure mental wellness";
                            self.imageName = "Meditation 10 mins";
                            self.meditationClicked = 1;
                            self.duration1 = false;
                            self.duration2 = true;
                            self.duration3 = false;
                            GlobalPlayer.sharedInstance.therapySongName = "10 min Meditation";
                            GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl
                            GlobalPlayer.sharedInstance.time = 600.0
                            GlobalPlayer.sharedInstance.timeCG = 600.0
                            GlobalPlayer.sharedInstance.elaspedTime = 600.0
                            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
                        }){
                            Text("10 mins").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(self.duration2 ? Color.green : Color.gray)
                            .clipShape(FeelingBubble()).frame(width:100)
                            
                        }
                        Button (action: { self.duration = "Unguided";
                             self.description = "For experienced individuals who are ready to take control of their own mindfulness journey";
                            self.imageName = "Meditation unguided";
                            self.meditationClicked = 1;
                            self.duration1 = false;
                            self.duration2 = false;
                            self.duration3 = true;
                            GlobalPlayer.sharedInstance.therapySongName = "Unguided Meditation";
                            GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUnguidedUrl
                            GlobalPlayer.sharedInstance.time = 600.0
                            GlobalPlayer.sharedInstance.timeCG = 600.0
                            GlobalPlayer.sharedInstance.elaspedTime = 600.0
                            GlobalPlayer.sharedInstance.elapsedTimeCG = 600.0
                        }){
                        Text("Unguided").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(self.duration3 ? Color.green : Color.gray)
                            .clipShape(FeelingBubble()).frame(width:200).padding(.leading, -30)
                            
                        }

                    }.padding(.leading, 10)
                }.frame(width: UIScreen.main.bounds.width, height: 80).listRowInsets(EdgeInsets())
            }
                    if(self.showStartTherapy == true){
                        Button(action: {GlobalPlayer.sharedInstance.premium = self.premium;self.info = 1; self.timeRemaining = 6;                     GlobalPlayer.sharedInstance.playMusic();                    self.assignTracks();
                                self.logTherapy();})
                        {
                            Text("Start Therapy").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                                .clipShape(RoundedBubble())
                    }.padding()
                    .padding(.top, 10)
                    }
                    Text("Select a background soundscape").font(Font.custom("Nexa Bold", size: 20)).fontWeight(.bold).padding().padding(.bottom, 10)
                        .listRowInsets(EdgeInsets())
                    
                    if (therapy.name == "Pre workout preparation")
                    {
                        BGTracksCategoryRow(category: "Fitness Prep", premium: self.premium).environmentObject(UserData())
                            .listRowInsets(EdgeInsets())
                    }
                    else if (therapy.name == "Deep Focus" || therapy.name == "Sleep" || therapy.name == "Meditation")
                    {
                        BGTracksCategoryRow(category:therapy.name, premium: self.premium).environmentObject(UserData()).listRowInsets(EdgeInsets())
                    }
                    else
                    {
                        BGTracksCategoryRow(category: therapy.category.rawValue, premium: self.premium).environmentObject(UserData())
                        .listRowInsets(EdgeInsets())
                    }

                }
            }
                .onReceive(timer) { _ in
                    if (GlobalPlayer.sharedInstance.BGSelected == true)
                    {
                        if(therapy.name == "Deep Focus" || therapy.name == "Meditation"){
                        if(self.meditationClicked == 1 || self.deepFocusClicked == 1)
                        {
                            self.showStartTherapy = true
                        }
                        }
                        else
                        {
                            self.showStartTherapy = true
                        }
                    }
                    else if (GlobalPlayer.sharedInstance.BGSelected == false)
                    {
                        self.showStartTherapy = false
                    }
                    if(GlobalPlayer.sharedInstance.popUpForBG == true)
                    {
                        self.payBufferToggle = true
                    }
                }
                .sheet(isPresented: $payBufferToggle)
                {
                    PaymentBuffer().onDisappear(perform: {GlobalPlayer.sharedInstance.popUpForBG = false})
                }
                .onAppear(perform: {
                    GlobalPlayer.sharedInstance.stopMusic();
                    GlobalPlayer.sharedInstance.shuffleIntro();
                    self.meditationClicked = 0;
                    self.deepFocusClicked = 0;
                    self.duration1 = false;
                    self.duration2 = false;
                    self.duration3 = false;
                    GlobalPlayer.sharedInstance.finish = false
                    GlobalPlayer.sharedInstance.therapySongName = self.therapy.name
                    GlobalPlayer.sharedInstance.categoryName = self.categoryName
                    self.assignTracks()
                    UserDefaults.standard.set(1, forKey: "HKFinished")
                })
                .onDisappear(perform: {
                    self.assignTracks()
                    Singletons.sharedInstance.therapyName = therapy.name
                    Singletons.sharedInstance.therapyDescription = self.description;
                    Singletons.sharedInstance.duration = self.duration;
                    UserDefaults.standard.set(1, forKey: "HKFinished")
                    //GlobalPlayer.sharedInstance.therapySongName = self.therapy.name
                    //GlobalPlayer.sharedInstance.categoryName = self.categoryName
                    //self.presentationMode.wrappedValue.dismiss() this works
                })
            }
        }
        else if (self.info == 1)
        {
            if(self.timeRemaining != 0)
            {
                BreathingExercise().onAppear(perform: {
                    //GlobalPlayer.sharedInstance.playMusic();
                    //GlobalPlayer.sharedInstance.therapySongName = self.therapy.name
                    GlobalPlayer.sharedInstance.categoryName = self.categoryName
                    GlobalPlayer.sharedInstance.premium = self.premium
                    UserDefaults.standard.set(1, forKey: "HKFinished")
                    shuffleIntro()
                    //self.assignTracks()
                    //self.logTherapy()
                })
                .onReceive(timer) { _ in
                    
                    if self.timeRemaining > 2 {
                           self.timeRemaining -= 1
                       }
                    else if self.timeRemaining == 2
                    {
                        if(GlobalPlayer.sharedInstance.player != nil)
                        {
                        GlobalPlayer.sharedInstance.playDownloadedBG()
                            self.timeRemaining = 1
                        }
                    }
                    
                    if (GlobalPlayer.sharedInstance.playing == true)
                    {
                        self.timeRemaining = 0
                    }
                }
            }
           else{
            VStack{
                ScrollView(.vertical, showsIndicators: false)
                {
                    TimerCircle()
                    
                    VStack{
                        Text(therapy.name).font(Font.custom("Nexa Bold", size: 23))
            VStack
            {
                MusicPlayer(playing : true,id: self.therapy.arrayId, categoryName : self.categoryName, therapyName : self.therapy.name, start : false).frame(width: UIScreen.main.bounds.width/1.1, height: 250)
                
//                Button(action:{
//                    let attribute = WidgetAttribute(therapyId: self.therapy.id, therapyName: self.therapy.name)
//                    let state = WidgetAttribute.ContentState(status: .play)
//                    if #available(iOS 16.1, *) {
//                    let activity = try? Activity<WidgetAttribute>.request(attributes: attribute, contentState: state, pushType: nil)
//                    } else {
//                        // Fallback on earlier versions
//                        print("Nothing")
//                    }
//                }){
//                    Text("Start Dynamic Island")
//                }
            }
            .padding(.leading, 30)
            .padding(.trailing, 30)
                        
                    }
                    .padding(.top, 20)
                }.padding(.leading, 10)
                .padding(.trailing, 10)
            }
            .onReceive(timer) { _ in
                if (GlobalPlayer.sharedInstance.finish == true)
                {
                    if(self.categoryName != "Sleep" && self.categoryName != "Meditation")
                    {
                    self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
         //   .background(GradientBackground().blur(radius: 5))
            .background(TherapyBG(categoryName:therapy.category.rawValue))
            }
        }
            }
        }
        .onAppear(perform: {
        self.imageName = self.therapy.bufferImageName!;
        self.description = self.therapy.therapyDescription!;
        self.duration = self.therapy.duration
            
//            let attribute = WidgetAttribute(therapyId: self.therapy.id, therapyName: self.therapy.name)
//            let state = WidgetAttribute.ContentState(status: .play)
            
            UserDefaults.standard.set(1, forKey: "HKFinished")
        Analytics.setScreenName(self.therapy.name, screenClass: "Therapy")
        
//            if(self.premium == false)
//            {
//                if(therapy.free == false)
//                {
//                    self.showPayBuffer = true
//                }
//            }
            
            
        if(therapy.name == "Pre workout preparation")
        {
            self.bgMusicIndex = 1
            self.categoryName = "Fitness Prep"
            Singletons.sharedInstance.categoryName = "Fitness Prep"
        }
        else if (therapy.name == "Deep Focus" || therapy.name == "Sleep" || therapy.name == "Meditation")
        {
            self.bgMusicIndex = 2
            self.categoryName = therapy.name
            Singletons.sharedInstance.categoryName = therapy.name
        }
        else
        {
            self.categoryName = therapy.category.rawValue
            Singletons.sharedInstance.categoryName = therapy.category.rawValue
        }
    })
    .environment(\.colorScheme, .dark)
    }
}

//@available(iOS 16.1, *)
struct TherapyDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
               return TherapyDetail(therapy: userData.therapies[17])
                   .environmentObject(userData)
        
    }
}
