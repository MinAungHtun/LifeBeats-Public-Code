//
//  TimeAvg.swift
//  LifeBeats
//
//  Created by User on 7/17/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct TimeAvg: View {
    
    let db = Firestore.firestore()
    @State var dummy1 : Int = 0
    @State var dummy2 : Int = 0
    @State var dummy3 : Int = 0
    @State var dummy4 : Int = 0
    @State var dummy5 : Int = 0
    @State var dummy6 : Int = 0
    @State var dummy7 : Int = 0
    @State var dummy8 : Int = 0
    @State var dummy9 : Int = 0
    @State var dummy10 : Int = 0
    @State var dummy11 : Int = 0
    @State var dummy12 : Int = 0
    @State var dummy13 : Int = 0
    @State var dummy14 : Int = 0
    @State var dummy15 : Int = 0
    @State var dummy16 : Int = 0
    @State var dummy17 : Int = 0
    @State var dummy18 : Int = 0
    @State var dummy19 : Int = 0
    @State var dummy20 : Int = 0
    @State var dummy21 : Int = 0
    @State var dummy22 : Int = 0
    @State var dummy23 : Int = 0
    @State var dummy24 : Int = 0
    @State var dummy25 : Int = 0
    @State var dummy26 : Int = 0
    @State var dummy27 : Int = 0
    @State var dummy28 : Int = 0
    @State var dummy29 : Int = 0
    
    
    var body: some View {
        VStack(spacing: 20){
        
            Button(action:{retrieveStuff()}){
            Text("Full time Student")
            }
            
            Button(action:{retrieveStuff1()}){
            Text("Full time Employed")
            }
            
            Button(action:{retrieveStuff2()}){
            Text("Freelance")
            }
            
            Button(action:{retrieveStuff3()}){
            Text("Part time Student")
            }
            
            Button(action:{retrieveStuff4()}){
            Text("Part time Employed")
            }
        
            Button(action:{retrieveStuff5()}){
            Text("Prefer not to say")
            }
            
            Button(action:{retrieveStuff6()}){
            Text("Retired")
            }
            
        }

    }
    
    func retrieveStuff()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Full time Student").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                            
                        }
                        
                        
                    }
        }
    }
    
    func retrieveStuff1()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Full time Employed").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Meditation = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Focus = \(self.dummy3)")
                            

                        }
                        
                        
                    }
        }
    }
    
    func retrieveStuff2()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Freelance").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                           
                            
                        }
                        
                    }
        }
    }
    
    func retrieveStuff3()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Part time Student").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                            
                            
                        }
                        
                    }
        }
    }
    
    func retrieveStuff4()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Part time Employed").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                        }
                    }
        }
    }
    
    func retrieveStuff5()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Prefer not to say").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let dumm = document.data()["sleepPerWeek"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["meditationPerWeek"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["focusPerWeek"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                            
                        }
                                                
                    }
        }
    }
    
    func retrieveStuff6()
    {
        //let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users")
        
        docRef.whereField("occupation", isEqualTo: "Retired").getDocuments() { (querySnapshot, err) in
            if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            //print("\(document.documentID) => \(document.data())")
                            //print(document.data()["name"]!)
                            //print(document.documentID)
//                            let docRef1 = db.collection("Users").document(document.documentID)
//                            docRef1.getDocument { (document1, error) in
//                                if let document2 = document1, document2.exists {
//                                    let docData = document2.data()
//                                    //print(docData!["name"]!)
//                                    let name = docData!["Sleep"] as? Int ?? 0
//                                    if(name > 1)
//                                    {
//                                       // print("la la land")
//                                        print(document.data()["name"]!)
//                                    }
//                                } else {
//                                    print("Document does not exist")
//                                }
//                            }
                            let dumm = document.data()["Sleep"] as? Int ?? 0
                            self.dummy1 = dummy1+dumm
                            print("Sleep = \(self.dummy1)")
                            
                            let dumm2 = document.data()["Deep Focus"] as? Int ?? 0
                            self.dummy2 = dummy2+dumm2
                            print("Deep Focus = \(self.dummy2)")
                            
                            let dumm3 = document.data()["Meditation"] as? Int ?? 0
                            self.dummy3 = dummy3+dumm3
                            print("Meditation = \(self.dummy3)")
                            
                            let dumm4 = document.data()["On the go breathing"] as? Int ?? 0
                            self.dummy4 = dummy4+dumm4
                            print("On the go breathing = \(self.dummy4)")
                            
                            let dumm5 = document.data()["Mid day destress"] as? Int ?? 0
                            self.dummy5 = dummy5+dumm5
                            print("Mid day destress = \(self.dummy5)")
                            
                            let dumm6 = document.data()["Anger Management"] as? Int ?? 0
                            self.dummy6 = dummy6+dumm6
                            print("Anger Management = \(self.dummy6)")
                            
                            let dumm7 = document.data()["Anxiety Relief"] as? Int ?? 0
                            self.dummy7 = dummy7+dumm7
                            print("Anxiety Relief = \(self.dummy7)")
                            
                            let dumm8 = document.data()["End of day unwind"] as? Int ?? 0
                            self.dummy8 = dummy8+dumm8
                            print("End of day unwind = \(self.dummy8)")
                            
                            let dumm9 = document.data()["Post study unwind"] as? Int ?? 0
                            self.dummy9 = dummy9+dumm9
                            print("Post study unwind = \(self.dummy9)")
                            
                            let dumm10 = document.data()["Study break"] as? Int ?? 0
                            self.dummy10 = dummy10+dumm10
                            print("Study break = \(self.dummy10)")
                            
                            let dumm11 = document.data()["Approaching deadlines"] as? Int ?? 0
                            self.dummy11 = dummy11+dumm11
                            print("Approaching deadlines = \(self.dummy11)")
                            
                            let dumm12 = document.data()["Before a gathering"] as? Int ?? 0
                            self.dummy12 = dummy12+dumm12
                            print("Before a gathering = \(self.dummy12)")
                            
                            let dumm13 = document.data()["Gratitude"] as? Int ?? 0
                            self.dummy13 = dummy13+dumm13
                            print("Gratitude = \(self.dummy13)")
                            
                            let dumm14 = document.data()["Improving your focus"] as? Int ?? 0
                            self.dummy14 = dummy14+dumm14
                            print("Improving your focus = \(self.dummy14)")
                            
                            let dumm15 = document.data()["Seeking Balance"] as? Int ?? 0
                            self.dummy15 = dummy15+dumm15
                            print("Seeking Balance = \(self.dummy15)")
                            
                            let dumm16 = document.data()["Managing Exam Stress"] as? Int ?? 0
                            self.dummy16 = dummy16+dumm16
                            print("Managing Exam Stress = \(self.dummy16)")
                            
                            let dumm17 = document.data()["Before a large presentation"] as? Int ?? 0
                            self.dummy17 = dummy17+dumm17
                            print("Before a large presentation = \(self.dummy17)")
                            
                            let dumm18 = document.data()["Mindful Listening"] as? Int ?? 0
                            self.dummy18 = dummy18+dumm18
                            print("Mindful Listening = \(self.dummy18)")
                            
                            let dumm19 = document.data()["Anxiety Relief"] as? Int ?? 0
                            self.dummy19 = dummy19+dumm19
                            print("Anxiety Relief = \(self.dummy19)")
                            
                            let dumm20 = document.data()["Setting time boundaries"] as? Int ?? 0
                            self.dummy20 = dummy20+dumm20
                            print("Setting time boundaries = \(self.dummy20)")
                            
                            let dumm21 = document.data()["Desk Meditation"] as? Int ?? 0
                            self.dummy21 = dummy21+dumm21
                            print("Desk Meditation = \(self.dummy21)")
                            
                            let dumm22 = document.data()["Mindful Commuting"] as? Int ?? 0
                            self.dummy22 = dummy22+dumm22
                            print("Mindful Commuting = \(self.dummy22)")
                            
                            let dumm23 = document.data()["Quick Body Scan"] as? Int ?? 0
                            self.dummy23 = dummy23+dumm23
                            print("Quick Body Scan = \(self.dummy23)")
                            
                            let dumm24 = document.data()["Self Acceptance"] as? Int ?? 0
                            self.dummy24 = dummy24+dumm24
                            print("Self Acceptance = \(self.dummy24)")
                            
                            let dumm25 = document.data()["Dealing with physical pain"] as? Int ?? 0
                            self.dummy25 = dummy25+dumm25
                            print("Dealing with physical pain = \(self.dummy25)")
                            
                            let dumm26 = document.data()["Reducing Envy"] as? Int ?? 0
                            self.dummy26 = dummy26+dumm26
                            print("Reducing Envy = \(self.dummy26)")
                            
                            let dumm27 = document.data()["Full Body Scan"] as? Int ?? 0
                            self.dummy27 = dummy27+dumm27
                            print("Full Body Scan = \(self.dummy27)")
                            
                            let dumm28 = document.data()["Walking Meditation Guide"] as? Int ?? 0
                            self.dummy28 = dummy28+dumm28
                            print("Walking Meditation Guide = \(self.dummy28)")
                            
                            let dumm29 = document.data()["Thought Hunter"] as? Int ?? 0
                            self.dummy29 = dummy29+dumm29
                            print("Thought Hunter = \(self.dummy29)")
                            
                        }
//                        docRef.whereField("Sleep", isGreaterThan: 3).getDocuments() { (querySnapshot, err) in
//                            if let err = err {
//                                        print("Error getting documents: \(err)")
//                                    } else {
//                                        for document in querySnapshot!.documents {
//                                            //print("\(document.documentID) => \(document.data())")
//                                            print(document.data()["name"]!)
//
//                                        }
//
//                                    }
//                        }
                        
                        
                    }
        }
    }
}

struct TimeAvg_Previews: PreviewProvider {
    static var previews: some View {
        TimeAvg()
    }
}
