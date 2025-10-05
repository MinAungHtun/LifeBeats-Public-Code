//Control Command Spacebar for emoji
//  Home.swift
//.font(Font.custom("name-of-font", size: 20))
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/4/20.
import SwiftUI
import Firebase
import FirebaseAnalytics
import UserNotifications

struct CategoryHome: View {
    
    //@State var morning : Bool?
    @State var afternoon : Bool?
//    @State var mindfulnessReminder: Bool=false
//    @State var bedTimeReminder: Bool=false
//    @State var notification: Bool = false
    @State var evening : Bool? = true
    //@State var night : Bool?
    @State var zeroSix : Bool?
    @State var sixNine : Bool?
    @State var lives : Int = 0
    let playURI = ""
    @State var nineTwelve : Bool?
    @State var twelveFifteen : Bool?
    @State var fifteenEighteen : Bool?
    @State var eighteenTwentyone : Bool?
    @State var twentyoneTwentyfour : Bool?
    //@State var musicPlayNav : Bool = false
    @State var player : Bool = false
    @State var paused : Bool = false
    @State var playing : Bool = false
    //GlobalPlayer.sharedInstance.playing
    @State var enlargePlayer : Bool = false
    @State var categoryName : String = " "
    @State var greetingText : LocalizedStringKey = " "
    //@State var greetingText1 : Any?
    @State var therapyName : String = " "
    @State var description : String = " "
    @State var duration : String = " "
    @State var badges : String = " "
    @State var lang : String = "en"
    @State var unreadMsg : String = " "
    @State var badgeCelebration : Bool = false //false
    @State var payBufferToggle : Bool = false
    @State var showUnread : Bool = false
    @State var showCoinReward : Bool = false
    @State var livesUpdated : Bool = true
    @State var coinShowCounter = 0
    @State var timeRemaining = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
//    @State var userName : String = "STEPH"
    
    var appRemote: SPTAppRemote? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
                
        }
    }
    
//    var widgetRemote: Bool? {
//        get {
//            
//            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.widgetFlag
//                
//        }
//    }
    
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    @State var userName : String = " "
    var playerState: SPTAppRemotePlayerState?
