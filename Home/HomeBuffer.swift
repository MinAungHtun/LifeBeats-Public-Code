//
//  HomeBuffer.swift
//  LifeBeats
//
//  Created by User on 10/20/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase
import HealthKit

struct HomeBuffer: View {
    
    let db = Firestore.firestore()
    let delegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    //let healthStore = HKHealthStore()
    //@State var sympton = " "

    let uid = UserDefaults.standard.string(forKey: "UID")
//    var mindfulnessFlag : Bool
//        {
//            get {
//                return (UIApplication.shared.delegate as? AppDelegate)!.mindfulnessFlag
//            }
//        }
    
    var loggedIn : Bool
    {
        get {
                        return (UIApplication.shared.delegate as? AppDelegate)!.oldUser
                    }

    }
    
    @State var flag : Bool = false

    
    var homeButton: some View {
        Button(action:{self.flag = true; self.delegate.widgetFlag = false; self.delegate.FebeFlag = false})
         {
Text("< Back to Home")
        }
    }
    
    var widgetRemote: Bool? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.widgetFlag
                
        }
    }
    
    var FebeRemote: Bool? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.FebeFlag
                
        }
    }
    
    var widgetRemoteNo: Int? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.widgetFlagNo
                
        }
    }
    
    @State var oldUser : Bool = true

//    var intro : Bool
//    {
//            get {
//                return (UIApplication.shared.delegate as? AppDelegate)!.oldUser ?? true
//            }
//        }
    @State var qAnswered : Bool = true
    //@State var widget1 : Bool = false
    @State var ad : Bool = true
//        {
//            get {
//                return (UIApplication.shared.delegate as? AppDelegate)!.questionsAnswered
//            }
//        }
    @EnvironmentObject var userData: UserData
    @State var bar1 = 0
    @State var t1 = 0
    //@State var buffer: Bool = false
let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    
    
    
    var body: some View {
//        if(self.mindfulnessFlag == true)
//        {
//                NotificationTherapy(therapy: userData.therapies[18])
//                    .environmentObject(userData).background(Color.black)
//                .ignoresSafeArea()
//        }
//        else if(self.mindfulnessFlag == false)
//        {
//            CategoryHome().environmentObject(UserData()).environment(\.colorScheme, .dark)
//        }
        if(self.loggedIn == false)
        {
            FirstLaunchIntro()
        }
        else if(self.oldUser == true && self.qAnswered == true)
        {
            if(self.ad == false)
            {
                NavigationView{
                    
                    //Text("Febe").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).padding(.leading, 13)
                VStack{
                    Text("Febe").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).padding(.leading, 13).padding(.top, -50)
                    ScrollView(.vertical, showsIndicators: false){
                    VersionIntro(dummyIB: $bar1)
                    if(self.t1 == 1)
                    {
                    VStack {
                Text("Got it").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                        .clipShape(Bubble(chat:true)).frame(width: UIScreen.main.bounds.width , alignment: .trailing)
                            .padding(.leading, -50)
                    }
                    }
                    }
                    HStack
                    {
                        if(self.bar1 == 1)
                        {
                    Button (action: {
                        self.t1 = 1; self.ad = true
                    }){
                    Text("Got it").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(lifeBeatsColor)
                        .clipShape(FeelingBubble()).frame(width:180) }
                        }
                    }
                }
                }.navigationViewStyle(StackNavigationViewStyle())
                    .environment(\.colorScheme, .dark)
                //.navigationBarTitle("Febe")
            }
            else if(self.ad == true)
            {
                
                if(self.widgetRemote == true && self.flag == false)
                {

                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false){
                    TherapyDetail(therapy: userData.therapies[self.widgetRemoteNo!])
                        }                    .navigationBarItems(leading: self.homeButton)
                   }.navigationViewStyle(StackNavigationViewStyle())
                    .environment(\.colorScheme, .dark)
                    .navigationBarItems(leading: self.homeButton)
                    
                }
                else if(self.FebeRemote == true && self.flag == false)
                {

                    NavigationView {
                        ScrollView(.vertical, showsIndicators: false){
//WatsonView()
                            WatsonWidget()
//                            CustomizedCategoryRow(name: " ",items: [userData.therapies[18]])
                        }                    .navigationBarItems(leading: self.homeButton)
                    }.navigationViewStyle(StackNavigationViewStyle())
                    .environment(\.colorScheme, .dark)
                    .navigationBarItems(leading: self.homeButton)
                    
                }
                else
                {
           // NavigationView{
            //CategoryHome()
        HolmesorWatson().environmentObject(UserData()).environment(\.colorScheme, .dark)
            

            .onAppear(perform: {
               // authorizeHealthKit()
                let docRef = db.collection("Users").document(uid!)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let docData = document.data()
                        self.ad = docData!["1.9.1Introduced"] as? Bool ?? false
                        print(self.ad)
                    } else {

                        print("Document does not exist")
                    }
                }
                
            })
            .onReceive(timer) { _ in
                
  //              self.ad = intro
               // self.buffer = false
                let docRef = self.db.collection("Users").document(self.uid!)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let docData = document.data()
                        let name = docData!["name"] as! String
                        UserDefaults.standard.set(name, forKey: "userName")
                        self.qAnswered = true
                        self.oldUser = true
                        self.timer.upstream.connect().cancel()
                    } else {
                        self.qAnswered = false
                        self.oldUser = false
                        print("Document does not exist")
                        self.timer.upstream.connect().cancel()
                    }
                }
            }
            //}.navigationViewStyle(StackNavigationViewStyle())
           // .environment(\.colorScheme, .dark)
            }
            }
        }
        else if(self.oldUser == true && self.qAnswered == false)
        {
            FirstLaunchIntro()
        }
        else if(self.oldUser == false)
        {
            FirstLaunchIntro()
        }
    }
}

struct HomeBuffer_Previews: PreviewProvider {
    static var previews: some View {
        HomeBuffer()
    }
}
