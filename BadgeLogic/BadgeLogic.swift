//Calculating for usser badges

import Foundation
import Firebase


class BadgeLogic
{
    static let sharedInstance = BadgeLogic()
    var achievement:String = " "
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")
    
    func checkBadges()
    {
        //let db = Firestore.firestore()
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
                let b9 = docData!["loveThyself"] as? Bool ?? false
                let b10 = docData!["officeMaestro"] as? Bool ?? false
                let b11 = docData!["aceThatTest"] as? Bool ?? false
                let b12 = docData!["dailyCheckIn"] as? Bool ?? false
                let b13 = docData!["sleepyHead"] as? Bool ?? false
                let b14 = docData!["firstSteps"] as? Bool ?? false
                UserDefaults.standard.set(b7, forKey: "b7")
                UserDefaults.standard.set(b8, forKey: "b8")
                UserDefaults.standard.set(b6, forKey: "b6")
                UserDefaults.standard.set(b2, forKey: "b2")
                UserDefaults.standard.set(b5, forKey: "b5")
                UserDefaults.standard.set(b1, forKey: "b1")
                UserDefaults.standard.set(b3, forKey: "b3")
                UserDefaults.standard.set(b4, forKey: "b4")
                UserDefaults.standard.set(b9, forKey: "b9")
                UserDefaults.standard.set(b10, forKey: "b10")
                UserDefaults.standard.set(b11, forKey: "b11")
                UserDefaults.standard.set(b12, forKey: "b12")
                UserDefaults.standard.set(b13, forKey: "b13")
                UserDefaults.standard.set(b14, forKey: "b14")
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    func loveThyselfReward()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["mindfulCommutingCompleted"] as? Bool ?? false
                let old1 = docData!["quickBodyScanCompleted"] as? Bool ?? false
                let old2 = docData!["selfAcceptanceCompleted"] as? Bool ?? false
                let old3 = docData!["Dealing with physical pain Completed"] as? Bool ?? false
                let old4 = docData!["Reducing Envy Completed"] as? Bool ?? false
                
                if(old == true && old1 == true && old2 == true && old3 == true && old4 == true)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "loveThyself" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                
                
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func officeMaestroReward()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["seekingBalanceCompleted"] as? Bool ?? false
                let old1 = docData!["beforeALargePresentationCompleted"] as? Bool ?? false
                let old2 = docData!["mindfulListeningCompleted"] as? Bool ?? false
                let old3 = docData!["settingTimeBoundariesCompleted"] as? Bool ?? false
                let old4 = docData!["deskMeditationCompleted"] as? Bool ?? false
                
                if(old == true && old1 == true && old2 == true && old3 == true && old4 == true)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "officeMaestro" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    func studentLivingReward()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["improvingYourFocusCompleted"] as? Bool ?? false
                let old1 = docData!["seekingBalanceCompleted"] as? Bool ?? false
                let old2 = docData!["managingExamStressCompleted"] as? Bool ?? false
                let old3 = docData!["postStudyUnwindCompleted"] as? Bool ?? false
                let old4 = docData!["studyBreakCompleted"] as? Bool ?? false
                
                if(old == true && old1 == true && old2 == true && old3 == true && old4 == true)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "aceThatTest" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    func checkLogin()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["consecutiveDays"] as! Int
                if(old >= 7)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "lifebeatsLite" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                
                if(old >= 30)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "lifebeatsPro" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func recordConsec()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["consecutiveDays"] as! Int
                let ref = self.db.collection("Users").document(self.uid!).setData([ "consecutiveDays" : old+1 ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                self.checkLogin()
                            }
                        }
            }
            else {
                print("Document does not exist")
            }
        }
        
        print(self.achievement)
    }
    
    func resetStreak()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let ref = self.db.collection("Users").document(self.uid!).setData([ "consecutiveDays" : 0 ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                //self.checkLogin()
                            }
                        }
            }
            else {
                print("Document does not exist")
            }
        }
        
        print(self.achievement)
    }
    
    func consecutiveWatsonUse(day:String)
    {
        let docRef = db.collection("UsageLog").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["\(day)Mood"] as? String ?? " "
                let old1 = docData!["consecWatson"] as? Int ?? 0
                if(old != " ")
                {
                
                if(old1 < 7)
                {
                    let ref = self.db.collection("UsageLog").document(self.uid!).setData([ "consecWatson" : old1+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    //self.checkLogin()
                                }
                    }
                }
                else if(old1 == 7)
                {
                let ref = self.db.collection("Users").document(self.uid!).setData([ "dailyCheckIn" : true ], merge: true){ err in
                            if let err = err {
                                print("Error adding document: \(err)")
                            } else {
                                //print("Document added with ID: \(ref!.documentID)")
                                print("added")
                                self.checkBadges()
                            }
                }
                    
                }
//                else if(old1 > 7)
//                {
//                    let ref = self.db.collection("UsageLog").document(self.uid!).setData([ "consecWatson" : 0 ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    //self.checkLogin()
//                                }
//                    }
//                }
                }
                else
                {
                    let ref = self.db.collection("Users").document(self.uid!).setData([ "dailyCheckIn" : false ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    
                                    let ref = self.db.collection("Users").document(self.uid!).setData([ "dailyCheckInCelebrated" : false ], merge: true){ err in
                                                if let err = err {
                                                    print("Error adding document: \(err)")
                                                } else {
                                                    //print("Document added with ID: \(ref!.documentID)")
                                                    print("added")
                                                    
                                                    
                                                    
                                                    
                                                    //self.checkBadges()
                                                    
                                                    
                                                    
                                                }
                                    }
                                    
                                    
                                    self.checkBadges()
                                    
                                    
                                    
                                }
                    }
                    
                    
                    let ref1 = self.db.collection("UsageLog").document(self.uid!).setData([ "consecWatson" : 0 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    //self.checkLogin()
                                }
                    }
                }
                
                
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    
    func firstMed()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["firstMedCompleted"] as? Bool ?? false
                if(old == true)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "mindfulBeginner" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    
    func firstSleep()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["firstSleepCompleted"] as? Bool ?? false
                if(old == true)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "lullaby" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func medMins()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["meditationMinutes"] as? Int ?? 0
                print("medMin")
                print(old)
                if(old >= 60)
                {
                    let ref = self.db.collection("Users").document(self.uid!).setData([ "mindfulVeteran" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                
                if(old >= 180)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "zenMaster" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func countDF()
    {
        let docRef = db.collection("Users").document(uid!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["noOfDeepFocus"] as? Int ?? 0
                print("noofD")
                print(old)
                if(old >= 3)
                {
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "inTheZone" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func weeklyStats()
    {
       // let docRef = db.collection("Users").document(uid!)
        
        let ref = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        //print("Document added with ID: \(ref!.documentID)")
                        print("added")
                    }
                }
        
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let old = docData!["focusPerWeek"] as! Int
//                if(old >= 3)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "inTheZone" : true ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                }
//                            }
//                }
//                else
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "inTheZone" : false ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                }
//                            }
//                }
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let old = docData!["sleepPerWeek"] as! Int
//                if(old >= 3)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "lullaby" : true ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                }
//                            }
//                }
//                else
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "lullaby" : false ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                }
//                            }
//                }
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let old = (docData!["meditationPerWeek"] as! NSNumber).floatValue
//                if(old >= 5.0)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "mindfulBeginner" : true ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//
//                                }
//                            }
//                }
//
//                if(old >= 10.0)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "mindfulVeteran" : true ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//                                }
//                            }
//                }
//
//                if(old >= 15.0)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "zenMaster" : true ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//                                }
//                            }
//                }
//
//                if(old < 5.0)
//                {
//                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "mindfulBeginner" : false ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//                                }
//                            }
//                }
//                if(old < 10.0)
//                {
//                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "mindfulVeteran" : false ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//                                }
//                            }
//                }
//                if(old < 15.0 )
//                {
//                    let ref3 = self.db.collection("Users").document(self.uid!).setData([ "zenMaster" : false ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
//                                    self.checkBadges()
//                                    let ref2 = self.db.collection("Users").document(self.uid!).setData([ "meditationPerWeek" : 0.0 ], merge: true){ err in
//                                                if let err = err {
//                                                    print("Error adding document: \(err)")
//                                                } else {
//                                                    //print("Document added with ID: \(ref!.documentID)")
//                                                    print("added")
//                                                }
//                                            }
//                                }
//                            }
//                }
//
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
        
        print(self.achievement)
    }
    
    func checkFinishedTherapies()
    {

        let docRef = db.collection("Users").document(uid!)
        //let badges = 0
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["5minsDestressCompleted"] as! Bool
                let old1 = docData!["angerManagementCompleted"] as! Bool
                let old2 = docData!["anxietyReliefCompleted"] as! Bool
                let old3 = docData!["approachingDeadlinesCompleted"] as! Bool
                let old4 = docData!["beforeAGatheringCompleted"] as! Bool
                let old5 = docData!["deepFocusCompleted"] as! Bool
                let old6 = docData!["endOfDayUnwindCompleted"] as! Bool
                let old7 = docData!["gratitudeCompleted"] as! Bool
                let old8 = docData!["improvingYourFocusCompleted"] as! Bool
                let old9 = docData!["meditationCompleted"] as! Bool
                let old10 = docData!["midDayDestressCompleted"] as! Bool
                let old11 = docData!["onTheGoBreathingCompleted"] as! Bool
                let old12 = docData!["postStudyUnwindCompleted"] as! Bool
                let old13 = docData!["preWorkOutPreparationCompleted"] as! Bool
                let old14 = docData!["sleepCompleted"] as! Bool
                let old15 = docData!["studyBreakCompleted"] as! Bool
                let old16 = docData!["curiosity"] as! Bool
                let old17 = docData!["selfAcceptanceCompleted"] as? Bool ?? false
                let old18 = docData!["quickBodyScanCompleted"] as? Bool ?? false
                let old19 = docData!["mindfulCommutingCompleted"] as? Bool ?? false
                let old20 = docData!["seekingBalanceCompleted"] as? Bool ?? false
                let old21 = docData!["deskMeditationCompleted"] as? Bool ?? false
                let old22 = docData!["settingTimeBoundariesCompleted"] as? Bool ?? false
                let old23 = docData!["mindfulListeningCompleted"] as? Bool ?? false
                let old24 = docData!["beforeALargePresentationCompleted"] as? Bool ?? false
                let old25 = docData!["managingExamStressCompleted"] as? Bool ?? false
                let old26 = docData!["Dealing with physical pain Completed"] as? Bool ?? false
                let old27 = docData!["Reducing Envy Completed"] as? Bool ?? false
                
                if(old16 == false)
                {
                if(old == true && old1 == true && old2 == true && old3 == true && old4 == true && old5 == true && old6 == true && old7 == true && old8 == true && old9 == true && old10 == true)
                {
                   if(old11 == true && old12 == true && old13 == true && old14 == true && old15 == true && old17 == true && old18 == true && old19 == true && old20 == true)
                   {
                    if (old21 == true && old22 == true && old23 == true && old24 == true && old25 == true && old26 == true && old27 == true)
                    {
                
                    let ref1 = self.db.collection("Users").document(self.uid!).setData([ "curiosity" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    print("added")
                                    self.checkBadges()
                                }
                            }
                }
                    }
                }
                }
            }
            else {
                print("Document does not exist")
            }
        }
        
        print(self.achievement)
    }
    
}
