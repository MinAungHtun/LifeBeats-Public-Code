//  AppDelegate.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/1/20.
import UIKit
import Firebase
import FirebaseMessaging
import Purchases
import GoogleSignIn
import GoogleMobileAds
import Intents
import FacebookCore
import HealthKit
import BackgroundTasks

//!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate, ObservableObject {

    @Published var sleepFlag : Bool = false
    let gcmMessageIDKey = "gcmMessageID"
    @Published var versionIntro : Bool = false
    let healthStore = HKHealthStore()
    @Published var dayOftheWeek : String = " "
    @Published var BPM : String = " "
    @Published var dateFS : String = " "
    @Published var dateYFS : String = " "
    @Published var userName : String = "User"
    @Published var oldUser : Bool = true
    @Published var premium : Bool = false//false(production)
    @Published var uTime : Int = 0
    @Published var questionsAnswered : Bool = true
    @Published var totalMinutes : String = " "
    @Published var totalSessions : String = " "
    @Published var longestStreak : String = " "

  //  let locationManager = CLLocationManager()
    
    public var intent: ReviewTodayAchievementsIntent
    {
        let intent = ReviewTodayAchievementsIntent()
        intent.shortcutAvailability = .sleepMindfulness
        intent.suggestedInvocationPhrase = "Review today achievements"
        return intent
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        self.authorizeHealthKit()
        Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)
        //application.setMinimumBackgroundFetchInterval(900)
        //fatalError()
        UserDefaults.standard.set(0, forKey: "HKFinished")
        let user = Auth.auth().currentUser
        if let user = user {// The user's ID, unique to the Firebase project.// Do NOT use this value to authenticate with your backend server,
                              // if you have one. Use getTokenWithCompletion:completion: instead.
                              //self.authorizeHealthKit()
                              let uid = user.uid
                                UserDefaults.standard.set(uid, forKey: "UID")
                                if(uid == "cpniIN4n9hOa4hjurrdYzTVolrZ2" || uid == "rimRQ244sNdmsjBL4zHvSJjH94x1" || uid == "v84ZS9Xqp0ezwSe1Fe5rzSnZi7J3")
                                {
                                    self.premium = true
                                }
                                nextDay()
                                UserTimer.sharedInstance.timerStarts()
                                Purchases.debugLogsEnabled = true
                                Purchases.configure(withAPIKey: "FdZDlXwfNwZUaEzhmjFEDpLDmbpBdLVy", appUserID: uid)
                                Purchases.shared.purchaserInfo{(info, e) in
                                if(info?.entitlements["Premium"]?.isActive == true)
                                {
                                    self.premium = true
                                }
                                   // print(info!)
                                }
            
//            if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
//                let current = Date()
//                print("Date1 \(date)")
//                print("Date1 \(current)")
//                let diff1 = Calendar.current.dateComponents([.second], from: date, to: Date()).second
//               // print("diff1\(diff1! % 60)")
//                GlobalPlayer.sharedInstance.timeTilLife = TimeInterval(diff1! % 60)}
                                let db = Firestore.firestore()
                                let docRef = db.collection("Users").document(uid)
                                docRef.getDocument { (document, error) in
                                    if let document = document, document.exists {
                                        let docData = document.data()
                                        let name = docData!["name"] as! String
                                        let old = docData!["gameTuto"] as? Bool ?? true
                                        let occupation = docData!["occupation"] as! String
                                        let bedTimeReminder = docData!["setNoti"] as? Bool ?? false
                                        let mindfulnessReminder = docData!["setNoti1"] as? Bool ?? false
                                        let notification = docData!["mainNoti"] as? Bool ?? false
                                        self.versionIntro = docData!["1.3.3Introduced"] as? Bool ?? false
                                        //let lives = docData!["Lives"] as? Int ?? 5
                                        //let notification = docData!["mainNoti"] as? Bool ?? false
                                        UserDefaults.standard.set(name, forKey: "userName")
                                        UserDefaults.standard.set(occupation, forKey: "occupation")
                                        UserDefaults.standard.set(bedTimeReminder, forKey: "BTR")
                                        UserDefaults.standard.set(old, forKey: "gameTuto")
                                        UserDefaults.standard.set(mindfulnessReminder, forKey: "MFR")
                                        //UserDefaults.standard.set(lives, forKey: "Lives")
                                       // print("Date1 Lives\(lives)")
                                        //GlobalPlayer.sharedInstance.gameLives = lives
//                                        let earlyDate = Calendar.current.date(
//                                          byAdding: .hour,
//                                          value: -1,
//                                          to: Date())
//                                        UserDefaults.standard.set(earlyDate, forKey:"creationTime")
                                        UserDefaults.standard.set(notification, forKey: "noti")
//                                        if(notification == true)
//                                        {
//                                            self.requestNotification()
//                                        }
                                        self.questionsAnswered = true
                                        self.oldUser = true
                                    } else {
                                        self.questionsAnswered = false
                                        self.oldUser = false
                                        print("Document does not exist")
                                    }
                                }
            startUpBadgeCheck()
                            }
                            else{
                                self.oldUser = false
                                UserDefaults.standard.set(false, forKey: "BTR")
                                UserDefaults.standard.set(false, forKey: "MFR")
                                UserDefaults.standard.set(false, forKey: "noti")
                            }
       donatePlayRequestToSystem()
    //startUpBadgeCheck()
        //self.checkBadges()
        //donatePlayRequestToSystem1()
       requestNotification1()
        getDate()
        //locationManager.requestAlwaysAuthorization()
        let locale = Locale.current
        print("The country is")
        print(locale.regionCode ?? "zh")
        
        
        
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
          )
        } else {
          let settings: UIUserNotificationSettings =
            UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        Messaging.messaging().delegate = self
        
        
        
        
        ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
       //AppIntent.allowSiri()
       //AppIntent.todayAchievements()
        //INInteraction.deleteAll{error in if let error = error {print(error)}
        //else {print("deletion success")}}
        UIApplication.shared.isIdleTimerDisabled = true
//        UIApplication.shared.applicationIconBadgeNumber = 0
        
        return true
    }
    
    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
        ) -> Bool {

            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )

        }  
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
           return GIDSignIn.sharedInstance().handle(url)
       }
       
       func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
         // ...
         if let error = error {
           // ...
           print(error.localizedDescription)
           return
         }

         guard let authentication = user.authentication else { return }
         let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                           accessToken: authentication.accessToken)

           Auth.auth().signIn(with: credential) { (res, err) in
               
               if err != nil{
                   
                   print((err?.localizedDescription)!)
                   return
               }
               
               print("user=" + (res?.user.email)!)
            
           }
       }

       func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
           // Perform any operations when the user disconnects from app here.
           // ...
       }
    
    func donatePlayRequestToSystem() {
        let interaction = INInteraction(intent: intent, response: nil)
        /*
         Set the groupIdentifier to be the container's ID so that all interactions can be
         deleted with the same ID if the user deletes the container.
         */
        interaction.groupIdentifier = "01"
        interaction.donate { (error) in
            if error != nil {
                guard let error = error as NSError? else { return }
                print("Could not donate interaction %@ \(error)")
            } else {
                print("Play request interaction donation succeeded")
            }
        }
    }
    
