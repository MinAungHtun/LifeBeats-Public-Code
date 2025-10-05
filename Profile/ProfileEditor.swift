//
//  ProfileEditor.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/3/20.


import SwiftUI
import FirebaseAuth
import Firebase

struct ProfileEditor: View {
   // @Binding var profile: Profile
    @State var mindfulnessReminder: Bool = UserDefaults.standard.bool(forKey: "MFR") 
    @State var bedTimeReminder: Bool = UserDefaults.standard.bool(forKey: "BTR")
    @State var notification: Bool = UserDefaults.standard.bool(forKey: "noti")
    @State private var showingAlert = false
    @State var title : String = " "
    @State var message : String = " "
    @Binding var showingSettings : Bool
    @State var popUp : Bool = false
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")
   // @State var popUpNo : Int = 0
    //@State var privacy : Bool = false
    //@State var TOU : Bool = false
    @State var timeRemaining = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
   // let delegate = UIApplication.shared.delegate as! AppDelegate
    func requestNotification(notiNo:Int)
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            success, error in
            
            if success
            {
                print("Notification Done")
                if(notiNo == 1)
                {
                self.scheduleNotification()
                    //self.setbedNoti1()
                    //self.setmindNoti2()
                }
                else if(notiNo == 2)
                {
                self.setbedNoti1()
                }
                else if(notiNo == 3)
                {
                self.setmindNoti2()
                }
            }
            else if let error=error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func setbedNoti1()
    {

            let docRef = db.collection("Users").document(uid!)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                   let docData = document.data()
                    let hour = docData!["bedHr"] as? Int ?? 22
                    let minute = docData!["bedMin"] as? Int ?? 0
                    let second = docData!["bedSec"] as? Int ?? 0
                    print("\(hour):\(minute):\(second)")
                    let content = UNMutableNotificationContent()
                    content.title = "It's Bedtime"
                    content.subtitle = "Let's sleep better with some soundscapes"
                    content.sound = UNNotificationSound.default
                    
                    
                    var dateComponents = DateComponents()
                    dateComponents.hour = hour
                    dateComponents.minute = minute
                    dateComponents.second = 0
                    dateComponents.nanosecond = 0
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    
                    let request = UNNotificationRequest(identifier: "0003", content: content, trigger: trigger)
                    UNUserNotificationCenter.current().add(request)
                    
                    let docRef = self.db.collection("Users").document(self.uid!)
                    docRef.getDocument { (document, error) in
                        if let document = document, document.exists {
                           // let docData = document.data()
                            let ref = db.collection("Users").document(uid!).setData([ "setNoti" : true ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                        UserDefaults.standard.set(true, forKey: "BTR")
                                        DispatchQueue.main.async {
                                            
                                        self.bedTimeReminder = true
                                        }
                                    }
                                }
                            
                            let ref1 = db.collection("Users").document(uid!).setData([ "sleepyHead" : true ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                        BadgeLogic.sharedInstance.checkBadges()
                                    }
                                }
                            
                            

                            //print(noti)
                        }
                        else {
                            print("Document does not exist")
                        }
                    }
                }
                else {
                    print("Document does not exist")
                }
            }
            
    }
    
    func setmindNoti2()
    {
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               let docData = document.data()
                let hour = docData!["mindHr"] as? Int ?? 9
                let minute = docData!["mindMin"] as? Int ?? 0
                let second = docData!["mindSec"] as? Int ?? 0
                print("\(hour):\(minute):\(second)")
                let content = UNMutableNotificationContent()
                content.title = "Meditation Time"
                content.subtitle = "Let's meditate with some soundscapes"
                content.sound = UNNotificationSound.default
                
                
                var dateComponents = DateComponents()
                dateComponents.hour = hour
                dateComponents.minute = minute
                dateComponents.second = 0
                dateComponents.nanosecond = 0
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: "0003", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
                
                let docRef = self.db.collection("Users").document(self.uid!)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                       // let docData = document.data()
                        let ref = db.collection("Users").document(uid!).setData([ "setNoti1" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    UserDefaults.standard.set(true, forKey: "MFR")
                                    DispatchQueue.main.async {
                                        
                                    self.mindfulnessReminder = true
                                    }
                                }
                            }
                        
                        let ref1 = db.collection("Users").document(uid!).setData([ "firstSteps" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    BadgeLogic.sharedInstance.checkBadges()
                                }
                            }

                        //print(noti)
                    }
                    else {
                        print("Document does not exist")
                    }
                }
            }
            else {
                print("Document does not exist")
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
        
        let docRef = self.db.collection("Users").document(self.uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let docData = document.data()
                let ref = db.collection("Users").document(uid!).setData([ "mainNoti" : true ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            UserDefaults.standard.set(true, forKey: "noti")
                            DispatchQueue.main.async {
                                
                            self.notification = true
                            }
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
    
    func removeBed()
    {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
                        var identifiers: [String] = []
                        for notification:UNNotificationRequest in notificationRequests {
                            if notification.identifier == "0003" {
                               identifiers.append(notification.identifier)
                            }
                        }
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
                     }
        let docRef = self.db.collection("Users").document(self.uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let docData = document.data()
                let ref = db.collection("Users").document(uid!).setData([ "setNoti" : false ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            UserDefaults.standard.set(false, forKey: "BTR")
                            DispatchQueue.main.async {
                                
                                
                            self.bedTimeReminder = false
                            }
                        }
                    }
                
                let ref1 = db.collection("Users").document(uid!).setData([ "sleepyHead" : false ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            let ref2 = db.collection("Users").document(uid!).setData([ "sleepyHeadCelebrated" : false ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                        
                                        
                                       // BadgeLogic.sharedInstance.checkBadges()
                                    }
                                }
                            
                            BadgeLogic.sharedInstance.checkBadges()
                        }
                    }

                //print(noti)
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func deleteProfile()
    {
        let docRef = self.db.collection("Users").document(self.uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let docData = document.data()
                let ref = db.collection("Users").document(uid!).setData([ "deletProfile" : true ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            
                        }
                }
                    }
        }
    }
    
    
    func removeMind()
    {
        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
                        var identifiers: [String] = []
                        for notification:UNNotificationRequest in notificationRequests {
                            if notification.identifier == "0004" {
                               identifiers.append(notification.identifier)
                            }
                        }
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
                     }
        let docRef = self.db.collection("Users").document(self.uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let docData = document.data()
                let ref = db.collection("Users").document(uid!).setData([ "setNoti1" : false ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            UserDefaults.standard.set(false, forKey: "MFR")
                            DispatchQueue.main.async {
                                
                            self.mindfulnessReminder = false
                            }
                        }
                    }
                
                let ref1 = db.collection("Users").document(uid!).setData([ "firstSteps" : false ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                            let ref2 = db.collection("Users").document(uid!).setData([ "firstStepsCelebrated" : false ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                       // BadgeLogic.sharedInstance.checkBadges()
                                    }
                                }

                            BadgeLogic.sharedInstance.checkBadges()
                        }
                    }

                //print(noti)
            }
            else {
                print("Document does not exist")
            }
        }
    }
    func removeAll()
    {
        removeBed()
        removeMind()
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests();
            let docRef = self.db.collection("Users").document(self.uid!)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                   // let docData = document.data()
                    let ref = db.collection("Users").document(uid!).setData([ "mainNoti" : false ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added1")
                                UserDefaults.standard.set(false, forKey: "noti")
                                DispatchQueue.main.async {
                                 
                                self.notification = false
                                }
                            }
                        }

                    //print(noti)
                }
                else {
                    print("Document does not exist")
                }
            }

    }
    
