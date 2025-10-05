//
//  AppleMusicMainInterface.swift
//  LifeBeats
//
//  Created by User on 5/26/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import FirebaseAnalytics
import StoreKit
import MediaPlayer


struct applePlayer
{
    var appleMusicPlayer = MPMusicPlayerController.applicationMusicPlayer
    static let sharedInstance = applePlayer()
}

struct AppleMusicMainInterface: View {
    @State private var selection = 0
    @State private var musicPlayer = applePlayer.sharedInstance.appleMusicPlayer
    @State private var currentSong = Song(id: "", name: "", artistName: "", artworkURL: "")
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

    
    var body: some View {
        TabView(selection: $selection) {
            PlayerView(musicPlayer: self.$musicPlayer, currentSong: self.$currentSong)
            .tag(0)
                .tabItem {
                    VStack {
                        Image(systemName: "music.note")
                        Text("Player")
                    }
                }
            
            PlaylistView(musicPlayer: self.$musicPlayer, currentSong: self.$currentSong)
            .tag(1)
                .tabItem {
                    VStack {
                        Image(systemName: "music.note.list")
                        Text("All Songs")
                    }
                }
            
            SearchView(musicPlayer: self.$musicPlayer, currentSong: self.$currentSong)
            .tag(2)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                }
            }
        }.onAppear(perform: {
            appRemote?.playerAPI?.pause(defaultCallback)
            Analytics.setScreenName("Apple", screenClass: "Main")
            GlobalPlayer.sharedInstance.pauseBGMusic()
            appRemote?.disconnect()
            GlobalPlayer.sharedInstance.spotify = false
        })
        .accentColor(.pink)
    }}

struct AppleMusicMainInterface_Previews: PreviewProvider {
    static var previews: some View {
        AppleMusicMainInterface()
    }
}
