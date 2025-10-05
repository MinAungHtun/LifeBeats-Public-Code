//
//  ProfileSummary.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/3/20.


import SwiftUI
import FirebaseAnalytics
import Firebase

struct ProfileSummary: View {
    @State var showingSettings = false
//    @State var mindfulnessReminder: Bool?
//    @State var bedTimeReminder: Bool?
//    @State var notification: Bool?
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")
    @State var userName : String = " "
    @State var longestStreak : String = " "
    @State var totalMinutes : String = " "
    @State var totalSessions : String = " "
    @State var totalCoins : String = " "
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }
    var categories: [String: [Therapy]] {
        Dictionary(
            grouping: therapyData,
            by: { $0.category.rawValue }
        )
    }
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
            LazyVStack{
            VStack{
                Text(self.userName).bold().font(Font.custom("Nexa Bold", size: 23)).padding(.leading, UIScreen.main.bounds.width/34).foregroundColor(.primary)
                    
                    Button(action: {self.showingSettings.toggle()})
                    {
                        Image("settings").resizable().frame(width: 30, height: 30)
                    }.frame(width: 50)
                    .padding(.leading, UIScreen.main.bounds.width/1.2).padding(.top, 5)
                //ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack{
                    if(self.premium == false)
                    {
                    NavigationLink(destination: PaymentBuffer())
                                    {
                        Text("Unlock Lifebeats premium").font(Font.custom("Nexa Bold", size: 20)).fontWeight(.black).padding().padding(.leading, 20).foregroundColor(lifeBeatsColor)
                    }
                        
                    }
                    VStack{
                           Text("Completed Badges:")
                            .font(Font.custom("Nexa Bold", size: 16)).padding().padding(.top, 10)
//                        NavigationLink(destination:  AllBadges()){Text("View All Badges").foregroundColor(.white).frame(width: 150)}.padding(.leading, UIScreen.main.bounds.width-20)
                    }.padding(.trailing, UIScreen.main.bounds.width/2.5)
                    
                    BadgeRow()
                     .padding()
                }
                NavigationLink(destination:  AllBadges()){Text("View All Badges").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(.white).frame(width: 150)}.padding()
                
//                Text("In-game coins: 0")
//                
//                NavigationLink(destination:  CrytoExchange()){Text("Exchange").font(Font.custom("Nexa Bold", size: 16)).fontWeight(.semibold).foregroundColor(.white).frame(width: 150)}.padding()
                
            }
            //.frame(height: 550)
            .padding(.leading, -20) .background(ProfileBG())
                
                VStack(alignment: .leading)
                       {
                           Text("Trends")
                            .font(Font.custom("Nexa Bold", size: 16))
                            //.padding(.leading, 15)
                                //ProgressRectangle().frame(height: 150)
                                  //  .padding(.top, 80)
                    
                    HStack
                    {
                        VStack{
                            Text("  Total\nMinutes").font(Font.custom("Nexa Bold", size: 14)).fontWeight(.bold).padding(.bottom, 10)
                            Text(self.totalMinutes).font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor)
                        }.padding()
                        VStack{
                            Text("  Total\nSessions").font(Font.custom("Nexa Bold", size: 14)).fontWeight(.bold).padding(.bottom, 10)
                            Text(self.totalSessions).font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor)
                        }.padding()
                        VStack{
                            Text("Longest\nStreak").font(Font.custom("Nexa Bold", size: 14)).fontWeight(.bold).padding(.bottom, 10)
                            Text("\(self.longestStreak) days").font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor)
                        }.padding()
                        VStack{
                            Image("Lifeticker").resizable().frame(width: 45, height: 45).padding(.bottom, 5)
                            Text("\(self.totalCoins) coins").font(Font.custom("Nexa Bold", size: 13)).foregroundColor(lifeBeatsColor)
                        }.padding().padding(.bottom, 10)
                    }.padding(.leading, 10)
                    
                    
                }.padding(.leading, -10)
                
                
                VStack
                {
                    
                    
                    HStack
                        {
                        RecentlyUsedRow().listRowInsets(EdgeInsets())

                    }
                    .padding(.top, 20)
                }
                
                                NavigationLink(destination: PrivacyBuffer())
                                {
                                    Text("Contact Info >").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(lifeBeatsColor).padding()
                                }
                
        }
            }
            .onReceive(timer) { _ in
//                if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
//                {
//                    GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
//                    GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
//                }
            }
            
            .onAppear(perform: {
                let docRef = self.db.collection("Users").document(self.uid!)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let docData = document.data()
                        let coins = docData!["coinAmount"] as? Int ?? 0
                        self.totalCoins = String(coins)
                        //print(noti)

                    }
                    else {
                        print("Document does not exist")
                    }
                }

                
                self.totalSessions = UserDefaults.standard.string(forKey: "tSessions") ?? "0"
                self.longestStreak = UserDefaults.standard.string(forKey: "lStreak") ?? "0"
                self.totalMinutes = UserDefaults.standard.string(forKey: "totalMinutes") ?? "0"
//                self.totalCoins = UserDefaults.standard.string(forKey: "totalCoins") ?? "0"
                Analytics.setScreenName("Profile", screenClass: "Main")
                self.userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
            
                
                
            })
            .sheet(isPresented: self.$showingSettings)
            {
                ProfileEditor( showingSettings: self.$showingSettings )
        }
    }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary()
    }
}
