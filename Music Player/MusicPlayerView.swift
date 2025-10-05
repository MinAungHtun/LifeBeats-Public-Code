//
//  MusicPlayer.swift
//  Music Player
//
//  Created on 06/03/20.
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.


import SwiftUI
import Firebase
import AVKit
import Foundation

struct MusicPlayerView: View {

    var body: some View {
//        MusicPlayer(therapy: song:"sleep-10-mins-delta", categoryName: "Fintess Prep", therapyName: "Deep Focus")
//                .frame(height: 300)
        Text(" ")
        
    }
}



struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView()
    }
}
//Timer to control and change to play when music is done.
struct MusicPlayer : View {
    
    //var therapy: Therapy
    @State var title = ""
    @State var playing = false
    @State var width : CGFloat = 0
    @State var song : String?
    @State var id : Int?
    @State var usageTherapy : Int = 0
    @State var categoryName : String
    @State var finish = false
    @State var showingBackgroundMusicEdit = false //true
    @State var therapyName : String
    @State var start : Bool = true
    @State var volume : Bool = false
    @State var share : Bool = false
    @State var showPicker = false
    @State var showFinish = false
    @State var showPicker1 = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var appRemote: SPTAppRemote? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
                
        }
    }
    
//    var widgetRemote: Bool? {
//        get {
//            
//            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.widgetFlag
//                
//        }
//    }
    
    
    var playerState: SPTAppRemotePlayerState?
    
    var defaultCallback: SPTAppRemoteCallback {
        get {
            return {[self] _, error in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
//    func logTherapy()
//    {
//        let db = Firestore.firestore()
//        let uid = UserDefaults.standard.string(forKey: "UID")
//
//        let docRef = db.collection("Users").document(uid!)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let totalSessions = docData?["totalSessions"] as? Int ?? 0
//                self.usageTherapy = docData?[self.therapyName] as? Int ?? 0
//                let ref = db.collection("Users").document(uid!).setData([ self.therapyName : self.usageTherapy+1 ], merge: true) { err in
//                            if let err = err {
//                                print("Error adding document: \(err)")
//                            } else {
//                                //print("Document added with ID: \(ref!.documentID)")
//                                print("added")
//                            }
//                        }
//                let ref1 = db.collection("Users").document(uid!).setData([ "totalSessions" : totalSessions+1 ], merge: true) { err in
//                            if let err = err {
//                                print("Error adding document: \(err)")
//                            } else {
//                                //print("Document added with ID: \(ref!.documentID)")
//                                print("added")
//                            }
//                        }
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    func shuffleDefaults()
    {
        if(self.id != 9999)
        {
        let recent1 = UserDefaults.standard.value(forKey: "recent1") as? Int
        let recent2 = UserDefaults.standard.value(forKey: "recent2") as? Int
        let recent3 = UserDefaults.standard.value(forKey: "recent3") as? Int
        let recent4 = UserDefaults.standard.value(forKey: "recent4") as? Int
        let recent5 = UserDefaults.standard.value(forKey: "recent5") as? Int
        
        if(self.id == recent1 || self.id == recent2 || self.id == recent3 || self.id == recent4 || self.id == recent5 )
        {
            UserDefaults.standard.set(recent1, forKey: "recent1")
            UserDefaults.standard.set(recent2, forKey: "recent2")
            UserDefaults.standard.set(recent3, forKey: "recent3")
            UserDefaults.standard.set(recent4, forKey: "recent4")
            UserDefaults.standard.set(recent5, forKey: "recent5")
        }
        else
        {
            UserDefaults.standard.set(self.id, forKey: "recent1")
            UserDefaults.standard.set(recent1, forKey: "recent2")
            UserDefaults.standard.set(recent2, forKey: "recent3")
            UserDefaults.standard.set(recent3, forKey: "recent4")
            UserDefaults.standard.set(recent4, forKey: "recent5")
            print("11111")
        }
        }
        else if(self.id == 9999)
        {
            return
        }
    }
    
    
    func recentlyPlayed()
    {
        if(self.id != 9999)
        {
        if let recent1 = UserDefaults.standard.value(forKey: "recent1") as? Int
        {
            print(recent1)
            self.shuffleDefaults()
        }
        else
        {
            if let recent2 = UserDefaults.standard.value(forKey: "recent2") as? Int
            {
                print(recent2)
                UserDefaults.standard.set(self.id, forKey: "recent1")
            }
            else
            {
                if let recent3 = UserDefaults.standard.value(forKey: "recent3") as? Int
                {
                    print(recent3)
                    UserDefaults.standard.set(self.id, forKey: "recent2")
                }
                else
                {
                    if let recent4 = UserDefaults.standard.value(forKey: "recent4") as? Int
                    {
                        print(recent4)
                        UserDefaults.standard.set(self.id, forKey: "recent3")
                    }
                    else
                    {
                        if let recent5 = UserDefaults.standard.value(forKey: "recent5") as? Int
                        {
                            print(recent5)
                            UserDefaults.standard.set(self.id, forKey: "recent4")
                        }
                        else
                        {
                            UserDefaults.standard.set(self.id, forKey: "recent5")
                            print("nothing at all")
                        }
                    }
                }
            }
        }
        }
    }
    
    
    var body : some View{
    
        
        
        if(self.share == false)
        {
        VStack(spacing: 10){
            
            if(self.volume == true)
            {
                Button(action:{self.volume = false}){Text("X").font(Font.custom("Nexa Bold", size: 18)).foregroundColor(Color.white).padding(.leading, 250)}
                //VolumeSlider()
                VolumeSlider1()
            }
            
            HStack(spacing: UIScreen.main.bounds.width / 4 - 50){
                
                
                Button(action:{self.showingBackgroundMusicEdit = true}){
                    Image(systemName:"music.note").foregroundColor(Color.white)
                    .font(.title)}
                
                Button(action:{self.volume = true}){
                    Image(systemName:"speaker.wave.2").foregroundColor(Color.white)
                    .font(.title)}

                if(self.start == true)
                {
                    Button(action: {
                        GlobalPlayer.sharedInstance.playMusic();
                        self.start = false
                        self.playing = true
                        GlobalPlayer.sharedInstance.paused=false
                        GlobalPlayer.sharedInstance.playing=true
                        GlobalPlayer.sharedInstance.therapySongName = self.therapyName
                        GlobalPlayer.sharedInstance.categoryName = self.categoryName
                    }) {
                
                        Image(systemName:  "play.fill")
                           .foregroundColor(Color.white) .font(.title)
                        
                    }.padding(.leading,15)
                }
                else if (self.playing == false)
                {
                    Button(action: {
                        GlobalPlayer.sharedInstance.continueMusic();
                        self.playing = true
                        GlobalPlayer.sharedInstance.paused=false
                        GlobalPlayer.sharedInstance.playing=true
                                }) {
                            
                                    Image(systemName:  "play.fill")
                                       .foregroundColor(Color.white) .font(.title)
                                    
                                }.padding(.leading,15)
                }
                else if (self.playing == true)
                {
                    Button(action: {
                        GlobalPlayer.sharedInstance.pauseMusic();
                        self.playing = false
                        GlobalPlayer.sharedInstance.paused=true
                        if(self.appRemote?.isConnected == true)
                        {
//                            if(self.playerState?.isPaused == false)
//                            {
                            self.appRemote?.playerAPI?.pause(defaultCallback)
                            //}
                        }
                                }) {
                            
                                    Image(systemName:  "pause.fill")
                                       .foregroundColor(Color.white) .font(.title)
                                    
                                }.padding(.leading,15)
                }
                Button(action:{
                    //self.share = true;
                    let url = URL(string: "https://www.lifebeats.co")
                    let av = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
                    
                    UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
                    
                }){
                    Image(systemName: "tray.and.arrow.up.fill").foregroundColor(Color.white)
                    .font(.title)}.padding(.leading,15)
                
            }.padding(.top, 10)
            .foregroundColor(.black)
            .onReceive(timer) { _ in
                if(GlobalPlayer.sharedInstance.paused == true)
                {
                self.playing = false
                }
                else if(GlobalPlayer.sharedInstance.paused == false)
                {
                self.playing = true
                }
                
                if(GlobalPlayer.sharedInstance.spotifyPopup == true)
                {
                    self.showingBackgroundMusicEdit.toggle()
                }
                if (GlobalPlayer.sharedInstance.finish == true)
                {
                    if(self.categoryName == "Sleep")
                    {
                        self.showPicker = true
                        self.showFinish = true
                        self.showingBackgroundMusicEdit = true
                    }
                    else if(self.categoryName == "Meditation")
                    {
                        self.showPicker1 = true
                        self.showFinish = true
                        self.showingBackgroundMusicEdit = true
                    }
                }
            }
            
            .onAppear(perform: {
                if(GlobalPlayer.sharedInstance.paused == true)
                {
                self.playing = false
                }
                else if(GlobalPlayer.sharedInstance.paused == false)
                {
                self.playing = true
                }
                    
                if(self.appRemote?.isConnected == false)
                {
                    GlobalPlayer.sharedInstance.playBGMusic()
                }
                if(self.categoryName == "Sleep")
                {
                    self.showPicker = true
                }
                else if(self.categoryName == "Meditation")
                {
                    self.showPicker1 = true
                }
                self.recentlyPlayed()
                
            })
//            if(self.widgetRemote == true)
//            {
//                Button(action:
//                        {
//                            print("0")
//                        })
//                {
//                    Text("Back to Home")
//                }
//            }
        }.padding()
        .padding(.top, -30)
        .environment(\.colorScheme, .dark)
                        .sheet(isPresented: $showingBackgroundMusicEdit)
                        {
                            if(self.showPicker == true && self.showFinish == true)
                            {
                                TimePicker().onDisappear(perform: {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                            else if(self.showPicker1 == true && self.showFinish == true)
                            {
                                TimePicker2().onDisappear(perform: {
                                    self.presentationMode.wrappedValue.dismiss()
                                })
                            }
                            else
                            {
                            BackgroundMusicEdit(category: self.categoryName, isPresented: self.$showingBackgroundMusicEdit).onAppear(perform: {
                                GlobalPlayer.sharedInstance.spotifyPopup = false
                            })
                                .onDisappear(perform: {
                                if(GlobalPlayer.sharedInstance.paused == true)
                                {
                                self.playing = false
                                }
                                else if(GlobalPlayer.sharedInstance.paused == false)
                                {
                                self.playing = true
                                }
                                
                            })
                            }

                        }
        }



        
//            .sheet(isPresented: $showingBackgroundMusicEdit)
//            {
//                BackgroundMusicEdit(category: self.categoryName, isPresented: self.$showingBackgroundMusicEdit).onDisappear(perform: {
//                    print("disappeared")
//                    self.playing = GlobalPlayer.sharedInstance.playing
//                })
//            }
        
    }
}

