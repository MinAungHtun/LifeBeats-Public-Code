//
//  Channels.swift
//  LifeBeats
//
//  Created by User on 8/11/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct Channels: View {
    
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    let groupName = "Lifebeats"
    let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
    let friendName = " "
    let friendID = " "
    @State var isMember:Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    
    func memberValidation()
    {
        let docRef1 = db.collection("Users").document(uid)
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                self.isMember = docData!["isMemberOf\(groupName)"] as? Bool ?? false
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func addFriend()
    {
        let docRef1 = db.collection("Users").document(uid)
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let noOfFri = docData!["numberOfFriends"] as? Int ?? 0
                
                let ref = self.db.collection("Users").document(uid).setData([ "friend\(String(noOfFri+1))" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                    
                                
                                    let ref1 = self.db.collection("Universal").document(friendID).setData([ "request" : userName ], merge: true){ err in
                                                    if let err = err {
                                                        print("Error adding document: \(err)")
                                                    } else {
                                                        //print("Document added with ID: \(ref!.documentID)")
                                                        print("added")
                                                      
                                                        let ref1 = self.db.collection("Universal").document(friendID).setData([ "unfinishedRequest" : 1 ], merge: true){ err in
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
            else {
                print("Document does not exist")
            }
        }
        
    }
    
    func friendRequest()
    {
        
        let docRef1 = db.collection("Universal").document(uid)
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
print("friendrequest")
            }
            else {
                print("Document does not exist")
            }
        }
    }
    
    func createGroupAndAdmin()
    {
                let ref = self.db.collection("Groups").document(groupName).setData([ "admin" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    let ref1 = self.db.collection("Groups").document(groupName).setData([ "member1" : userName ], merge: true){ err in
                                                    if let err = err {
                                                        print("Error adding document: \(err)")
                                                    } else {
                                                        //print("Document added with ID: \(ref!.documentID)")
                                                        print("added")
                                                        let ref2 = db.collection("Groups").document(groupName).setData([ "totalMembers" : 1 ], merge: true){ err in
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
    
    
    func registerMember()
    {
        let docRef = db.collection("Groups").document(groupName)
        //let groupName = "Lifebeats"
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let old = docData!["totalMembers"] as? Int ?? 0
                
                
                let ref = self.db.collection("Groups").document(groupName).setData([ "member\(String(old+1))" : userName ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    let ref1 = db.collection("Groups").document(groupName).setData([ "totalMembers" : old+1 ], merge: true){ err in
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
            else {
                print("Document does not exist")
            }
        }
        
        
        let docRef1 = db.collection("Users").document(uid)
        
        docRef1.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
               // let old = docData!["isMemberOf\(groupName)"] as? Bool ?? false
                
//                if(old == true)
//                {
                    let ref1 = self.db.collection("Users").document(self.uid).setData([ "isMemberOf\(groupName)" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                   // self.checkBadges()
                                }
                            }
                //}
                
                
                
            }
            else {
                print("Document does not exist")
            }
        }
        
        
        
    }
}

struct Channels_Previews: PreviewProvider {
    static var previews: some View {
        Channels()
    }
}
