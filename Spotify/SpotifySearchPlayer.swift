//
//  SpotifySearchPlayer.swift
//  LifeBeats
//
//  Created by User on 11/19/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SpotifySearchPlayer: View {
    var songName : String
    var artist : String
    var uri : String
    @State var paused : Bool = false
    @State var start : Bool = true
    var image : UIImage
    
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
    
    
    var body: some View
    {
            VStack{
                Image(uiImage: image).resizable().frame(width: 200, height: 200)
            VStack{
                Text(self.songName).font(Font.custom("Nexa Bold", size: 16)).padding(.top, 5).padding(.trailing, 5).padding(.leading, 5)
                Text(self.artist).font(Font.custom("Nexa Bold", size: 12))
            }
                HStack{
//                    Button(action: {appRemote?.playerAPI?.seekBackward15Seconds(defaultCallback)
//                    })
//                    { Image(systemName: "backward.fill")}.padding()
                    if(self.start == true)
             {
                 Button(action:
                         {
                            self.start=false;self.paused=false;
                            GlobalPlayer.sharedInstance.spotify = true;
                             appRemote?.playerAPI?.play(self.uri, callback: defaultCallback)
                            GlobalPlayer.sharedInstance.spotifySongName = " ";

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
//                    Button(action: {appRemote?.playerAPI?.seekForward15Seconds(defaultCallback)})
//                        { Image(systemName: "forward.fill")}.padding()
            }
            }
        .padding(.bottom, 15)
//        .onDisappear(perform:
//        {
//            appRemote?.playerAPI?.pause(defaultCallback)
//            print("SHITTT")
//        })
    }
}

struct SpotifySearchPlayer_Previews: PreviewProvider {
    static var previews: some View {
        Text("Nothing")
    }
}