//    let db = Firestore.firestore()
//    let uid = UserDefaults.standard.string(forKey: "UID")
    
    var defaultCallback: SPTAppRemoteCallback {
        get {
            return {[self] _, error in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    var categories: [String: [Therapy]] {
        Dictionary(
            grouping: therapyData,
            by: { $0.category.rawValue }
        )
    }
    var featured: [Therapy] {
        therapyData.filter { $0.isFeatured }
    }
    @EnvironmentObject var userData: UserData
    
    var profileButton: some View {
                NavigationLink(destination: ProfileSummary()
            .environmentObject(self.userData))
         {
            Image("user1")
                .resizable()
                 .renderingMode(.original)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 3))
                .shadow(radius: 20)
                .accessibility(label: Text("Profile"))
                .frame(width: 33.0, height: 33.0)
            
        }
    }
    
    var watsonButton: some View {
        NavigationLink(destination: //FebeNavBuffer(evening: self.evening!)
                        WatsonBuffer(evening: self.evening) )
         {
            Image("Febe")
                .resizable()
                 .renderingMode(.original)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white,lineWidth: 3))
                .shadow(radius: 20)
                .accessibility(label: Text("Bot"))
                .frame(width: 40.0, height: 40.0)
            
        }
    }
    
    func checkUnreadMsg()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let lastRead = docData!["lastRead"] as? Int ?? 0
                checkMsg(lastRd: lastRead)
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func checkMsg(lastRd:Int)
    {
        let db = Firestore.firestore()
        let docRef = db.collection("Groups").document("LifebeatsQueue")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let lastRead = docData!["total messages"] as? Int ?? 0
                if(lastRd != lastRead && lastRead > lastRd)
                {
                    let difference = lastRead - lastRd
                    self.unreadMsg = String(difference)
                    
                    self.showUnread = true
                    
                }
                else
                {
                    self.unreadMsg = " "
                    self.showUnread = false
                }
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func updateLives(newLive : Int)
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")!
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let ref = db.collection("Users").document(uid).setData([ "Lives" : newLive ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("Date1 added1")
                                    self.livesUpdated = true
                                }
                            }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func liveAssign()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")!
        let docRef = db.collection("Users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let lives = docData!["Lives"] as? Int ?? 5
                GlobalPlayer.sharedInstance.gameLives = lives
                UserDefaults.standard.set(lives, forKey:"Lives")
                print("Date1 in \(lives)")
                self.liveCheck(lives: lives)
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func firstTimeOnly()
    {
        UserDefaults.standard.set(5, forKey:"Lives")
        GlobalPlayer.sharedInstance.gameLives = 5
        if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
            let current = Date()
            print("Date1 \(date)")
            print("Date1 \(current)")
            let diff1 = Calendar.current.dateComponents([.minute], from: date, to: Date()).minute
            let minute = diff1! * 60
            let diff2 = Calendar.current.dateComponents([.second], from: date, to: Date()).second
            let total = minute + diff2!
            //print("Date1\(diff1!)")
            //print("Date1\(minute)")
            print("Date1\(diff2!)")
           //print("Date1\(total)")
           // print("diff1\(diff2! % 60)")
            
            if(diff2! < 3600)
            {
              let num = 3600 - diff2!
                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(num)
                print("Date1\(num)")
            }
            else if(diff2! < 7200)
            {
                let num = 7200 - diff2!
                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(num)
                print("Date1\(num)")
            }
            else if(diff2! < 10800)
            {
                let num = 10800 - diff2!
                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(num)
                print("Date1\(num)")
            }
            else if(diff2! < 14400)
            {
                let num = 14400 - diff2!
                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(num)
                print("Date1\(num)")
            }
            else if(diff2! < 18000)
            {
                let num = 18000 - diff2!
                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(num)
                print("Date1\(num)")
            }
}

    }
    
    func liveCheck(lives : Int)
    {
//        let db = Firestore.firestore()
//        let uid = UserDefaults.standard.string(forKey: "UID")!
//        let docRef = db.collection("Users").document(uid)
        
//        let lives =  UserDefaults.standard.integer(forKey:"Lives")
        //let lives = GlobalPlayer.sharedInstance.gameLives
        //print("Date1 \(lives)")
          if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
              let current = Date()
              print("Date1 \(date)")
              print("Date1 \(current)")
              let diff1 = Calendar.current.dateComponents([.second], from: date, to: Date()).second
              print("diff1\(diff1! % 60)")
             // GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(diff1! % 60)
              
              if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff >= 5 {
                  //do something
                  if(lives + 5 <= 5)
                  {
                      let new = lives + 5
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                          self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 55")
                  }
                  else if(lives + 4 <= 5)
                  {
                      let new = lives + 4
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                          self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 54")
                  }
                  else if(lives + 3 <= 5)
                  {
                      let new = lives + 3
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                          self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 53")
                  }
                  else if(lives + 2 <= 5)
                  {
                      let new = lives + 2
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                          self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 52")
                  }
                  else if(lives + 1 <= 5)
                  {
                      let new = lives + 1
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 51")
                  }
              }
              else if let diff2 = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff2 >= 4 {
                  //do something
                  if(lives + 4 <= 5)
                  {
                      let new = lives + 4
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 44")
                  }
                  else if(lives + 3 <= 5)
                  {
                      let new = lives + 3
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 43")
                  }
                  else if(lives + 2 <= 5)
                  {
                      let new = lives + 2
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 42")
                  }
                  else if(lives + 1 <= 5)
                  {
                      let new = lives + 1
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 41")
                  }
              }
              else if let diff3 = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff3 >= 3 {
                  //do something
                  if(lives + 3 <= 5)
                  {
                      let new = lives + 3
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 33")
                  }
                  else if(lives + 2 <= 5)
                  {
                      let new = lives + 2
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 32")
                  }
                  else if(lives + 1 <= 5)
                  {
                      let new = lives + 1
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 31")
                  }
              }
              else if let diff4 = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff4 >= 2 {
                  if(lives + 2 <= 5)
                  {
                      let new = lives + 2
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 22")
                  }
                  else if(lives + 1 <= 5)
                  {
                      let new = lives + 1
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 21")
                  }
              }
              else if let diff5 = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff5 == 1
              {
                  print("diff\(diff5)")
                  if(lives + 1 <= 5)
                  {
                      let new = lives + 1
                      if(new > 0 && self.livesUpdated == true)
                      {
                      UserDefaults.standard.set(new, forKey:"Lives")
                      self.livesUpdated = false
                      self.updateLives(newLive: new)
                      UserDefaults.standard.set(Date(), forKey:"creationTime")
                          GlobalPlayer.sharedInstance.gameLives = new
                          self.lives = new
                      }
                      print("Date1 11")
                  }
              }

              
                        }

    }
    
    func badgeCheck()
    {
        
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")!
        let docRef = db.collection("Users").document(uid)
        
//        let lives =  UserDefaults.standard.integer(forKey:"Lives")
//        print("Date1 \(lives)")
//          if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
//              let current = Date()
//              print("Date1 \(date)")
//              print("Date1 \(current)")
//              let diff1 = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour
//                    print("diff1\(diff1)")
//
//              if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff >= 5 {
//                  //do something
//                  if(lives + 5 <= 5)
//                  {
//                      let new = lives + 5
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 55")
//                  }
//                  else if(lives + 4 <= 5)
//                  {
//                      let new = lives + 4
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 54")
//                  }
//                  else if(lives + 3 <= 5)
//                  {
//                      let new = lives + 3
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 53")
//                  }
//                  else if(lives + 2 <= 5)
//                  {
//                      let new = lives + 2
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 52")
//                  }
//                  else if(lives + 1 <= 5)
//                  {
//                      let new = lives + 1
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 51")
//                  }
//              }
//              else if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff >= 4 {
//                  //do something
//                  if(lives + 4 <= 5)
//                  {
//                      let new = lives + 4
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 44")
//                  }
//                  else if(lives + 3 <= 5)
//                  {
//                      let new = lives + 3
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 43")
//                  }
//                  else if(lives + 2 <= 5)
//                  {
//                      let new = lives + 2
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 42")
//                  }
//                  else if(lives + 1 <= 5)
//                  {
//                      let new = lives + 1
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 41")
//                  }
//              }
//              else if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff >= 3 {
//                  //do something
//                  if(lives + 3 <= 5)
//                  {
//                      let new = lives + 3
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 33")
//                  }
//                  else if(lives + 2 <= 5)
//                  {
//                      let new = lives + 2
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 32")
//                  }
//                  else if(lives + 1 <= 5)
//                  {
//                      let new = lives + 1
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 31")
//                  }
//              }
//              else if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff >= 2 {
//                  if(lives + 2 <= 5)
//                  {
//                      let new = lives + 2
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 22")
//                  }
//                  else if(lives + 1 <= 5)
//                  {
//                      let new = lives + 1
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 21")
//                  }
//              }
//              else if let diff = Calendar.current.dateComponents([.second], from: date, to: Date()).second, diff >= 1 {
//                  print("diff\(diff)")
//                  if(lives + 1 <= 5)
//                  {
//                      let new = lives + 1
//                      UserDefaults.standard.set(new, forKey:"Lives")
//                      self.updateLives(newLive: new)
//                      UserDefaults.standard.set(Date(), forKey:"creationTime")
//                      print("Date1 11")
//                  }
//              }
//
//
//                        }
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let b7 = docData!["mindfulBeginner"] as! Bool
                let b8 = docData!["mindfulVeteran"] as! Bool
                let b6 = docData!["zenMaster"] as! Bool
                let b2 = docData!["inTheZone"] as! Bool
                let b5 = docData!["lullaby"] as! Bool
                let b1 = docData!["curiosity"] as! Bool
                let b3 = docData!["lifebeatsLite"] as! Bool
                let b4 = docData!["lifebeatsPro"] as! Bool
                let b9 = docData!["loveThyself"] as? Bool ?? false
                let b10 = docData!["officeMaestro"] as? Bool ?? false
                let b11 = docData!["aceThatTest"] as? Bool ?? false
                let b12 = docData!["dailyCheckIn"] as? Bool ?? false
                let b13 = docData!["sleepyHead"] as? Bool ?? false
                let b14 = docData!["firstSteps"] as? Bool ?? false
                
                let bd7 = docData!["mindfulBeginnerCelebrated"] as? Bool ?? false
                let bd8 = docData!["mindfulVeteranCelebrated"] as? Bool ?? false
                let bd6 = docData!["zenMasterCelebrated"] as? Bool ?? false
                let bd2 = docData!["inTheZoneCelebrated"] as? Bool ?? false
                let bd5 = docData!["lullabyCelebrated"] as? Bool ?? false
                let bd1 = docData!["curiosityCelebrated"] as? Bool ?? false
                let bd3 = docData!["lifebeatsLiteCelebrated"] as? Bool ?? false
                let bd4 = docData!["lifebeatsProCelebrated"] as? Bool ?? false
                let bd9 = docData!["loveThyselfCelebrated"] as? Bool ?? false
                let bd10 = docData!["officeMaestroCelebrated"] as? Bool ?? false
                let bd11 = docData!["aceThatTestCelebrated"] as? Bool ?? false
                let bd12 = docData!["dailyCheckInCelebrated"] as? Bool ?? false
                let bd13 = docData!["sleepyHeadCelebrated"] as? Bool ?? false
                let bd14 = docData!["firstStepsCelebrated"] as? Bool ?? false
                let coinCount = docData!["coinAmount"] as? Int ?? 0
                let coin = String(coinCount)
                UserDefaults.standard.set(coin, forKey: "totalCoins")
                
                
                if(GlobalPlayer.sharedInstance.coinReward == true)
                {
                let ref = db.collection("Users").document(uid).setData([ "coinAmount" : coinCount+5 ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                            }
                        }
                }
                
                if(bd7 != b7 && b7 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "mindfulBeginner"
                }
                if(bd6 != b6 && b6 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "zenMaster"
                }
                if(bd5 != b5 && b5 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "lullaby"
                }
                if(bd4 != b4 && b4 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "lifebeatsPro"
                }
                if(bd3 != b3 && b3 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "lifebeatsLite"
                }
                if(bd8 != b8 && b8 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "mindfulVeteran"
                }
                if(bd2 != b2 && b2 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "inTheZone"
                }
                if(bd1 != b1 && b1 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "curiosity"
                }
                if(bd9 != b9 && b9 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "loveThyself"
                }
                if(bd10 != b10 && b10 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "officeMaestro"
                }
                if(bd11 != b11 && b11 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "aceThatTest"
                }
                if(bd12 != b12 && b12 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "dailyCheckIn"
                }
                if(bd13 != b13 && b13 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "sleepyHead"
                }
                if(bd14 != b14 && b14 != false)
                {
                    self.badgeCelebration = true
                    self.badges = "firstSteps"
                }
                
            }
            else {
                print("Document does not exist")
            }
        }

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
    
    var body: some View {
        
        if(self.badgeCelebration == false)
        {
        VStack{
        VStack{
        NavigationView {
            VStack{
            ScrollView(.vertical, showsIndicators: false){
            VStack{
                VStack{
//                    if(self.afternoon == true)
//                    {
//                        Text("Good afternoon, \(self.userName)").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 13)
//                    }
//                    else if(self.evening == true)
//                    {
//                        Text("Good evening, \(self.userName)").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 13)
//                    }
//                    else
//                    {
//                        Text("Good morning, \(self.userName)").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 13)
//                    }
                    Text(self.greetingText).font(Font.custom("Nexa Bold", size: 23)).fontWeight(.black).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 13)
                    
//                    if(self.widgetRemote == true)
//                    {
//                        Text("1")
//                    }
                                
                GeometryReader { geometry in
                    CarouselView(numberOfImages: 3) {
//                        ZStack {
//                            HolidayPromo()
//                                .frame(width: geometry.size.width, height: geometry.size.height)
//                        }
                        ZStack{
                            if(self.showCoinReward == true)
                            {
                                Text("You have received 5 coins").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.blue)
                                    .clipShape(RoundedBubble())
                            }
                            NavigationLink(destination: TherapyDetail(therapy: self.userData.therapies[18]).environmentObject(self.userData)){
                                //Text("Something")
                                Image("Meditation 10 mins")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                                    .clipped()}
                            Text("Meditation").font(Font.custom("Nexa Bold", size: 19)).fontWeight(.bold).padding(.top, 185).padding(.trailing, 130)

                        }
                        ZStack{
                            NavigationLink(destination: TherapyDetail(therapy: self.userData.therapies[43]).environmentObject(self.userData)){
                        Image("Thought hunter")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()}
                            Text("Thought Hunter").font(Font.custom("Nexa Bold", size: 19)).fontWeight(.bold).padding(.top, 195).padding(.trailing, 130)
                        }
                        ZStack{
                            NavigationLink(destination: TherapyDetail(therapy: self.userData.therapies[30]).environmentObject(self.userData)){
                        Image("Seeking balance")
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()}
                            Text("Seeking Balance").font(Font.custom("Nexa Bold", size: 19)).fontWeight(.bold).padding(.top, 195).padding(.trailing, 130)
                        }
                    }
                    
                    
                }.frame(height: 240, alignment: .center)
                }.padding(.bottom, 20).padding(.top, 10)
                
                VStack{
                if(self.zeroSix == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[17], userData.therapies[14], userData.therapies[18],
                        userData.therapies[7]]).frame(height:220)
                                       .listRowInsets(EdgeInsets())
                }
                else if(self.sixNine == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[21], userData.therapies[12], userData.therapies[22], userData.therapies[42]]).frame(height:220)
                    .listRowInsets(EdgeInsets())
                }
                else if(self.nineTwelve == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[18], userData.therapies[12], userData.therapies[31],
                        userData.therapies[32]]).frame(height:220)
                    .listRowInsets(EdgeInsets())
                }
                else if(self.twelveFifteen == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[29], userData.therapies[16], userData.therapies[19],
                        userData.therapies[30]]).frame(height:220)
                    .listRowInsets(EdgeInsets())

                }
                else if(self.fifteenEighteen == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[8], userData.therapies[18], userData.therapies[32],
                        userData.therapies[12]]).frame(height:220)
                    .listRowInsets(EdgeInsets())

                }
                else if(self.eighteenTwentyone == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[30], userData.therapies[14], userData.therapies[18],
                        userData.therapies[17]]).frame(height:220)
                    .listRowInsets(EdgeInsets())

                }
                else if(self.twentyoneTwentyfour == true)
                {
                    CustomizedCategoryRow( name: "Suggested For You", items: [userData.therapies[41], userData.therapies[11], userData.therapies[24],
                        userData.therapies[33]]).frame(height:220)
                    .listRowInsets(EdgeInsets())
                }
            
         //
                
                    RecentlyUsedRow().frame(height:220).listRowInsets(EdgeInsets())
                
                
                }
                
                CategoryColumn().listRowInsets(EdgeInsets())
                
