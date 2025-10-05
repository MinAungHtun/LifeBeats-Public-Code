//
//  SpotifyPlaylistPlayer.swift
//  LifeBeats
//
//  Created by User on 11/19/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SpotifyPlaylistPlayer: View {
    var songName : String
    @State var name : String = " "
    var uri : String
    var image : UIImage
    @State var paused : Bool = false
    @State var start : Bool = true
    var appRemote: SPTAppRemote? {
        get {
            
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
                
        }
    }
    
    var defaultCallback: SPTAppRemoteCallback {
        get {
            return {[self] _, error in
                if let error = error {
                    print(error)
                }
            }
        }
    }
    
    var playerState: SPTAppRemotePlayerState?
    
    //@State var timeRemaining = 3
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View
    {
        ScrollView(.vertical, showsIndicators: false)
        {
        VStack{
        HStack(spacing: 30)
        {
            VStack{
                Text(self.songName).font(Font.custom("Nexa Bold", size: 16)).padding(.top, 5).padding(.trailing, 5).padding(.leading, 5)
                Image(uiImage: image).resizable().frame(width: 100, height: 100)
            VStack{
                Text(self.name).font(Font.custom("Nexa Bold", size: 12)).padding(.top, 5).padding(.trailing, 5).padding(.leading, 5)
            }
            
                HStack{
                    
//                    Button(action: {appRemote?.playerAPI?.seekBackward15Seconds(defaultCallback)
//                    })
//                    { Image(systemName: "backward.fill")}.padding()
                    
                    Button(action: {appRemote?.playerAPI?.skip(toPrevious: defaultCallback)
                    })
                    { Image(systemName: "backward.end.fill")}.padding()
                    
                    
                    if(self.start == true)
             {
                 Button(action:
                         {
                            self.start=false;self.paused=false;
                            GlobalPlayer.sharedInstance.spotify = true;
                             appRemote?.playerAPI?.play(self.uri, callback: defaultCallback)

                 })
                 {
                 Image(systemName: "play.fill")
                 }
                 .padding()
             }
                    else if(self.paused == true && self.start == false)
            {
                Button(action:
                        {
                            self.paused=false;
                            appRemote?.playerAPI?.resume(defaultCallback)

                })
                {
                Image(systemName: "play.fill")
                }
                .padding()
            }
                    else if(self.paused == false && self.start == false){
                Button(action: {self.paused=true;
                    appRemote?.playerAPI?.pause(defaultCallback)

            })
            {
            Image(systemName: "pause.fill")
            }
            .padding()
            }
                    Button(action: {appRemote?.playerAPI?.skip(toNext: defaultCallback)})
                        { Image(systemName: "forward.end.fill")}.padding()
                    
                    
                    
//                    Button(action: {appRemote?.playerAPI?.seekForward15Seconds(defaultCallback)})
//                        { Image(systemName: "forward.fill")}.padding()
  
            }
                
//            VStack
//            {
//                SpotifyVolumeSlider()
//            }
                
            }
        }
        .padding(.bottom, 15)
//        .onDisappear(perform:
//        {
//            appRemote?.playerAPI?.pause(defaultCallback)
//            print("SHITTT")
//        })
        
        SpotifyPlaylistTracks(playlistID: self.uri)
        }
        .onReceive(timer) { _ in
                        print(GlobalPlayer.sharedInstance.spotifySongName ?? "none")
            DispatchQueue.main.async {
                        self.name = GlobalPlayer.sharedInstance.spotifySongName
                            ?? " "}
                        if(self.name != " ")
                        {
                            self.start = false
                        }
        }
        }
    }
}

struct SpotifyPlaylistPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Text("nothing")
    }
}