//    func setUpMessaging()
//    {
//
//    }
    
    func registerBackgroundTasks() {
      // Declared at the "Permitted background task scheduler identifiers" in info.plist
      let backgroundMonitorTaskSchedulerIdentifier = "com.LifeBeatsInc.LifeBeats.heartRateMonitor"
      let backgroundProcessingTaskSchedulerIdentifier = "com.LifeBeatsInc.LifeBeats.heartRateProcessing"

      // Use the identifier which represents your needs
      BGTaskScheduler.shared.register(forTaskWithIdentifier: backgroundMonitorTaskSchedulerIdentifier, using: nil) { (task) in
         print("BackgroundAppMonitorTaskScheduler is executed NOW!")
         print("Background time remaining: \(UIApplication.shared.backgroundTimeRemaining)s")
         task.expirationHandler = {
           task.setTaskCompleted(success: false)
         }

         // Do some data fetching and call setTaskCompleted(success:) asap!
         let isFetchingSuccess = true
         task.setTaskCompleted(success: isFetchingSuccess)
       }
     }
    
    func scheduleAppRefresh() {
       let request = BGAppRefreshTaskRequest(identifier: "com.LifeBeatsInc.LifeBeats.heartRateMonitor")
       // Fetch no earlier than 15 minutes from now
       request.earliestBeginDate = Date(timeIntervalSinceNow: 5 * 60)
            
       do {
          try BGTaskScheduler.shared.submit(request)
       } catch {
          print("Could not schedule app refresh: \(error)")
       }
    }
    
    
    func startUpBadgeCheck()
    {
        BadgeLogic.sharedInstance.firstMed()
        BadgeLogic.sharedInstance.firstSleep()
        BadgeLogic.sharedInstance.countDF()
        BadgeLogic.sharedInstance.medMins()
        BadgeLogic.sharedInstance.loveThyselfReward()
        BadgeLogic.sharedInstance.officeMaestroReward()
        BadgeLogic.sharedInstance.studentLivingReward()
        BadgeLogic.sharedInstance.checkFinishedTherapies()
        BadgeLogic.sharedInstance.checkBadges()
        //self.checkBadges()
//        let db = Firestore.firestore()
//        let uid = UserDefaults.standard.string(forKey: "UID")
//        let ref1 = db.collection("Users").document(uid!).setData([ "lifebeatsLite" : true ], merge: true){ err in
//                    if let err = err {
//                        print("Error adding document: \(err)")
//                    } else {
//                        //print("Document added with ID: \(ref!.documentID)")
//                        print("added")
//                        self.checkBadges()
//                    }
//                }
    }
    
    func getDate()
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        let dayOfTheWeek = self.getDayOfWeek(result)!
        self.determineDay(dayOfTheWeek)
    }
    
    func nextWeekDate() -> Date
    {
        let calendar = Calendar.current
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
        return t6!
    }

    func weekCheckDate(today:Date)
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let oldWeek = docData!["nextWeekDate"] as! Timestamp
                let oldWeekDate: Date = oldWeek.dateValue()
                if(today >= oldWeekDate)
                {
                    print("a week")
                    BadgeLogic.sharedInstance.weeklyStats()
                    let nextW = self.nextWeekDate()
                    let ref = db.collection("Users").document(uid!).setData([ "nextWeekDate" : nextW ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }

                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    func checkBadges()
    {
        
        
        
        
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        
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
                UserDefaults.standard.set(b7, forKey: "b7")
                UserDefaults.standard.set(b8, forKey: "b8")
                UserDefaults.standard.set(b6, forKey: "b6")
                UserDefaults.standard.set(b2, forKey: "b2")
                UserDefaults.standard.set(b5, forKey: "b5")
                UserDefaults.standard.set(b1, forKey: "b1")
                UserDefaults.standard.set(b3, forKey: "b3")
                UserDefaults.standard.set(b4, forKey: "b4")
            }
            else {
                print("Document does not exist")
            }
        }
    }
    func trends()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let sessions = docData!["totalSessions"] as! Int
                let streak = docData!["consecutiveDays"] as! Int
                let sessionsString = String(sessions)
                let streakString = String(streak)
                self.totalSessions = sessionsString
                self.longestStreak = streakString
                UserDefaults.standard.set(sessionsString, forKey: "tSessions")
                UserDefaults.standard.set(streakString, forKey: "lStreak")
            }
            else {
                print("Document does not exist")
            }
        }
        let docRef1 = db.collection("UsageLog").document(uid!)
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let minutes = docData!["totalMinutes"] as! Int
                let minutesString = String(minutes)
                self.totalMinutes = minutesString
                UserDefaults.standard.set(minutesString, forKey: "totalMinutes")
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func addUsageTotalMinutes()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("UsageLog").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let minutes = docData!["totalMinutes"] as! Int
                self.uTime = UserDefaults.standard.integer(forKey: "usageTime")
                let ref = db.collection("UsageLog").document(uid!).setData([ "totalMinutes" : minutes+self.uTime ], merge: true) { err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                UserDefaults.standard.set(0, forKey: "usageTime")
                                self.trends()
                            }
                        }
            }
        }
    }
    
    func addMedAvg()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let oldTime = (docData!["meditationPerDay"] as! NSNumber).floatValue
                let timeSpent1 = (docData!["meditationPerWeek"] as! NSNumber).floatValue
                self.uTime = UserDefaults.standard.integer(forKey: "usageTime")
                if(timeSpent1 == 0.0)
                {
                    let ref = db.collection("Users").document(uid!).setData([ "meditationPerWeek" : oldTime ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                
                                let ref2 = db.collection("Users").document(uid!).setData([ "meditationPerDay" : 0.0 ], merge: true){ err in
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
                else{
                    let avg = (oldTime+timeSpent1)/2
                    let ref = db.collection("Users").document(uid!).setData([ "meditationPerWeek" : avg ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                
                                let ref2 = db.collection("Users").document(uid!).setData([ "meditationPerDay" : 0.0 ], merge: true){ err in
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
            }
        }
    }
    
    func nextDay()
    {
        let calendar = Calendar.current
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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: tomorrow!)
        let result1 = formatter.string(from: date)
        let result2 = formatter.string(from: yesterday!)
        UserDefaults.standard.set(result, forKey: "tomorrow")
        UserDefaults.standard.set(result1, forKey: "today")
        UserDefaults.standard.set(result2, forKey: "yesterday")
        self.dateFS = result1
        self.dateYFS = result2
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let oldTime = docData!["lastLoggedInDate"] as! String
                if(result1 != oldTime)
                {
                    BadgeLogic.sharedInstance.consecutiveWatsonUse(day: result2)
                    BadgeLogic.sharedInstance.checkFinishedTherapies()
                    //self.checkBadges()
                    self.addMedAvg()
                    //BadgeLogic.sharedInstance.checkLogin()
                    self.weekCheckDate(today: date)
                    if(oldTime == result2)
                    {
                        BadgeLogic.sharedInstance.recordConsec()
                    }
                    else if(oldTime != result2)
                    {
                        BadgeLogic.sharedInstance.resetStreak()
                    }
                    self.uTime = UserDefaults.standard.integer(forKey: "usageTime")
                    //self.recentlyUsed()
                    let ref = db.collection("UsageLog").document(uid!).setData([ self.dateYFS : self.uTime ], merge: true) { err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.addUsageTotalMinutes()
                                }
                            }
                    
                    let ref1 = db.collection("Users").document(uid!).setData([ "lastLoggedInDate" : self.dateFS ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
                }
                else if(result1 == oldTime)
                {
                    //self.maintainDefaults()
                    print("nothing")
                }
                
            } else {

                print("Document does not exist")
            }
        }
    }
    
    func determineDay(_ reference:Int)
    {
        if(reference == 1)
        {
            self.dayOftheWeek = "Sunday"
        }
        else if(reference == 2)
        {
            self.dayOftheWeek = "Monday"
        }
        else if(reference == 3)
        {
            self.dayOftheWeek = "Tuesday"
        }
        else if(reference == 4)
        {
            self.dayOftheWeek = "Wednesday"
        }
        else if(reference == 5)
        {
            self.dayOftheWeek = "Thursday"
        }
        else if(reference == 6)
        {
            self.dayOftheWeek = "Friday"
        }
        else if(reference == 7)
        {
            self.dayOftheWeek = "Saturday"
        }
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
    }
    
    func requestNotification()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            success, error in
            
            if success
            {
                print("Notification Done")
                self.scheduleNotification()
                let db = Firestore.firestore()
                let uid = UserDefaults.standard.string(forKey: "UID")
                let docRef = db.collection("Users").document(uid!)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                       // let docData = document.data()
                            let ref = db.collection("Users").document(uid!).setData([ "mainNoti" : true ], merge: true){ err in
                                    if let err = err {
                                        print("Error adding document: \(err)")
                                    } else {
                                        //print("Document added with ID: \(ref!.documentID)")
                                        print("added")
                                    }
                                }
                    }
                    else {
                        print("Document does not exist")
                    }
                }
            }
            else if let error=error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func requestNotification1()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            success, error in
            
            if success
            {
                print("Notification Done")
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
        registerCategories()
    }
    
    func registerCategories()
    {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        let show = UNNotificationAction(identifier: "show", title: "Tell me more", options: .foreground)
        let category = UNNotificationCategory(identifier: "alarm", actions: [show], intentIdentifiers: [])
        center.setNotificationCategories([category])
        
    }
    func authorizeHealthKit()
    {
//        let readData = Set([HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)])
//        let shareData = Set([HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)])
        let readData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!])
        let shareData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!])

        healthStore.requestAuthorization(toShare: shareData, read: readData) { (success, error) in
            if !success {
                // Handle the error here.
                print("unsuccessful")
            }
            else
            {
print("successful")
            }
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        let customData = userInfo["customData"] as? String
        if customData == "fizzbuzz"
        {
            print("Custom data received: \(customData ?? "1")")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
               // self.mindfulnessFlag = true
            print("something")
            case "show":
                //self.mindfulnessFlag = true
                print("Show more information")
            default:
                break
            }
        }
        else if customData == "buzzfizz"
        {
            print("Custom data received: \(customData ?? "2")")
            
            switch response.actionIdentifier {
            case UNNotificationDefaultActionIdentifier:
                //self.mindfulnessFlag = true
                print("3pm")
            case "show":
                //self.mindfulnessFlag = true
                print("Show more information")
            default:
                break
            }

        }
        withCompletionHandler()
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {

    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult)
                       -> Void) {
      // If you are receiving a notification message while your app is in the background,
      // this callback will not be fired till the user taps on the notification launching the application.
      // TODO: Handle data of notification

      // With swizzling disabled you must let Messaging know about the message, for Analytics
      // Messaging.messaging().appDidReceiveMessage(userInfo)

      // Print message ID.
      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      // Print full message.
      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }



}

extension AppDelegate : MessagingDelegate
{
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }

}

@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
                              withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions)
                                -> Void) {
    let userInfo = notification.request.content.userInfo

    // With swizzling disabled you must let Messaging know about the message, for Analytics
    // Messaging.messaging().appDidReceiveMessage(userInfo)

    // ...

    // Print full message.
    print(userInfo)
    //UIApplication.shared.applicationIconBadgeNumber = 1
    // Change this to your preferred presentation option
    completionHandler([[.alert, .sound]])
  }


}
