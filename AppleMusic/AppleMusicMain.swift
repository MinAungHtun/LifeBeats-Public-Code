//
//  AppleMusicMain.swift
//  LifeBeats
//
//  Created by User on 11/5/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import StoreKit
import MediaPlayer

struct AppleMusicMain: View {
    var body: some View {
        VStack{
            Button(action:{connectToAppleMusic()})
            {
        Text("Apple Music")
            }.padding()
            Button(action:{appleAccess()})
            {
        Text("Play Music")
            }.padding()
        }
//        .onAppear(perform: {
//            GlobalPlayer.sharedInstance.pauseBGMusic()
//        })
//        .onDisappear(perform: {
//            GlobalPlayer.sharedInstance.playBGMusic()
//        })
    }
    
    
    func connectToAppleMusic()
    {
//        guard SKCloudServiceController.authorizationStatus() == .notDetermined
//        else { return }
        
        SKCloudServiceController.requestAuthorization {(status: SKCloudServiceAuthorizationStatus) in
            switch status {
            case .denied, .restricted: noAccess()
            case .authorized: appleAccess()
            default: break
            }
        }
    }
    
    func appleAccess()
    {
        print("GOOD TO GO")
//        let musicPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
//        // Add a playback queue containing all songs on the device.
//        musicPlayer.setQueue(with: .songs())
//        // Start playing from the beginning of the queue.
//        musicPlayer.play()
        let mediaItems = MPMediaQuery.songs().items
        let mediaCollection = MPMediaItemCollection(items: mediaItems!)

        let player = MPMusicPlayerController.systemMusicPlayer
        player.setQueue(with: mediaCollection)
        player.play()
    }
    
    func noAccess()
    {
        print("Nah")
    }
}

struct AppleMusicMain_Previews: PreviewProvider {
    static var previews: some View {
        AppleMusicMain()
    }
}
