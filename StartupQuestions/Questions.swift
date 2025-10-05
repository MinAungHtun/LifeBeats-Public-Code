//
//  Questions.swift
//  LifeBeats
//
//  Created by User on 10/8/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase
import Purchases

struct Questions: View {
    
    @State var page : Int = 1
    @State var uAlreadyExist : Bool = false
    @State var name : String = "nil"
    @State var ageRange : String = "nil"
    @State var occupation : String = "nil"
    let db = Firestore.firestore()
    
    
//    func requestNotification()
//    {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
//        {
//            success, error in
//
//            if success
//            {
//                print("Notification Done")
//                self.scheduleNotification()
//            }
//            else if let error=error
//            {
//                print(error.localizedDescription)
//            }
//        }
//    }
//
//    func scheduleNotification()
//       {
//
//           let content = UNMutableNotificationContent()
//           content.title = "Mindfulness Reminder"
//        content.body = "Start your day right, let's practice some mindfulness"
//        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData":"fizzbuzz"]
//           content.sound = UNNotificationSound.default
//
//
//           var dateComponents = DateComponents()
//           dateComponents.hour = 9
//           dateComponents.minute = 0
//           dateComponents.second = 0
//           dateComponents.nanosecond = 0
//
//           let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//        let request = UNNotificationRequest(identifier: "0001", content: content, trigger: trigger)
//           UNUserNotificationCenter.current().add(request)
//        print("NN")
//
//        let docRef = self.db.collection("Users").document(self.uid!)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//               // let docData = document.data()
//                let ref = db.collection("Users").document(uid!).setData([ "mainNoti" : true ], merge: true){ err in
//                        if let err = err {
//                            print("Error adding document: \(err)")
//                        } else {
//                            //print("Document added with ID: \(ref!.documentID)")
//                            print("added")
//                        }
//                    }
//
//                //print(noti)
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//        self.scheduleNotification1()
//       }
//
//    func scheduleNotification1()
//    {
//        let content = UNMutableNotificationContent()
//        content.title = "Need a break?"
//        content.body = "Grab a quick breather with Lifebeats to recharge yourself now"
//        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData":"buzzfizz"]
//        content.sound = UNNotificationSound.default
//        var dateComponents = DateComponents()
//        dateComponents.hour = 15
//        dateComponents.minute = 0
//        dateComponents.second = 0
//        dateComponents.nanosecond = 0
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//
//        let request = UNNotificationRequest(identifier: "0002", content: content, trigger: trigger)
//        UNUserNotificationCenter.current().add(request)
//        //delegate.registerCategories()
//    }
    
    private func sendName(name:String)
    {
        //print(name)
       // self.page = page + 1
        self.messageText = name
        if (self.messageText == "" || self.messageText == " " || self.messageText == "  " || self.messageText == "   " || self.messageText == "    " || self.messageText == "     ")
        {
            print("Nothing")
        }
        else
        {
            UserDefaults.standard.set(name, forKey: "userName")
            let uid = UserDefaults.standard.string(forKey: "UID")!
            let email = UserDefaults.standard.string(forKey: "email")
            self.name = name
            
            let docRef = db.collection("Users").document(uid)

            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    //print(docData!["name"]!)
                    let name = docData!["name"] as! String
                    UserDefaults.standard.set(name, forKey: "userName")
                    self.uAlreadyExist = true
                } else {
                    print("Document does not exist")
                }
            }
            