//                NavigationLink(destionation: FireStoree())
//                {
//                    Text("TTT")
//                }

            }
            }
            .padding(.top, 20)//.padding(.bottom, 50)
                //.navigationBarItems(leading: watsonButton,trailing: profileButton)

            .onReceive(timer) { _ in
                
//                self.liveCheck()
                
                if(self.coinShowCounter > 0)
                {
                    self.coinShowCounter -= 1
                }
                else if(self.coinShowCounter > 0)
                {
                    self.showCoinReward = false
                }
                
//                if(GlobalPlayer.sharedInstance.startoftheApp == true)
//                {
//                    //print("Yes")
////                    print("Start1\(self.timeRemaining)")
//                    self.timeRemaining += 1
//                    if(self.timeRemaining%3 == 0 )
//                    {
//                        //print("Yes")
//                        if(appRemote?.isConnected == false)
//                        {
//                            appRemote?.authorizeAndPlayURI(self.playURI)
//                            //print("Yessssssss")
//                            //handle for case where there is no Spotifyapp installed
//                            appRemote?.connect()
//                        }
//
//                    }
////                    if(appRemote?.isConnected == true)
////                    {
////                        appRemote?.playerAPI?.pause(defaultCallback)
////                        GlobalPlayer.sharedInstance.startoftheApp = false
////                    }
//
//                }
                
                self.player = GlobalPlayer.sharedInstance.playing
                self.therapyName = GlobalPlayer.sharedInstance.therapySongName ?? " "
                self.paused = GlobalPlayer.sharedInstance.paused
                self.categoryName = GlobalPlayer.sharedInstance.categoryName ?? " "
    self.description = Singletons.sharedInstance.therapyDescription ?? " "
    self.duration = Singletons.sharedInstance.duration ?? " "
                if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
                {
                    GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
                    GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
                }
                
                if (GlobalPlayer.sharedInstance.timeTilLife > 0 && GlobalPlayer.sharedInstance.gameLives < 5) {
                    GlobalPlayer.sharedInstance.timeTilLife -= 1
                }
else if (GlobalPlayer.sharedInstance.timeTilLife == 0)
{
    GlobalPlayer.sharedInstance.timeTilLife = 3600.0
}
                
            }

            .onAppear(perform: {
                
                if(GlobalPlayer.sharedInstance.coinReward == true)
                {
                    self.showCoinReward = true
                    GlobalPlayer.sharedInstance.coinReward = false
                    self.coinShowCounter = 3
                }
                self.liveAssign()
                if(GlobalPlayer.sharedInstance.firstEntry == true)
                {
                self.firstTimeOnly()
                    GlobalPlayer.sharedInstance.firstEntry = false
                }
                print("It's okay.")
                self.showUnread = false
                //fatalError()
                QuizQuestions.sharedInstance.getQuestion()
                self.badgeCheck()
                self.checkUnreadMsg()
                GlobalPlayer.sharedInstance.febeTrigged = false
                self.userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
                self.lang = UserDefaults.standard.string(forKey: "lang") ?? "en"
                        //self.morning = self.evaluateTime(from: 1,to: 11, toMinutes: 59, toSeconds: 59)
                        self.afternoon = self.evaluateTime(from: 12,to: 16, toMinutes: 59, toSeconds: 59)
                        self.evening = self.evaluateTime(from: 17,to: 23, toMinutes: 59, toSeconds: 59)

                        if(self.afternoon == true)
                        {
                           self.greetingText = "Good afternoon, \(self.userName)"
                            //self.greetingText1 = LocalizedStringKey("Good afternoon, \(self.userName)")
                        }
                        else if(self.evening == true)
                        {
                            self.greetingText = "Good evening, \(self.userName)"
                            //self.greetingText1 = LocalizedStringKey("Good evening, \(self.userName)")
                        }
                        else
                        {
                            self.greetingText = "Good morning, \(self.userName)"
                            //self.greetingText1 = LocalizedStringKey("Good morning, \(self.userName)")
                        }
                            self.player = GlobalPlayer.sharedInstance.playing
                            self.therapyName = GlobalPlayer.sharedInstance.therapySongName ?? " "
                            self.paused = GlobalPlayer.sharedInstance.paused
                            self.categoryName = GlobalPlayer.sharedInstance.categoryName ?? " "
                self.description = Singletons.sharedInstance.therapyDescription ?? " "
                self.duration = Singletons.sharedInstance.duration ?? " "
                
                        self.zeroSix = self.evaluateTime(from: 0, to: 5, toMinutes: 59, toSeconds: 59)
                        self.sixNine = self.evaluateTime(from: 6, to: 8, toMinutes: 59, toSeconds: 59)
                        self.nineTwelve = self.evaluateTime(from: 9, to: 11, toMinutes: 59, toSeconds: 59)
                        self.twelveFifteen = self.evaluateTime(from: 12, to: 14, toMinutes: 59, toSeconds: 59)
                        self.fifteenEighteen = self.evaluateTime(from: 15, to: 17, toMinutes: 59, toSeconds: 59)
                        self.eighteenTwentyone = self.evaluateTime(from: 18, to: 20, toMinutes: 59, toSeconds: 59)
                        self.twentyoneTwentyfour = self.evaluateTime(from: 21, to: 23, toMinutes: 59, toSeconds: 59)
                        Analytics.setScreenName("Home", screenClass: "Main")
            })
            .sheet(isPresented: $payBufferToggle)
            {
                PaymentBuffer()
            }
            .onDisappear(perform:
            {
                self.liveAssign()
            })

                if(self.premium == false)
                {
                    Button(action: {self.payBufferToggle.toggle()})
                    {Text("Remove Ads").font(Font.custom("Nexa Bold", size: 16))}
                    AdsView()
                }
            if(self.player == true)
            {
                NavigationLink(destination:                 EnlargedMinimizedPlayer(categoryName: self.categoryName, therapyName: self.therapyName, description: self.description, duration: self.duration, playing: self.paused))
                {
                HStack(spacing: 30)
                {
                    VStack{
                        Text(self.therapyName).font(Font.custom("Nexa Bold", size: 16)).padding(.top, 5).padding(.trailing, 5).padding(.leading, 5)
                        Text(self.categoryName).font(Font.custom("Nexa Bold", size: 12))
                    }
                    if(self.paused == true)
                    {
                        Button(action:
                                {GlobalPlayer.sharedInstance.continueMusic();
                                    self.paused=false;self.playing=true
                        })
                        {
                        Image(systemName: "play.fill")
                        }
                        .padding()
                    }
                    else if(self.paused == false){
                        Button(action: {GlobalPlayer.sharedInstance.pauseMusic();self.paused=true;self.playing=false;
                    })
                    {
                    Image(systemName: "pause.fill")
                    }
                    .padding()
                    }
                    Button(action: {GlobalPlayer.sharedInstance.stopMusic();self.player = false})
                    {
                    Image(systemName: "multiply.circle")
                    }
                    .padding()
                }
                }
                
                .padding(.bottom, 15)
            }
                HStack(spacing:80)
                {
                    NavigationLink(destination: WatsonBuffer())
                    {
                        Image("Febe")
                            .resizable()
                             .renderingMode(.original)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 3))
                            .shadow(radius: 20)
                            .accessibility(label: Text("Bot"))
                            .frame(width: 40.0, height: 40.0)
                    }
                    NavigationLink(destination: MainGame())
                    {
                        Image("gameCon")
                            .resizable()
                             .renderingMode(.original)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 3))
                            .shadow(radius: 20)
                            .accessibility(label: Text("Game"))
                            .frame(width: 40.0, height: 40.0)
                        