//    func removeNoti()
//    {
//        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//            var identifiers: [String] = []
//            for notification:UNNotificationRequest in notificationRequests {
//                if notification.identifier == "0003" {
//                   identifiers.append(notification.identifier)
//                }
//            }
//            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//         }
//    }
//
//    func removeNoti1()
//    {
//        UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//            var identifiers: [String] = []
//            for notification:UNNotificationRequest in notificationRequests {
//                if notification.identifier == "0004" {
//                   identifiers.append(notification.identifier)
//                }
//            }
//            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//
//         }
//    }
    
    var body: some View {
        NavigationView{
            //ScrollView(.vertical, showsIndicators: false)
            List{
//        HStack
//            {
//            Button(action: {self.showingSettings = false})
//                {
//                    Text("Done")
//                }.padding(.leading, UIScreen.main.bounds.width-70 )
//        }
            VStack(alignment: .leading){
//            Button(action:{ requestNotification();
//                self.title = "Notification added"
//                self.message = "Two notifcation from Lifebeats has been added"
//                self.showingAlert = true
//            }) {
//                Text("Enable Notifications").foregroundColor(.white).padding()
//            }
                
                Toggle(isOn: $notification)
                {
                    HStack{
                        Text("Notifications").font(Font.custom("Nexa Bold", size: 16))
                        Text("(turn on to activate other reminders)").font(Font.custom("Nexa Bold", size: 11))
                    }
                }
                Toggle(isOn: $bedTimeReminder)
                {
                    Text("Bedtime Reminder").font(Font.custom("Nexa Bold", size: 16))
                }
                Toggle(isOn: $mindfulnessReminder)
                {
                    Text("Mindfulness Reminder").font(Font.custom("Nexa Bold", size: 16))
                }

//            Button(action:{ UNUserNotificationCenter.current().removeAllPendingNotificationRequests();                 self.title = "Notification removed"
//                    self.message = "Two notifcation from Lifebeats has been removed"
//                self.showingAlert = true
//            }) {
//                Text("Disable Notifications").foregroundColor(.white).padding()
//            }
//
//                NavigationLink(destination: TimePicker()) {
//                    Text("Turn on Bedtime Reminder").foregroundColor(.white).padding()
//            }
            
            
            
//            Button(action:{ UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//                var identifiers: [String] = []
//                for notification:UNNotificationRequest in notificationRequests {
//                    if notification.identifier == "0003" {
//                       identifiers.append(notification.identifier)
//                    }
//                }
//                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//             }
//            self.title = "Bedtime Reminder Removed"
//            self.message = "Please if you wish, you can set it again."
//            self.showingAlert = true
//            }) {
//                Text("Turn off Bedtime Reminder").foregroundColor(.white).padding()
//            }
//
//
//                NavigationLink(destination: TimePicker2()) {
//                Text("Turn on Mindful Reminder").foregroundColor(.white).padding()
//            }
            
//            Button(action:{ UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//                var identifiers: [String] = []
//                for notification:UNNotificationRequest in notificationRequests {
//                    if notification.identifier == "0004" {
//                       identifiers.append(notification.identifier)
//                    }
//                }
//                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//
//             }
//            self.title = "Mindful Reminder Removed"
//            self.message = "Please if you wish, you can set it again."
//            self.showingAlert = true
//            }) {
//                Text("Turn off Mindful Reminder").foregroundColor(.white).padding()
//            }
                
//            Button(action: {
//                do { try Auth.auth().signOut() }
//                   catch { print("already logged out") }
//                self.showingAlert = true
//                self.title = "Quit the app"
//                self.message = "Please close the app completely and re-enter to sign in. Otherwise you will not be able to use our therapies."
//                UserDefaults.standard.set(false, forKey: "introFinished")
//                UserDefaults.standard.set(false, forKey: "newUserAdd")
//            })
//            {
//                Text("Log out").foregroundColor(.white).padding()
//            }.padding(.trailing, 20)
//                NavigationLink(destination: PrivacyTerms())
//                {
//                    Text("Privacy Policy").foregroundColor(.white).padding()
//                }
//                NavigationLink(destination: TermsOfUse())
//                {
//                    Text("Terms of Use").foregroundColor(.white).padding()
//                }
//                VStack{
//                    Text("Contact us at admin@lifebeats.co").padding()
//                    Text("  Find out more at https://lifebeats.co").padding()
//                }
                
//                if(self.bedTimeReminder == false)
//                {
//                    self.removeBed()
//                }
//                if(self.mindfulnessReminder == false)
//                {
//                    self.removeMind()
//                }
//                if(self.notification == false)
//                {
//                    self.removeAll()
//                }
//                if(self.bedTimeReminder == true)
//                {
//                    self.requestNotification(notiNo: 2)
//                }
//                if(self.mindfulnessReminder == true)
//                {
//                    self.requestNotification(notiNo: 3)
//                }
//                if(self.notification == true)
//                {
//                    self.requestNotification(notiNo: 1)
//                }
                
        }
            .onChange(of: self.notification, perform: { value in
                print("11e")
                if(value == false)
                {
                    self.removeAll()
                }
                else if(value == true)
                {
                    self.requestNotification(notiNo: 1)
                }
            })
            
            .onChange(of: self.bedTimeReminder, perform: { value in
                print("11e")
                if(value == false)
                {
                    self.removeBed()
                }
                else if(value == true)
                {
                    self.requestNotification(notiNo: 2)
                }
            })
            
            .onChange(of: self.mindfulnessReminder, perform: { value in
                print("11e")
                if(value == false)
                {
                    self.removeMind()
                }
                else if(value == true)
                {
                    self.requestNotification(notiNo: 3)
                }
            })
//            .onReceive(timer){ _ in
//                
//                print(self.bedTimeReminder)
//                if self.timeRemaining > 0 {
//                    self.timeRemaining -= 1
//                }
//                else{
//                    print("11")
//                    if(self.notification == false)
//                    {
//                        self.removeAll()
//                        self.timeRemaining = 2
//                    }
//                    else if(self.notification == true)
//                    {
//            if(self.bedTimeReminder == false)
//            {
//                self.removeBed()
//                self.timeRemaining = 2
//            }
//                    else if(self.bedTimeReminder == true)
//                    {
//                        self.requestNotification(notiNo: 2)
//                        self.timeRemaining = 2
//                    }
//            if(self.mindfulnessReminder == false)
//            {
//                self.removeMind()
//                self.timeRemaining = 2
//            }
//            else if(self.mindfulnessReminder == true)
//            {
//                self.requestNotification(notiNo: 3)
//                self.timeRemaining = 2
//            }
//            if(self.notification == true)
//            {
//                self.requestNotification(notiNo: 1)
//                self.timeRemaining = 2
//            }
//                    }
//                }
// }
             Spacer()
                Text("Switch Language:")
                //Spacer()
                Button(action:{                                UserDefaults.standard.set("en", forKey: "lang")})
                {
                    Text("English").font(Font.custom("Nexa Bold", size: 16))
                }
                Button(action:{                                UserDefaults.standard.set("es", forKey: "lang")})
                {
                    Text("Spanish").font(Font.custom("Nexa Bold", size: 16))
                }
                Button(action:{                                UserDefaults.standard.set("id", forKey: "lang")})
                {
                    Text("Indonesian").font(Font.custom("Nexa Bold", size: 16))
                }
                Button(action:{                                UserDefaults.standard.set("zh-CN", forKey: "lang")})
                {
                    Text("Mandarin").font(Font.custom("Nexa Bold", size: 16))
                }
               // Spacer()
                Button(action: {
                    do { try Auth.auth().signOut() }
                       catch { print("already logged out") }
                    self.showingAlert = true
                    self.title = "Quit the app"
                    self.message = "Please close the app completely and re-enter to sign in. Otherwise you will not be able to use our therapies."
                    UserDefaults.standard.set(false, forKey: "introFinished")
                    UserDefaults.standard.set(false, forKey: "newUserAdd")
                })
                {
                    Text("Log out").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(.white).padding()
                }.padding(.trailing, 20)
                
                Button(action: {
                    self.deleteProfile()
                    do { try Auth.auth().signOut() }
                       catch { print("already logged out") }
                    self.showingAlert = true
                    self.title = "Done"
                    self.message = "Your data is deleted"
                    
                })
                {
                    Text("Delete my profile").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(.white).padding()
                }.padding(.trailing, 20)
//            .onReceive(timer) { _ in
//
//                print(self.notification)
//                if(self.bedTimeReminder == false)
//                {
//
//                    UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//                                    var identifiers: [String] = []
//                                    for notification:UNNotificationRequest in notificationRequests {
//                                        if notification.identifier == "0003" {
//                                           identifiers.append(notification.identifier)
//                                        }
//                                    }
//                                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//                                 }
//                    let docRef = self.db.collection("Users").document(self.uid!)
//                    docRef.getDocument { (document, error) in
//                        if let document = document, document.exists {
//                           // let docData = document.data()
//                            let ref = db.collection("Users").document(uid!).setData([ "setNoti" : false ], merge: true){ err in
//                                    if let err = err {
//                                        print("Error adding document: \(err)")
//                                    } else {
//                                        //print("Document added with ID: \(ref!.documentID)")
//                                        print("added")
//                                    }
//                                }
//
//                            //print(noti)
//                        }
//                        else {
//                            print("Document does not exist")
//                        }
//                    }
//                }
//                if(self.mindfulnessReminder == false)
//                {
//                    UNUserNotificationCenter.current().getPendingNotificationRequests { (notificationRequests) in
//                                    var identifiers: [String] = []
//                                    for notification:UNNotificationRequest in notificationRequests {
//                                        if notification.identifier == "0004" {
//                                           identifiers.append(notification.identifier)
//                                        }
//                                    }
//                                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: identifiers)
//                                 }
//                    let docRef = self.db.collection("Users").document(self.uid!)
//                    docRef.getDocument { (document, error) in
//                        if let document = document, document.exists {
//                           // let docData = document.data()
//                            let ref = db.collection("Users").document(uid!).setData([ "setNoti1" : false ], merge: true){ err in
//                                    if let err = err {
//                                        print("Error adding document: \(err)")
//                                    } else {
//                                        //print("Document added with ID: \(ref!.documentID)")
//                                        print("added")
//                                    }
//                                }
//
//                            //print(noti)
//                        }
//                        else {
//                            print("Document does not exist")
//                        }
//                    }
//                }
//                if(self.notification == false)
//                {
//                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests();
//                    let docRef = self.db.collection("Users").document(self.uid!)
//                    docRef.getDocument { (document, error) in
//                        if let document = document, document.exists {
//                           // let docData = document.data()
//                            let ref = db.collection("Users").document(uid!).setData([ "mainNoti" : false ], merge: true){ err in
//                                    if let err = err {
//                                        print("Error adding document: \(err)")
//                                    } else {
//                                        //print("Document added with ID: \(ref!.documentID)")
//                                        print("added1")
//                                    }
//                                }
//
//                            //print(noti)
//                        }
//                        else {
//                            print("Document does not exist")
//                        }
//                    }
//                }
//                if(self.bedTimeReminder == true)
//                {
//                    self.requestNotification(notiNo: 2)
//                }
//                if(self.mindfulnessReminder == true)
//                {
//                    self.requestNotification(notiNo: 3)
//                }
//                if(self.notification == true)
//                {
//                    self.requestNotification(notiNo: 1)
//                }
//            }

            }
            //.padding(.trailing, 30)
//            Button(action: {
//                do { try Auth.auth().signOut() }
//                   catch { print("already logged out") }
//                self.showingAlert = true
//                self.title = "Quit the app"
//                self.message = "Please close the app completely and re-enter to sign in. Otherwise you will not be able to use our therapies."
//                UserDefaults.standard.set(false, forKey: "introFinished")
//                UserDefaults.standard.set(false, forKey: "newUserAdd")
//            })
//            {
//                Text("Log out").foregroundColor(.white).padding()
//            }
//                NavigationLink(destination: PrivacyTerms())
//                {
//                    Text("Privacy Policy").foregroundColor(.white).padding()
//                }
//                NavigationLink(destination: TermsOfUse())
//                {
//                    Text("Terms of Use").foregroundColor(.white).padding()
//                }
//                VStack{
//                    Text("Contact us at admin@lifebeats.co").padding()
//                    Text("  Find out more at https://lifebeats.co").padding()
//                }
        }.environment(\.colorScheme, .dark)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(self.title), message: Text(self.message), dismissButton: .default(Text("Got it")))
                }
        .onAppear(perform: {
//            let docRef = self.db.collection("Users").document(self.uid!)
//            docRef.getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let docData = document.data()
//                    self.bedTimeReminder = docData!["setNoti"] as? Bool ?? false
//                    self.mindfulnessReminder = docData!["setNoti1"] as? Bool ?? false
//                    self.notification = docData!["mainNoti"] as? Bool ?? false
//                    //print(noti)
//                }
//                else {
//                    print("Document does not exist")
//                }
//            }
            print("eee")
        })
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
//        ProfileEditor(profile: .constant(.default))
        Text(" ")
    }
}