            self.page = page + 1
        }
    }
    
    func SIWAName()
    {
        let user = Auth.auth().currentUser
        if let user = user {
            self.name = user.displayName ?? "Friend"
            UserDefaults.standard.set(self.name, forKey: "userName")
        }
        self.page = page + 1
    }
    
    func addToDB(userAlreadyExist:Bool)
    {
       // print(userAlreadyExist)
        
        if(userAlreadyExist == false)
        {
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
            "ageRange": self.ageRange,
            "email": email ?? "nil",
            "name": self.name,
            "occupation": self.occupation,
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
                        UserDefaults.standard.set(self.occupation, forKey: "occupation")
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
        else
        {
            return
        }
    }
    @State var messageText = " "
    @State var tutorial : Bool? = false
    
    var body: some View {
        VStack{
            if(self.tutorial == false)
            {
        VStack{
            if(self.page == 1)
            {
                VStack{
                    Text("    Welcome to Lifebeats! \nIt's nice to have you with us.").font(Font.custom("Nexa Bold", size: 16)).padding()
                    Text("Please give a handle or nickname for yourself.").font(Font.custom("Nexa Bold", size: 16))
                Text("We have a social media/community feature.").font(Font.custom("Nexa Bold", size: 16))}
                HStack{
                    ChatTextField(sendAction: sendName)
//                    TextField("Your Name...", text: $messageText)
//                        .frame(width: 500, height: 200).padding(.leading, 20)

                    //.foregroundColor(.white).background(Color.gray)
                }
                
                VStack{
                    Button (action: { self.SIWAName();
                    }){
                    Text("Prefer not to").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                        .clipShape(FeelingBubble()).frame(width:150) }
                }
                //.background(Color.black)
            }
        if(self.page == 2)
            {
                VStack{
                    Text("Please select your age group").font(Font.custom("Nexa Bold", size: 16))}
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack(spacing: 0){
                        Button (action: {self.page = page + 1; self.ageRange = "13-18";
                        }){
                        Text("     13-18      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:150) }
                        Button (action: {self.page = page + 1; self.ageRange = "18-25";
                        }){
                        Text("    18-25      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:150) }
                        Button (action: {self.page = page + 1; self.ageRange = "25-45";
                        }){
                        Text("    25-45     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:150) }
                        
                        Button (action: {self.page = page + 1; self.ageRange = "45-65";
                        }){
                        Text("    45-65    ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:150) }
                        Button (action: {self.page = page + 1; self.ageRange = "65 and up";
                        }){
                        Text(" 65 and up ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:150) }
                    }
                    //.padding(.trailing, UIScreen.main.bounds.width - 150 )
                }.frame(width: UIScreen.main.bounds.width, height: 280).padding(.top, 50)
                                //.background(Color.black)
            }
          else  if(self.page == 3)
            {
                VStack{
                    Text("Please select your job description").font(Font.custom("Nexa Bold", size: 16))}.padding(.top, 50)
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack(spacing: 0){
                        Button (action: { self.tutorial = true; self.occupation = "Full time Employed";
                            self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("      Full time Employed       ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width: 250)}
                        Button (action: { self.tutorial = true;
                            self.occupation = "Part time Employed";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("      Part time Employed      ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Full time Student";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("      Full time Student          ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        
                        Button (action: { self.tutorial = true;
                            self.occupation = "Part time Student";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("      Part time Student         ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Freelance";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("             Freelance               ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Homemaker";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("           Homemaker             ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Stay at home parent";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("    Stay at home parent     ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Retired";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("               Retired                ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Unemployed";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("           Unemployed          ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                        Button (action: { self.tutorial = true;
                            self.occupation = "Prefer not to say";
                                self.addToDB(userAlreadyExist: uAlreadyExist)
                        }){
                        Text("       Prefer not to say       ").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
                            .clipShape(FeelingBubble()).frame(width:250) }
                    }
                    //.padding(.trailing, UIScreen.main.bounds.width - 200 )
                }
                .frame(width: UIScreen.main.bounds.width, height: 550).padding(.top, 20)
                //.background(Color.black)
            }
        }
            Spacer()
            VStack(alignment: .trailing)
        {
                HStack{
  //                  Text("\(self.page)/3").padding(.leading, -85)
                    ProgressBar(page: self.$page)
//                    if(self.page < 3 && self.page != 1)
//            {
//            Button (action: {
//                    self.page = page + 1
//            })
//            {
//                Text("Skip >").padding().foregroundColor(.white).background(Color.gray)
//                    .clipShape(FeelingBubble()).frame(width:90)
//            }
//            }
//            else if(self.page >= 3)
//            {
//                Button (action: {self.tutorial = true; self.addToDB(userAlreadyExist: uAlreadyExist)})
//                {
//                    Text("Skip/ \nFinish").padding().foregroundColor(.white).background(Color.gray)
//                        .clipShape(FeelingBubble()).frame(width:120, height: 120)
//                }
//            }
            }
            }
            //.padding(.bottom, -UIScreen.main.bounds.height )
            .padding(.leading, 20)
            .padding(.bottom, 50)
            //.background(Color.black)
            .onAppear(perform:
            {
                UserDefaults.standard.set(true, forKey: "newUserAdd")
            })
            
            }
            else if(self.tutorial == true)
            {
                SUTutorial()
            }
        }
    }
}

struct ProgressBar : View
{
    @Binding var page : Int
    var body: some View
    {
        ZStack(alignment: .leading)
        {
            
            ZStack
            {
                Capsule().fill(Color.black.opacity(0.1)).frame(height: 15)
            }
            
            if (self.page == 1)
            {
            Capsule().fill(Color.orange).frame(width:50, height: 15)
            }
            else if (self.page == 2)
            {
            Capsule().fill(Color.orange).frame(width:150, height: 15)
            }
            else if (self.page == 3)
            {
            Capsule().fill(Color.orange).frame(width:250, height: 15)
            }
        }
    }
}


struct Questions_Previews: PreviewProvider {
    static var previews: some View {
        Questions()
    }
}
