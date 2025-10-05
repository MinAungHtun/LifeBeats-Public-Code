//
//  FirstLaunchIntro.swift
//  LifeBeats
//
//  Created by User on 12/19/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase
import Purchases

struct FirstLaunchIntro: View {
    //@State var timeRemaining = 2
    let delegate = UIApplication.shared.delegate as! AppDelegate
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let db = Firestore.firestore()
    @State var loggedIn:Bool? = false
    @State var newUser:Bool? = false
    
    @State var finished:Bool = false

    
    @EnvironmentObject var userData: UserData
    
    func requestNotification()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            success, error in
            
            if success
            {
                print("Notification Done")
                self.scheduleNotification()
            }
            else if let error=error
            {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotification()
       {

           let content = UNMutableNotificationContent()
           content.title = "Mindfulness Reminder"
        content.body = "Start your day right, let's practice some mindfulness"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData":"fizzbuzz"]
           content.sound = UNNotificationSound.default
           
           
           var dateComponents = DateComponents()
           dateComponents.hour = 9
           dateComponents.minute = 0
           dateComponents.second = 0
           dateComponents.nanosecond = 0
           
           let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: "0001", content: content, trigger: trigger)
           UNUserNotificationCenter.current().add(request)
        print("NN")
        let uid = UserDefaults.standard.string(forKey: "UID")!
        let docRef = self.db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let docData = document.data()
                let ref = db.collection("Users").document(uid).setData([ "mainNoti" : true ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                        }
                    }

                //print(noti)
            }
            else {
                print("Document does not exist")
            }
        }
        self.scheduleNotification1()
       }
    
    func scheduleNotification1()
    {
        let content = UNMutableNotificationContent()
        content.title = "Need a break?"
        content.body = "Grab a quick breather with Lifebeats to recharge yourself now"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData":"buzzfizz"]
        content.sound = UNNotificationSound.default
        var dateComponents = DateComponents()
        dateComponents.hour = 15
        dateComponents.minute = 0
        dateComponents.second = 0
        dateComponents.nanosecond = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: "0002", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        //delegate.registerCategories()
    }
    
    var body: some View {
        if(self.finished == true)
        {
            CategoryHome().environmentObject(UserData()).environment(\.colorScheme, .dark).onAppear(perform: {
                self.timer.upstream.connect().cancel()
                self.requestNotification()
                UserTimer.sharedInstance.timerStarts()
            })
        }
        else if(self.finished == false)
        {
        NavigationView{
        VStack{
            if(self.loggedIn == false)
            {
            GoogleAppleSignIn()
            }
            else if(self.loggedIn == true && self.newUser == true)
            {
              WatsonFirstTime()
            //Questions()
            }
        }
        .onReceive(timer) { _ in
                    let newUser1 = UserDefaults.standard.value(forKey: "newUserAdd") as? Bool ?? false
                        let user = Auth.auth().currentUser
                        if let user = user {
                          // The user's ID, unique to the Firebase project.
                          // Do NOT use this value to authenticate with your backend server,
                          // if you have one. Use getTokenWithCompletion:completion: instead.
                          let uid = user.uid
                            let email = user.email
                            print(uid)
                            print(user.displayName ?? "none")
                            print(email!)
                            print(user)
                            UserDefaults.standard.set(uid, forKey: "UID")
                            UserDefaults.standard.set(email, forKey: "email")
                            let docRef = db.collection("Users").document(uid)
                            Purchases.debugLogsEnabled = true
                            Purchases.configure(withAPIKey: "FdZDlXwfNwZUaEzhmjFEDpLDmbpBdLVy", appUserID: uid)
                            Purchases.shared.purchaserInfo{(info, e) in
                            if(info?.entitlements["Premium"]?.isActive == true)
                            {
                                delegate.premium = true
                            }
                                //print(info!)
                            }
                            if(newUser1 == false)
                            {
                            docRef.getDocument { (document, error) in
                                if let document = document, document.exists {
                                    let docData = document.data()
                                    print(docData!["name"]!)
                                    let name = docData!["name"] as! String
                                    UserDefaults.standard.set(name, forKey: "userName")
                                    self.newUser = false
                                    self.finished = true
                                    BadgeLogic.sharedInstance.checkBadges()
                                } else {
                                    print("Document does not exist")
                                    self.newUser = true
                                }
                            }
                            }
                            
                            self.loggedIn = true
                        }
                        self.finished = UserDefaults.standard.value(forKey: "introFinished") as? Bool ?? false
        }
        }.environment(\.colorScheme, .dark)
        .onAppear(perform: {
            UserDefaults.standard.set(false, forKey: "introFinished")
            UserDefaults.standard.set(false, forKey: "newUserAdd")
            
        })
        }
    }
}

struct FirstLaunchIntro_Previews: PreviewProvider {
    static var previews: some View {
        FirstLaunchIntro()
    }
}
