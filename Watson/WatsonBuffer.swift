//
//  WatsonBuffer.swift
//  LifeBeats
//
//  Created by User on 4/7/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

struct WatsonBuffer: View {
    
    @State var evening : Bool?
    @State var febeIntro : Bool? = true
    let number = Int.random(in: 1...2)
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
   // @State var number : Int?
    
    var body: some View {
        VStack{
        if(self.febeIntro == false)
        {
            WatsonIntroExisting()
        }
       else if(number == 1)
        {
//WatsonWithQuiz()
           WatsonView()
        }
        else if(number == 2 && self.evening == false)
        {
WatsonWithQuiz()
            //WatsonView()
        }
        else
        {
           //WatsonWithQuiz()
             WatsonView()
        }
        }
        .onAppear(perform: {
            let docRef = self.db.collection("Users").document(self.uid)
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    self.febeIntro = docData!["febeIntroduced"] as? Bool ?? false
                    //print(noti)
                }
                else {
                    print("Document does not exist")
                }
            }
            
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["WatsonUse"] as? Int ?? 0
                    
                    let ref = db.collection("Users").document(uid).setData([ "WatsonUse" : oldTime+1 ], merge: true){ err in
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
                else {
                    print("Document does not exist")
                }
            }
           // self.number = Int.random(in: 1...2)
            print(evening)
            print(number)
            Analytics.setScreenName("Watson", screenClass: "Main")
        })
        //.navigationBarTitle("Febe")
    
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
}

struct WatsonBuffer_Previews: PreviewProvider {
    static var previews: some View {
        WatsonBuffer()
    }
}