//                        if(self.showUnread == true)
//                        {
//                        Text(self.unreadMsg).fontWeight(.black).font(.system(size: 13)).padding(.leading, 5).padding(.trailing, 5).padding(.top, 5).padding(.bottom, 5).foregroundColor(.white).background(Color.red)
//                            .clipShape(FeelingBubble()).frame(width:50).padding(.leading, -25).padding(.top, -20)
//                        }  UNCOMMENT THIS IN COMMUNITY LAUNCH
                        

                        
                    }
                    NavigationLink(destination: ProfileSummary())
                    {
                        Image("user1")
                            .resizable()
                             .renderingMode(.original)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white,lineWidth: 3))
                            .shadow(radius: 20)
                            .accessibility(label: Text("Profile"))
                            .frame(width: 33.0, height: 33.0)
                    }
                }.frame(height: 60)
        }
        }.navigationViewStyle(StackNavigationViewStyle())
        .environment(\.colorScheme, .dark)
        .environment(\.locale, .init(identifier: self.lang))
        }
        }
        }
        else if(self.badgeCelebration == true)
        {
//            NavigationView {
            VStack{
                Button (action:{self.badgeCelebration = false})
                    {
                    Text("X").padding().foregroundColor(.white).clipShape(Circle())
                        .background(Color.gray.blur(radius: 8.0))
                        .frame(width: 100)
                }.padding(.leading, 250).padding(.top, 100)
                LottieTest(badges: self.badges)
            }.background(lifeBeatsColor).frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).ignoresSafeArea()
            .onReceive(timer) { _ in
                self.player = GlobalPlayer.sharedInstance.playing
                self.therapyName = GlobalPlayer.sharedInstance.therapySongName ?? " "
                self.paused = GlobalPlayer.sharedInstance.paused
                self.categoryName = GlobalPlayer.sharedInstance.categoryName ?? " "
    self.description = Singletons.sharedInstance.therapyDescription ?? " "
    self.duration = Singletons.sharedInstance.duration ?? " "
                if(GlobalPlayer.sharedInstance.playing == true && GlobalPlayer.sharedInstance.paused == false)
                {
                    GlobalPlayer.sharedInstance.elaspedTime = GlobalPlayer.sharedInstance.elaspedTime!-1
                    GlobalPlayer.sharedInstance.elapsedTimeCG = GlobalPlayer.sharedInstance.elapsedTimeCG!-1
                }
                
            }
            
//
//            }.navigationViewStyle(StackNavigationViewStyle())
//                .environment(\.colorScheme, .dark)
        }
}
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
