//
//  VersionIntro.swift
//  LifeBeats
//
//  Created by User on 5/2/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Firebase

struct VersionIntro: View {
    //@State var text : Int
   // @State var userName : String?
    @State var timeRemaining = 6
    let userName = UserDefaults.standard.string(forKey: "userName") ?? "User"
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    @Binding var dummyIB : Int
    @State var finished : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View
    {
        VStack(alignment: .leading){
            HStack {
                //FebeFace()
                if(self.timeRemaining > 4)
                {                //FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
                    Text("Hello there \(self.userName), we've got an awesome update for you.                                     ").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))//.padding(.leading, 55)
                    
                }}
            
            if(self.timeRemaining <= 4)
            {
            HStack {
                //FebeFace()
                if(self.timeRemaining > 2)
                {                //FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("We just launched a new game to help you relieve more stress and earn rewards!").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))//.padding(.leading, 60)
                    
                }}
            }
            
            if(self.timeRemaining <= 2)
            {
            HStack {
                //FebeFace()
                if(self.timeRemaining > 0)
                {              // FebeFace()
                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
                else{
            Text("Check it out on the Game icon on the bottom of the Home Screen.                                              ").font(Font.custom("Nexa Bold", size: 15)).padding().foregroundColor(.white).background(Color.gray)
                .clipShape(Bubble(chat:false))
                //.padding(.leading, 50)
                    
                }}
            }
            
//            if(self.timeRemaining <= 2)
//            {
//            HStack {
//                FebeFace()
//                if(self.timeRemaining > 0)
//                {      //          FebeFace()
//                    TypingAnimation().clipShape(Bubble(chat:false)).padding(.trailing, UIScreen.main.bounds.width - 150)}
//                else{
//
//            Text("You can find your earned coins on your Profile page, in your Trends section.").font(Font.custom("Nexa Bold", size: 16)).padding().foregroundColor(.white).background(Color.gray)
//                .clipShape(Bubble(chat:false))
//
//
//                }
//
//            }
//
//            }

            
            
        
        }
        .onAppear(perform: {
            
            let ref1 = self.db.collection("Users").document(self.uid).setData([ "1.9.1Introduced" : true ], merge: true){ err in
                        if let err = err {
                            print("Error adding document: \(err)")
                        } else {
                            //print("Document added with ID: \(ref!.documentID)")
                            print("added")
                        }
                    }
        })
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            else if (self.timeRemaining == 0 )//&& self.finished == true)
            {
                self.dummyIB = 1
            }
    
}
    }
}

struct VersionIntro_Previews: PreviewProvider {
    static var previews: some View {
//        VersionIntro()
        Text(" 3 ")
    }
}
