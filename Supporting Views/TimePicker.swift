//
//  TimePicker.swift
//  LifeBeats
//
//  Created by User on 9/12/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct TimePicker: View {
        
    @State var bedTime = Date()
    @State var calendar = Calendar.current
    func requestNotification()
    {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
        {
            success, error in
            
            if success
            {
                print("Notification Done")
                self.setNoti()
            }
            else if let error=error
            {
                print(error.localizedDescription)
            }
        }
    }
    
    func setNoti()
    {
        let hour = self.calendar.component(.hour, from: self.bedTime)
        let minute = self.calendar.component(.minute, from: self.bedTime)
        let second = self.calendar.component(.second, from: self.bedTime)

          //
            
            let db = Firestore.firestore()
            let uid = UserDefaults.standard.string(forKey: "UID")
            let docRef = db.collection("Users").document(uid!)
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
                                }
                            }
                    
                    let ref1 = db.collection("Users").document(uid!).setData([ "bedHr" : hour ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
                    
                    let ref2 = db.collection("Users").document(uid!).setData([ "bedMin" : minute ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
                    
                    let ref3 = db.collection("Users").document(uid!).setData([ "bedSec" : second ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                            }
                        }
                    
                    let ref4 = db.collection("Users").document(uid!).setData([ "sleepyHead" : true ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                BadgeLogic.sharedInstance.checkBadges()
                            }
                        }
                    

                    
                }
                else {
                    print("Document does not exist")
                }
            }
            
           //
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
    }
    
    var body: some View {
        NavigationView {
        VStack{
            
            Text("Would you like to set sleep reminder?").font(Font.custom("Nexa Bold", size: 16)).padding()
            
            Text("If you've already set it, you don't need to set it again unless you want to change it.").font(Font.custom("Nexa Bold", size: 16)).padding()
            
            
    DatePicker("", selection: $bedTime, displayedComponents: .hourAndMinute).labelsHidden()
            HStack
            {
                Button(action: self.requestNotification)
            {
                Text("Set sleep reminder").font(Font.custom("Nexa Bold", size: 16))
                    .padding()
                }.foregroundColor(.white)
                .background(Color.gray).clipShape(FeelingBubble()).padding(.top, 20)
            }
        }.padding(.bottom, 200)
        .onAppear(perform: {
            let hour = self.calendar.component(.hour, from: self.bedTime)
            let minute = self.calendar.component(.minute, from: self.bedTime)
            let second = self.calendar.component(.second, from: self.bedTime)
            print("\(hour):\(minute):\(second)")
        })
        }.environment(\.colorScheme, .dark)
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        TimePicker()
    }
}
