//
//  MusicStream.swift
//  LifeBeats
//
//  Created by User on 6/9/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import FirebaseStorage
import AVKit

struct MusicStream: View {
    
    @State var player : AVAudioPlayer!
    @State var player2 : AVAudioPlayer!
    @State var playing = false
    
    let storage = Storage.storage(url:"gs://lifebeats-1.appspot.com/")
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
    }
        .onAppear(perform: connectToStorageAndDownloadFirst)
        .onDisappear(perform: stopMusic)
    }
    
    func stopMusic()
    {
        if (self.playing == true)
        {
        self.player.stop()
            self.player2.stop()
        }
        self.player = nil
        self.player2 = nil
    }
    func connectToStorageAndDownloadFirst()
    {
        let storageRef = storage.reference()


        let islandRef = storageRef.child("Quick Remedies/4 min on the go breathing guide.mp3")
        //Download into memory
       let downloadTask = islandRef.getData(maxSize: 50 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          } else {

            print("success")
            print(data!)
            self.player = try! AVAudioPlayer(data:data!)
            downloadBGTrack()

          }
        }
        let observer = downloadTask.observe(.progress) { snapshot in
            print(snapshot.progress!)
        }
    }
    func downloadBGTrack()
    {
        let storageRef = storage.reference()
        let islandRef = storageRef.child("Background Tracks/Nature/ES_Rain Forest Steady - SFX Producer.mp3")
        //Download into memory
       let downloadTask = islandRef.getData(maxSize: 50 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          } else {

            print("success")
            print(data!)
            self.player2 = try! AVAudioPlayer(data:data!)
            do {
               try AVAudioSession.sharedInstance().setCategory(.playback)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.player.play()
            self.player2.play()
            self.playing = true

          }
        }
        let observer = downloadTask.observe(.progress) { snapshot in
            print(snapshot.progress!)
        }
    }
}

struct MusicStream_Previews: PreviewProvider {
    static var previews: some View {
        MusicStream()
    }
}
