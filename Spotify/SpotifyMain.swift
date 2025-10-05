//
//  SpotifyMain.swift
//  LifeBeats
//
//  Created by User on 7/19/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import FirebaseAnalytics

struct SpotifyMain: View {

    //let playURI = "spotify:track:0eXz8pS25MoeUguNPR9VvD"
    let playURI = ""
    @State var appRemoteConnected : Bool? = false
    var appRemote: SPTAppRemote? {
        get {

            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
        }
    }
 //   @State var timeRemaining = 2
    @State var time = 0
    @State var start : Bool = true
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        
        VStack{
            if(self.appRemoteConnected == false)
            {
                Button(action: spotifyConnect)
        {                               Image("Spotify").renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 2))
            .accessibility(label: Text("Spotify"))
        }
                Text("Click to authenticate").font(Font.custom("Nexa Bold", size: 16))
                
                Text("*First time authentication may require multiple time of click actions to wake up and establish a successful connection with Spotify and a crash.\n Disclaimer - Free Spotify users may experience playback and user experience issues").font(Font.custom("Nexa Bold", size: 9)).padding(.top, 100).padding()
            }
            else if(self.appRemoteConnected == true)
            {
                ScrollView(.vertical, showsIndicators: false) {
                VStack
                {
                    SpotifySearch()
                }.frame(height: UIScreen.main.bounds.height/2.5)
                VStack
                {
                    SpotifyContent()
                }
                }
            }
        }
        .onReceive(timer) { _ in
            self.time += 1
            
            if(self.time%3 == 0)
            {
                //print(self.time)
            if(self.start == false && appRemote?.isConnected == false)
            {
                appRemote?.authorizeAndPlayURI(self.playURI)
                //handle for case where there is no Spotifyapp installed
                appRemote?.connect()
            }
            }
                        self.appRemoteConnected = appRemote?.isConnected
            
        }
        .onAppear(perform: {
            Analytics.setScreenName("Spotify", screenClass: "Main")
            self.appRemoteConnected = appRemote?.isConnected
            GlobalPlayer.sharedInstance.pauseBGMusic()
            GlobalPlayer.sharedInstance.spotifySongName = " ";
            applePlayer.sharedInstance.appleMusicPlayer.stop()
            GlobalPlayer.sharedInstance.appleMusic = false
          //  GlobalPlayer.sharedInstance.spotifyAuth = true;
        })
    }

    func spotifyConnect()
    {
        self.start = false
        appRemote?.authorizeAndPlayURI(self.playURI)
        //handle for case where there is no Spotifyapp installed
        appRemote?.connect()
//        print(appRemote?.isConnected)
    }

}

struct SpotifyMain_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyMain()
    }
}
