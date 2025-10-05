//
//  globalMusicPlayer.swift
//  LifeBeats
//
//  Created by User on 9/20/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//
//let pathComponent = "pack\(self.packID)-\(selectRow + 1).mp4"
//let directoryURL: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//let folderPath: URL = directoryURL.appendingPathComponent("Downloads", isDirectory: true)
//let fileURL: URL = folderPath.appendingPathComponent(pathComponent)

import Foundation
import StoreKit
import GoogleMobileAds
import AVKit
import Firebase
import FirebaseStorage


class GlobalPlayer
{
    static let sharedInstance = GlobalPlayer()
    var player : AVAudioPlayer!
    var startoftheApp = true
    var introPlayer : AVAudioPlayer!
    var player1 : AVAudioPlayer!
    var player2 : AVAudioPlayer!
    var player3 : AVAudioPlayer!
    var player4 : AVAudioPlayer!
    var backgroundPlayer : AVAudioPlayer!
    var gameMusicPlayer : AVAudioPlayer!
    var playing = false
    var paused = false
    var spotify = false
    var appleMusic = false
    var gameSongURL : String = " "
    var spotifyPopup : Bool = false
    var therapySongURL : String?
    var downloadTask : StorageDownloadTask?
    var bgDownloadTask : StorageDownloadTask?
    var subURL1 : String?
    var subURL2 : String?
    var subURL3 : String?
    var subURL4 : String?
    var BGSelected : Bool = false
    var spotifySongName : String?
    var therapySongName : String?
    var gameSongName : String?
    var backgroundTrackURL : String?
    var backgroundTrackName : String?
    var backgroundVideoName : String?
    var introURL : String?
    var introName : String?
    var playingFreeBG : Bool = false
    var febeTrigged : Bool = false
    var febeIndx : Int = 17
    var gameLives: Int = 0
    var test : Bool = false
    var videoChangeBuffer : Bool = false
    var bgCategoryBuffer : Bool = false
    var categoryName : String?
    var finish = false
    var spotifyAuth = true
    var loopingPlayer = false
    var del = GlobalAVdelegate()
    var del1 = GlobalAVdelegate1()
    var del2 = GlobalAVdelegate2()
    var del3 = GlobalAVdelegate3()
    var del4 = GlobalAVdelegate4()
    var bgdel = GlobalAVdelegateBG()
    var gameMusicPlayerdel = GlobalAVdelegateGame()
    var introDel = GlobalAVdelegateIntro()
    let storage = Storage.storage(url:"gs://lifebeats-1.appspot.com/")
    var time: TimeInterval? //= 0.0
    var timeCG: CGFloat? //= 0.0
    var elaspedTime: TimeInterval?
    var timeTilLife: TimeInterval = 3600.0//= 0.0
    var popUpForBG : Bool = false
    var elapsedTimeCG: CGFloat? //= 0.0
    var volumeMain: CGFloat? = 195.0
    var volumeBG: CGFloat? = 195.0
    var coinReward: Bool = false
    var rewarded:GADRewardBasedVideoAd!
    var rewardedAd: GADRewardedAd?
    let adDelegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    var premium : Bool = false
    var firstEntry: Bool = true
    var fileURL:URL? 
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
    
    
//    var appRemote: SPTAppRemote? {
//        get {
//
//            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
//        }
//    }
    
//    func checkDownloadedTherapy()
//    {
//        let db = Firestore.firestore()
//        let uid = UserDefaults.standard.string(forKey: "UID")
//        let docRef = db.collection("Users").document(uid!)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let downloaded = docData!["\(self.therapySongName ?? " ")Downloaded"] as? Bool ?? false
//                if (downloaded == true)
//                {
//                    self.playDownloadedTherapy()
//                }
//                else if (downloaded == false)
//                {
//                    self.downloadTherapy1()
//                }
//                //print(noti)
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//    }
//
//    func checkDownloadedBG()
//    {
//        let db = Firestore.firestore()
//        let uid = UserDefaults.standard.string(forKey: "UID")
//        let docRef = db.collection("Users").document(uid!)
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let docData = document.data()
//                let downloaded = docData!["\(self.backgroundTrackURL ?? " ")Downloaded"] as? Bool ?? false
//                if (downloaded == true)
//                {
//                    self.playDownloadedBG()
//                }
//                else if (downloaded == false)
//                {
//                    self.downloadBG1()
//                }
//                //print(noti)
//            }
//            else {
//                print("Document does not exist")
//            }
//        }
//    }
    
    
    func shuffleIntro()
    {
        let number = Int.random(in: 1...4)
        if (number == 1)
        {
            self.introURL = "Intros/Intro 1.mp3"
            self.introName = "Intro1"
        }
       else if (number == 2)
        {
        self.introURL = "Intros/Intro 2.mp3"
        self.introName = "Intro2"
        }
       else if (number == 3)
        {
        self.introURL = "Intros/Intro 3.mp3"
        self.introName = "Intro3"
        }
       else if (number == 4)
        {
        self.introURL = "Intros/Intro 4.mp3"
        self.introName = "Intro4"
        }
        
    }
    
    func shuffleGameSong()
    {
        let number = Int.random(in: 1...3)
        if (number == 1)
        {
            if(self.gameSongName != "As the bird sings")
            {
            self.gameSongURL = "Game Songs/As the Bird Sings.mp3"
            self.gameSongName = "As the bird sings"
            playGameMusic()
            }
            else
            {
                self.gameSongURL = "Game Songs/The Goths.mp3"
                self.gameSongName = "The Goths"
                playGameMusic()
            }
        }
        else if (number == 2)
        {
            if(self.gameSongName != "Ninja Training Camp")
            {
            self.gameSongURL = "Game Songs/Ninja Training Camp.mp3"
            self.gameSongName = "Ninja Training Camp"
            playGameMusic()
            }
            else
            {
                self.gameSongURL = "Game Songs/As the Bird Sings.mp3"
                self.gameSongName = "As the bird sings"
                playGameMusic()
            }
        }
        else if (number == 3)
        {
            if(self.gameSongName != "The Goths")
            {
            self.gameSongURL = "Game Songs/The Goths.mp3"
            self.gameSongName = "The Goths"
            playGameMusic()
            }
            else
            {
                self.gameSongURL = "Game Songs/Ninja Training Camp.mp3"
                self.gameSongName = "Ninja Training Camp"
                playGameMusic()
            }
        }
    }
    
    func downloadGameMusic()
    {
        
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.gameSongURL)
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.gameSongName ?? " ")
        
        // Create local filesystem URL
        
        // Download to the local filesystem
        self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { //self.downloadTherapy1();
                    return  }
                self.gameMusicPlayer = try AVAudioPlayer(contentsOf: url)
                self.gameMusicPlayer.delegate = self.gameMusicPlayerdel
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                self.gameMusicPlayer.volume = 1
                self.gameMusicPlayer.play()
                //self.playDownloadedBG()
                            } catch {
                                print(error)
                            }
            }
          }
        }
        let observer = downloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }
    }
    
    func playGameMusic()
    {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.gameSongName ?? " ")
            guard let url = self.fileURL  else { self.downloadGameMusic(); return  }
            self.gameMusicPlayer = try AVAudioPlayer(contentsOf: url)
        self.gameMusicPlayer.delegate = self.gameMusicPlayerdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.gameMusicPlayer.volume = 1
            self.gameMusicPlayer.play()
        //self.playDownloadedBG()
        }
        catch
        {
            self.downloadGameMusic()
        }
        
        
    }
    
    func downloadTherapy1()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.therapySongURL!)
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.therapySongName ?? " ")
        
        // Create local filesystem URL
        
        // Download to the local filesystem
        self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { //self.downloadTherapy1();
                    return  }
                self.player = try AVAudioPlayer(contentsOf: url)
                self.player.delegate = self.del
                
                //self.playDownloadedBG()
                            } catch {
                                print(error)
                            }
            }
          }
        }
        let observer = downloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }
    }
    
    func downloadBG1()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
    let storageRef = storage.reference()
    let islandRef = storageRef.child(self.backgroundTrackURL ?? "Background Tracks/Nature/ES_Fire Campfire Cam 1 - SFX Producer.mp3")
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.backgroundTrackName ?? " ")
        
        // Download to the local filesystem
        self.bgDownloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { //self.downloadTherapy1();
                    return  }
                self.backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            self.backgroundPlayer.delegate = self.bgdel
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                    self.player.volume = 1
                self.backgroundPlayer.volume = 0.8
                self.backgroundPlayer.play()
                
                if(self.test == false)
                {
                self.player.play()
                }
               else if(self.test == true)
                {
                self.introPlayer.play()
                }
                self.downloadSecond()
                self.playing = true
                            } catch {
                                print(error)
                            }
            }
          }
        }
        
    let observer = bgDownloadTask!.observe(.progress)
    {
        snapshot in
        print(snapshot.progress!)
        
        if (snapshot.progress!.isFinished == true)
        {
            self.playing = true
        }
    }

    }
    
    func downloadBG2()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
    let storageRef = storage.reference()
    let islandRef = storageRef.child(self.backgroundTrackURL ?? "Background Tracks/Nature/ES_Fire Campfire Cam 1 - SFX Producer.mp3")
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.backgroundTrackName ?? " ")
        
        // Download to the local filesystem
        self.bgDownloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { self.downloadTherapy1(); return  }
                self.backgroundPlayer = try AVAudioPlayer(contentsOf: url)
                self.backgroundPlayer.delegate = self.bgdel
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                self.backgroundPlayer.volume = 0.8
                self.backgroundPlayer.play()
                
                            } catch {
                                print(error)
                            }
            }
          }
        }
        
    let observer = bgDownloadTask!.observe(.progress)
    {
        snapshot in
        print(snapshot.progress!)
    }

    }
    
    func changeBG()
    {
        self.bgDownloadTask?.cancel()
        if(self.appRemote?.isConnected == true)
        {
        appRemote?.playerAPI?.pause(defaultCallback)
        self.spotify = false
        self.spotifySongName = " ";
        }
        applePlayer.sharedInstance.appleMusicPlayer.stop()
        self.appleMusic = false
        if(self.backgroundPlayer != nil)
        {
        self.backgroundPlayer.stop()
        
        self.backgroundPlayer = nil
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.backgroundTrackName ?? " ")
            guard let url = self.fileURL  else { self.downloadBG2(); return  }
            self.backgroundPlayer = try AVAudioPlayer(contentsOf: url)
            self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.backgroundPlayer.play()
            self.playing = true
        }
        catch
        {
            self.downloadBG2()
        }
        }
        else if (self.backgroundPlayer == nil)
        {
            do{
                self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.backgroundTrackName ?? " ")
                guard let url = self.fileURL  else { self.downloadBG2(); return  }
                self.backgroundPlayer = try AVAudioPlayer(contentsOf: url)
                self.backgroundPlayer.delegate = self.bgdel
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                self.backgroundPlayer.play()
                self.playing = true
            }
            catch
            {
                self.downloadBG2()
            }
        }
        
    }
    func playDownloadedTherapy()
    {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.therapySongName ?? " ")
            guard let url = self.fileURL  else { self.downloadTherapy1(); return  }
            self.player = try AVAudioPlayer(contentsOf: url)
        self.player.delegate = self.del
        //self.playDownloadedBG()
        }
        catch
        {
            self.downloadTherapy1()
        }
    }
    
    
    func playDownloadedBG()
    {
        if(self.spotifyPopup == true)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.player.volume = 1
            if(self.test == false)
            {
            self.player.play()
            }
           else if(self.test == true)
            {
            self.introPlayer.play()
            }
            self.playing = true
            self.downloadSecond()
        }
        else if(self.spotifyPopup == false)
        {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.backgroundTrackName ?? " ")
            guard let url = self.fileURL  else { self.downloadBG1(); return  }
            self.backgroundPlayer = try AVAudioPlayer(contentsOf: url)
        self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
                self.player.volume = 1
            self.backgroundPlayer.volume = 0.8
            self.backgroundPlayer.play()
            if(self.test == false)
            {
            self.player.play()
            }
           else if(self.test == true)
            {
            self.introPlayer.play()
            }
            self.downloadSecond()
            self.playing = true
        }
        catch
        {
            self.downloadBG1()
        }
        }
    }
    
    
//    func test1()
//    {
//        storage.maxDownloadRetryTime = 2000
//        storage.maxOperationRetryTime = 2000
//        let storageRef = storage.reference()
//        let islandRef = storageRef.child("Quick Remedies/Post study unwind.mp3")
//        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("pUnwind")
//        // Download to the local filesystem
//        let downloadTask = islandRef.getData(maxSize: 10 * 1024 * 1024) { data, error in
//          if let error = error {
//            // Uh-oh, an error occurred!
//            print(error)
//          } else {
//            //print("success")
//            //print(data)
//            if let d = data{
//            do {
//                try d.write(to: self.fileURL!)
//                            } catch {
//                                print(error)
//                            }
//            }
//          }
//        }
//        let observer = downloadTask.observe(.progress)
//        {
//            snapshot in
//            print(snapshot.progress!)
//        }
//    }
//
//    func test2()
//    {
//        print(self.fileURL ?? "i")
//       guard let url = self.fileURL  else { print("blah"); return  }
//       // let fileUrl = URL(string: "ii")
//        do{
//            self.player = try AVAudioPlayer(contentsOf: url)
//        self.player.delegate = self.del
//        self.player.volume = 1
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
//            try AVAudioSession.sharedInstance().setActive(true)
//        } catch(let error) {
//            print(error.localizedDescription)
//        }
//            self.player.play()
//        }
//        catch(let error)
//        {
//            print ("111")
//            print(error.localizedDescription)
//        }
//    }
//
//    func test3()
//    {
//        print(self.fileURL ?? "i")
//       let url = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("pUnwind")
//       // let fileUrl = URL(string: "ii")
//        do{
//            self.player = try AVAudioPlayer(contentsOf: url)
//        self.player.delegate = self.del
//        self.player.volume = 1
//        do {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
//            try AVAudioSession.sharedInstance().setActive(true)
//        } catch(let error) {
//            print(error.localizedDescription)
//        }
//            self.player.play()
//        }
//        catch(let error)
//        {
//            print ("111")
//            print(error.localizedDescription)
//        }
//    }
    
    func playLocalBG()
    {
        if(self.spotifyPopup == false)
        {
        let url = Bundle.main.path(forResource: self.backgroundTrackURL, ofType: "mp3")
        
        self.backgroundPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
        self.backgroundPlayer.delegate = self.bgdel
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch(let error) {
            print(error.localizedDescription)
        }
            self.player.volume = 1
        self.backgroundPlayer.volume = 0.8
        self.backgroundPlayer.play()
        self.player.play()
        self.playing = true
        self.downloadSecond()
        }
        else if(self.spotifyPopup == true)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.player.volume = 1
            self.player.play()
            self.playing = true
            self.downloadSecond()
        }
        
        
    }
    
    func pauseBGMusic()
    {
        if(self.backgroundPlayer != nil)
        {
        self.backgroundPlayer.pause()
        }
        if(self.bgDownloadTask != nil)
        {
        self.bgDownloadTask!.pause()
        }
    }
    
    func playBGMusic()
    {
        if(self.backgroundPlayer != nil && self.paused == false)
        {
        self.backgroundPlayer.play()
        }
        if(self.bgDownloadTask != nil && self.paused == false)
        {
        self.bgDownloadTask!.resume()
        }
    }
    
    func playMusic()
    {
        self.player = nil
        self.backgroundPlayer = nil
        self.finish = false
//        if(self.therapySongName == "Gratitude")
//        {
//            let url = Bundle.main.path(forResource: "Ace your day - Gratitude", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Anger Management")
//        {
//            let url = Bundle.main.path(forResource: "Anger management", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Anxiety Relief")
//        {
//            let url = Bundle.main.path(forResource: "Anxiety Relief", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "On the go breathing")
//        {
//            let url = Bundle.main.path(forResource: "On the go breathing", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Study break")
//        {
//            let url = Bundle.main.path(forResource: "Study break", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "10 mins Deep Focus")
//        {
//            let url = Bundle.main.path(forResource: "10 min deep focus guide", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Sleep" || self.therapySongName == "15 mins Sleep")
//        {
//            let url = Bundle.main.path(forResource: "15 min sleep guide", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "10 mins Meditation")
//        {
//            let url = Bundle.main.path(forResource: "10 min meditation guide", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Unguided Meditation")
//        {
//            let url = Bundle.main.path(forResource: "10 min Theta binaural beats for Unguided Meditation", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Seeking Balance")
//        {
//            let url = Bundle.main.path(forResource: "Seeking balance in life", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
//        else if(self.therapySongName == "Managing Exam Stress")
//        {
//            let url = Bundle.main.path(forResource: "Managing exam stress", ofType: "mp3")
//            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
//            self.player.delegate = self.del
//            //self.downloadBGTrack()
//        }
        if(self.premium == false)
        {
            ads()
        }
        if(self.therapySongName == "30 mins Deep Focus")
        {
            self.test = false
            playIntroThirty()
        }
        else if(self.therapySongName == "Dealing with physical pain")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "Reducing Envy")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "10 min Deep Focus")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == " Sleep ")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "10 min Meditation")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "Full Body Scan")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "Walking Meditation Guide")
        {
            self.test = true
            playIntro()
        }
        else if(self.therapySongName == "Thought Hunter")
        {
            self.test = true
            playIntro()
        }
        else
        {
            self.test = false
            self.playDownloadedTherapy()
        }
    }
    
    
    func playIntro()
    {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.introName ?? " ")
            guard let url = self.fileURL  else { self.downloadIntro(); return  }
            self.introPlayer = try AVAudioPlayer(contentsOf: url)
        self.introPlayer.delegate = self.introDel
        //self.playDownloadedBG()
            self.playDownloadedTherapy()
        }
        catch
        {
            self.downloadIntro()
        }
    }
    
    func playIntroThirty()
    {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.introName ?? " ")
            guard let url = self.fileURL  else { self.downloadIntro(); return  }
            self.introPlayer = try AVAudioPlayer(contentsOf: url)
        self.introPlayer.delegate = self.introDel
        //self.playDownloadedBG()
            self.connectToStorageAndDownloadFirst()
        }
        catch
        {
            self.downloadIntroThirty()
        }
    }
    
    func downloadIntroThirty()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.introURL!)
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.introName ?? " ")
        
        // Create local filesystem URL
        
        // Download to the local filesystem
        self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { //self.downloadTherapy1();
                    return  }
                self.introPlayer = try AVAudioPlayer(contentsOf: url)
                self.introPlayer.delegate = self.introDel
                self.connectToStorageAndDownloadFirst()
                //self.playDownloadedBG()
                            } catch {
                                print(error)
                            }
            }
          }
        }
        let observer = downloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }

    }
    
    func downloadIntro()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.introURL!)
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.introName ?? " ")
        
        // Create local filesystem URL
        
        // Download to the local filesystem
        self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            // Uh-oh, an error occurred!
            print(error)
          } else {
            //print("success")
            //print(data)
            if let d = data{
            do {
                try d.write(to: self.fileURL!)
                guard let url = self.fileURL  else { //self.downloadTherapy1();
                    return  }
                self.introPlayer = try AVAudioPlayer(contentsOf: url)
                self.introPlayer.delegate = self.introDel
                self.playDownloadedTherapy()
                //self.playDownloadedBG()
                            } catch {
                                print(error)
                            }
            }
          }
        }
        let observer = downloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }

    }
    
    func stopMusic()
    {
        if(self.backgroundPlayer != nil)
        {
            self.backgroundPlayer.stop()
            self.backgroundPlayer = nil
            self.volumeBG = nil
            //self.playingFreeBG = false
        }
        if(self.downloadTask != nil)
        {
            self.downloadTask!.cancel()
            self.downloadTask = nil
            //self.playingFreeBG = false
        }
        if(self.bgDownloadTask != nil)
        {
            self.bgDownloadTask!.cancel()
            self.bgDownloadTask = nil
            //self.playingFreeBG = false
        }
            if(self.player != nil)
            {
        self.player.stop()
        self.playing = false
        self.player = nil
                self.volumeMain = nil
                self.finish = false
                self.playingFreeBG = false
                self.requestReview()
                if(self.premium == false)
                {
                    ads()
                    //videoAd()
                }
                //requestReview()
            }
           else if(self.player1 != nil)
            {
        self.player1.stop()
        self.playing = false
            self.player1 = nil
            self.volumeMain = nil
            self.finish = false
            self.requestReview()
            if(self.premium == false)
            {
                ads()}
            //requestReview()
            //self.playingFreeBG = false
            }
           else if(self.player2 != nil)
            {
        self.player2.stop()
        self.playing = false
            self.player2 = nil
            self.volumeMain = nil
            self.finish = false
            self.requestReview()
            //self.playingFreeBG = false
            if(self.premium == false)
            {
                ads()}
            //requestReview()
            }
           else if(self.player3 != nil)
            {
        self.player3.stop()
        self.playing = false
            self.player3 = nil
            self.volumeMain = nil
            self.finish = false
            self.requestReview()
//            self.playingFreeBG = false
            if(self.premium == false)
            {
                ads()}
//            requestReview()
            }
           else if(self.player4 != nil)
            {
        self.player4.stop()
        self.playing = false
            self.player4 = nil
            self.volumeMain = nil
            self.finish = false
            self.requestReview()
            //self.playingFreeBG = false
            if(self.premium == false)
            {
                ads()}
          //  requestReview()
            }
        
        if(self.appRemote?.isConnected == true)
        {
            appRemote?.playerAPI?.pause(defaultCallback)
            self.spotify = false
            GlobalPlayer.sharedInstance.spotifySongName = " ";
            self.finish = false
        }
        
        applePlayer.sharedInstance.appleMusicPlayer.stop()
            self.appleMusic = false
        
        if(self.introPlayer != nil)
        {
            if(self.introPlayer.isPlaying == true)
            {
                self.introPlayer.stop()
            }
            self.introPlayer = nil
        }
        self.player = nil
//        self.introPlayer = nil
        self.player1 = nil
        self.player2 = nil
        self.player3 = nil
        self.player4 = nil
        self.therapySongURL = nil
        self.subURL1 = nil
        self.subURL2 = nil
        self.subURL3 = nil
        self.subURL4 = nil
        self.playing = false
        self.paused = false
        self.test = false
        self.bgCategoryBuffer = false
        self.loopingPlayer = false
       // self.backgroundPlayer = nil
        //self.playingFreeBG = false
        //self.volumeBG = nil
        //self.volumeMain = nil
        self.finish = false
        self.BGSelected = false
        self.spotifyPopup = false
        self.popUpForBG = false
        //self.febeTrigged = false
        //self.febeIndx = 17
        saveTimeAvg()
    }
    
    func finishedTherapy()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        let durationFloat = Float(self.timeCG ?? 0.0)
        let elaspedFloat = Float(self.elapsedTimeCG ?? 0.0)
        let timeSpent = durationFloat-elaspedFloat
        if(timeSpent > 60)
        {
        if(categoryName == "Deep Focus")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "deepFocusCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(categoryName == "Sleep")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "sleepCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(categoryName == "Meditation")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "meditationCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "On the go breathing")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "onTheGoBreathingCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Mid day destress")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "midDayDestressCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Anger Management")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "angerManagementCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Anxiety Relief")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "anxietyReliefCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "End of day unwind")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "endOfDayUnwindCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Pre workout preparation")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "preWorkOutPreparationCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Post study unwind")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "postStudyUnwindCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "5 mins Destress")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "5minsDestressCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Study break")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "studyBreakCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Approaching deadlines")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "approachingDeadlinesCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Before a gathering")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "beforeAGatheringCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Gratitude")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "gratitudeCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Improving your focus")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "improvingYourFocusCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Seeking Balance")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "seekingBalanceCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Managing Exam Stress")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "managingExamStressCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Before a large presentation")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "beforeALargePresentationCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Mindful Listening")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "mindfulListeningCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Setting time boundaries")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "settingTimeBoundariesCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Desk Meditation")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "deskMeditationCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Mindful Commuting")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "mindfulCommutingCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Quick Body Scan")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "quickBodyScanCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else if(therapySongName == "Self Acceptance")
        {
        let ref1 = db.collection("Users").document(uid!).setData([ "selfAcceptanceCompleted" : true ], merge: true){ err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    //print("Document added with ID: \(ref!.documentID)")
                    print("added")
                }
            }
        }
        else
        {
            let ref1 = db.collection("Users").document(uid!).setData([ "\(therapySongName ?? "unknown") Completed" : true ], merge: true){ err in
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
    
    func requestReview()
    {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
    
    func videoAd()
    {
        self.rewarded = GADRewardBasedVideoAd()
        let req = GADRequest()
        self.rewarded.load(req, withAdUnitID: "ca-app-pub-2549645746750255/7262967641")
        if self.rewarded.isReady
        {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.rewarded.present(fromRootViewController: root!)
        }
    }
     
    func ads()
    {
        self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-2549645746750255/7262967641")
        self.rewardedAd?.load(GADRequest()) { error in
            if let error = error {
              // Handle ad failed to load case.
                print(error)
            } else {
                if self.rewardedAd?.isReady == true {
                    let root = UIApplication.shared.windows.first?.rootViewController
                    self.rewardedAd?.present(fromRootViewController: root!, delegate: self.adDelegate)
                }
            }
          }
    }
    
    func completedTime()
    {
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        
        if(self.categoryName == "Meditation")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["firstMedCompleted"] as? Bool ?? false
                    
                    if (oldTime == false)
                    {
                        let ref = db.collection("Users").document(uid!).setData([ "firstMedCompleted" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                    }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        else if(self.categoryName == "Deep Focus")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["noOfDeepFocus"] as? Int ?? 0
                    
                        let ref = db.collection("Users").document(uid!).setData([ "noOfDeepFocus" : oldTime+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        else if(self.categoryName == "Sleep")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["firstSleepCompleted"] as? Bool ?? false
                    
                    if(oldTime == false)
                    {
                    
                        let ref = db.collection("Users").document(uid!).setData([ "firstSleepCompleted" : true ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                    }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
    }
    
    func saveTimeAvg()
    {
        
        let durationFloat = Float(self.timeCG ?? 0.0)
        let elaspedFloat = Float(self.elapsedTimeCG ?? 0.0)
        let durationInt = Int(self.timeCG ?? 0)
        let elaspedInt = Int(self.elapsedTimeCG ?? 0)
        let timeSpentInt = durationInt-elaspedInt
        let timeSpent = durationFloat-elaspedFloat
        //let timeSpentInt = Int(timeSpent)
        let timeSpent1 = timeSpent/60
        let timeSpentInt1 = timeSpentInt/60
        let db = Firestore.firestore()
        let uid = UserDefaults.standard.string(forKey: "UID")
        let docRef = db.collection("Users").document(uid!)
        finishedTherapy()
        if(self.categoryName == "Meditation")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["meditationMinutes"] as? Int ?? 0
                    
                        let ref = db.collection("Users").document(uid!).setData([ "meditationMinutes" : oldTime+timeSpentInt ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        
        if(timeSpent > 30){
            
//            docRef.getDocument { (document, error) in
//                if let document = document, document.exists {
//                    let docData = document.data()
//                    let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
//
//                    let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt1 ], merge: true){ err in
//                                if let err = err {
//                                    print("Error adding document: \(err)")
//                                } else {
//                                    //print("Document added with ID: \(ref!.documentID)")
//                                    print("added")
////                                    self.timeCG = 0.0
////                                    self.elapsedTimeCG = 0.0
//                                }
//                            }
//                }
//                else {
//                    print("Document does not exist")
//                }
//            }
            
        if(self.categoryName == "Deep Focus")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["focusPerWeek"] as! Int
                    
                        let ref = db.collection("Users").document(uid!).setData([ "focusPerWeek" : oldTime+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    docRef.getDocument { (document, error) in
                                        if let document = document, document.exists {
                                            let docData = document.data()
                                            let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
                                            
                                            let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt1 ], merge: true){ err in
                                                        if let err = err {
                                                            print("Error adding document: \(err)")
                                                        } else {
                                                            //print("Document added with ID: \(ref!.documentID)")
                                                            print("added")
                                                           // self.timeCG = 0.0
                                                            //self.elapsedTimeCG = 0.0
                                                        }
                                                    }
                                        }
                                        else {
                                            print("Document does not exist")
                                        }
                                    }
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        else if(self.categoryName == "Sleep")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["sleepPerWeek"] as! Int
                    
                        let ref = db.collection("Users").document(uid!).setData([ "sleepPerWeek" : oldTime+1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    docRef.getDocument { (document, error) in
                                        if let document = document, document.exists {
                                            let docData = document.data()
                                            let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
                                            
                                            let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt1 ], merge: true){ err in
                                                        if let err = err {
                                                            print("Error adding document: \(err)")
                                                        } else {
                                                            //print("Document added with ID: \(ref!.documentID)")
                                                            print("added")
                        //                                    self.timeCG = 0.0
                        //                                    self.elapsedTimeCG = 0.0
                                                        }
                                                    }
                                        }
                                        else {
                                            print("Document does not exist")
                                        }
                                    }
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        else if(self.categoryName == "Meditation")
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = (docData!["meditationPerDay"] as! NSNumber).floatValue
                    if(oldTime == 0.0)
                    {
                        let ref = db.collection("Users").document(uid!).setData([ "meditationPerDay" : timeSpent1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    docRef.getDocument { (document, error) in
                                        if let document = document, document.exists {
                                            let docData = document.data()
                                            let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
                                            
                                            let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt1 ], merge: true){ err in
                                                        if let err = err {
                                                            print("Error adding document: \(err)")
                                                        } else {
                                                            //print("Document added with ID: \(ref!.documentID)")
                                                            print("added")
                                                           // self.timeCG = 0.0
                                                            //self.elapsedTimeCG = 0.0
                                                        }
                                                    }
                                        }
                                        else {
                                            print("Document does not exist")
                                        }
                                    }
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                    }
                    else{
                        let avg = oldTime+timeSpent1
                        let ref = db.collection("Users").document(uid!).setData([ "meditationPerDay" : avg ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                   // self.timeCG = 0.0
                                    //self.elapsedTimeCG = 0.0
                                }
                            }
                    }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        else
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
                    
                    let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt1 ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
//                                    self.timeCG = 0.0
//                                    self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }
        }
        else
        {
            docRef.getDocument { (document, error) in
                if let document = document, document.exists {
                    let docData = document.data()
                    let oldTime = docData!["\(self.therapySongName ?? "unknown")Time"] as? Int ?? 0
                    
                    let ref = db.collection("Users").document(uid!).setData([ "\(self.therapySongName ?? "unknown")Time" : oldTime+timeSpentInt ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added")
                                    //self.timeCG = 0.0
                                    //self.elapsedTimeCG = 0.0
                                }
                            }
                }
                else {
                    print("Document does not exist")
                }
            }
        }

    }
    
    func continueMusic()
    {
        if(self.downloadTask != nil)
        {
            self.downloadTask!.resume()
            self.playing = true
            self.paused = false
        }
        if(self.bgDownloadTask != nil)
        {
            self.bgDownloadTask!.resume()
            self.playing = true
            self.paused = false
        }
        if(self.backgroundPlayer != nil && self.spotify == false && self.appleMusic == false)
        {
        self.backgroundPlayer.play()
            self.playing = true
            self.paused = false
        }
        if(self.spotify == true && self.appRemote?.isConnected == true)
        {
            appRemote?.playerAPI?.resume(defaultCallback)
            self.playing = true
            self.paused = false
        }
        if(self.player != nil)
        {
            self.player.play()
            self.playing = true
            self.paused = false
        }
        else if(self.player1 != nil)
        {
            self.player1.play()
            self.playing = true
            self.paused = false
        }
        else if(self.player2 != nil)
        {
            self.player2.play()
            self.playing = true
            self.paused = false
        }
        else if(self.player3 != nil)
        {
            self.player3.play()
            self.playing = true
            self.paused = false
        }
        else if(self.player4 != nil)
        {
            self.player4.play()
            self.playing = true
            self.paused = false
        }
        if (applePlayer.sharedInstance.appleMusicPlayer.playbackState == .paused && self.spotify == false && self.appleMusic == true)
        {
            applePlayer.sharedInstance.appleMusicPlayer.play()
            //self.isPlaying = true
        }
    }
    
    func pauseMusic()
    {
        if(self.downloadTask != nil)
        {
            self.downloadTask!.pause()
            self.paused = true
        }
        if(self.bgDownloadTask != nil)
        {
            self.bgDownloadTask!.pause()
            self.paused = true
        }
        if(self.backgroundPlayer != nil)
        {
            if(self.backgroundPlayer.isPlaying == false)
            {
                appRemote?.playerAPI?.pause(defaultCallback)
                self.spotifySongName = " ";
                self.paused = true
                if applePlayer.sharedInstance.appleMusicPlayer.playbackState == .playing
                {
                applePlayer.sharedInstance.appleMusicPlayer.pause()
                }
            }
            else
            {
                self.backgroundPlayer.pause()
                self.paused = true
            }
        }
        if(self.introPlayer != nil)
        {
            if(self.introPlayer.isPlaying == true)
            {
                self.introPlayer.pause()
                self.paused = true
            }
        }
//        if(self.backgroundPlayer.isPlaying == false)
//        {
//            appRemote?.playerAPI?.pause(defaultCallback)
//            self.spotifySongName = " ";
//            self.paused = true
//        }
        if(self.appRemote?.isConnected == true)
        {
            appRemote?.playerAPI?.pause(defaultCallback)
            self.spotifySongName = " ";
            self.paused = true
        }
        if applePlayer.sharedInstance.appleMusicPlayer.playbackState == .playing
        {
        applePlayer.sharedInstance.appleMusicPlayer.pause()
        }
        if(self.player != nil)
        {
            self.player.pause()
            self.paused = true
        }
        else if(self.player1 != nil)
        {
            self.player1.pause()
            self.paused = true
        }
        else if(self.player2 != nil)
        {
            self.player2.pause()
            self.paused = true
        }
        else if(self.player3 != nil)
        {
            self.player3.pause()
            self.paused = true
        }
        else if(self.player4 != nil)
        {
            self.player4.pause()
            self.paused = true
        }
    }
    
    func changeBGTrackLocal()
    {
        self.bgDownloadTask?.cancel()
        if(self.appRemote?.isConnected == true)
        {
        appRemote?.playerAPI?.pause(defaultCallback)
        self.spotify = false
        self.spotifySongName = " ";
        }
        applePlayer.sharedInstance.appleMusicPlayer.stop()
        self.appleMusic = false
        if(self.backgroundPlayer != nil)
        {
        self.backgroundPlayer.stop()
        
        self.backgroundPlayer = nil
        
        let url = Bundle.main.path(forResource: self.backgroundTrackURL, ofType: "mp3")
        
        self.backgroundPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        
            self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
        
        self.backgroundPlayer.play()
        
        self.playing = true
        }
        else if(self.backgroundPlayer == nil)
        {
            let url = Bundle.main.path(forResource: self.backgroundTrackURL, ofType: "mp3")
            
            self.backgroundPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.backgroundPlayer.volume = 0.8
            
            self.backgroundPlayer.play()
            
            self.playing = true
        }
        else
        {
            return
        }

    }
    
    func changeBackGroundTrack()
    {
        self.bgDownloadTask?.cancel()
        if(self.appRemote?.isConnected == true)
        {
        appRemote?.playerAPI?.pause(defaultCallback)
        self.spotify = false
        self.spotifySongName = " ";
        }
        applePlayer.sharedInstance.appleMusicPlayer.stop()
        self.appleMusic = false
        if(self.backgroundPlayer != nil)
        {
        self.backgroundPlayer.stop()
        self.backgroundPlayer = nil
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.backgroundTrackURL ?? "Background Tracks/Nature/ES_Fire Campfire Cam 1 - SFX Producer.mp3")
        //Download into memory
        self.bgDownloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          }
          else
          {
            print("success")
            print(data!)
            self.backgroundPlayer = try! AVAudioPlayer(data:data!)
            self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.backgroundPlayer.play()
            self.playing = true
            self.bgDownloadTask = nil
          }
        }

        
            let observer = bgDownloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }
        }
        else if(self.backgroundPlayer == nil)
        {
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
            let storageRef = storage.reference()
            let islandRef = storageRef.child(self.backgroundTrackURL ?? "Background Tracks/Nature/ES_Fire Campfire Cam 1 - SFX Producer.mp3")
            //Download into memory
            self.bgDownloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              }
              else
              {
                print("success")
                print(data!)
                self.backgroundPlayer = try! AVAudioPlayer(data:data!)
                self.backgroundPlayer.delegate = self.bgdel
                do {
                    try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                    try AVAudioSession.sharedInstance().setActive(true)
                } catch(let error) {
                    print(error.localizedDescription)
                }
                self.backgroundPlayer.volume = 0.8
                self.backgroundPlayer.play()
                self.playing = true
                self.bgDownloadTask = nil
              }
            }

            
                let observer = bgDownloadTask!.observe(.progress)
            {
                snapshot in
                print(snapshot.progress!)
            }
        }
        else
        {
            return
        }
    }


    func connectToStorageAndDownloadFirst()
    {
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.therapySongURL!)
        //Download into memory
        self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          } else {

            print("success")
            print(data!)
            self.player = try! AVAudioPlayer(data:data!)
            self.player.delegate = self.del
            //self.downloadBGTrack()
            //self.downloadSecond()
            self.downloadTask = nil
          }
        }
        let observer = downloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }
        
    }
    
    func downloadBGTrack()
    {
        if(self.playingFreeBG == true)
        {
            self.playLocalBG()
        }
        else if(self.playingFreeBG == false)
        {
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.backgroundTrackURL ?? "Background Tracks/Nature/ES_Fire Campfire Cam 1 - SFX Producer.mp3")
        //Download into memory
        self.bgDownloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
          if let error = error {
            print(error)
          }
          else
          {
            print("success")
            print(data!)
            self.backgroundPlayer = try! AVAudioPlayer(data:data!)
            self.backgroundPlayer.delegate = self.bgdel
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
            self.player.volume = 1.0
            self.backgroundPlayer.volume = 0.8
            self.player.play()
            self.backgroundPlayer.play()
            self.downloadSecond()
            self.bgDownloadTask = nil
          }
        }
        let observer = bgDownloadTask!.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
            
            if (snapshot.progress!.isFinished == true)
            {
                self.playing = true
            }
        }
//        NotificationCenter.default.addObserver(forName: NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
//
//            self.finish = true
//            print("it's finished")
//        }
        }
    }
    
    func downloadSecond()
    {
        if(self.therapySongName == "30 mins Deep Focus")
        {
        if (self.subURL1 != nil)
        {
        print("2")
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
            let storageRef = storage.reference()
            let islandRef = storageRef.child(self.subURL1!)
            //Download into memory
            self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              } else {

                print("success")
                print(data!)
                self.player1 = try! AVAudioPlayer(data:data!)
                self.player1.delegate = self.del1
                self.player1.volume = 1.0
                self.player1.prepareToPlay()
                self.downloadThird()
              }
            }
            let observer = downloadTask!.observe(.progress)
            {
                snapshot in
                print(snapshot.progress!)
            }

        }
        else
        {
            return
        }
        }
        else
        { return }
        
    }
    
    func downloadThird()
    {
        if(self.subURL2 != nil)
        {
        print("3")
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
            let storageRef = storage.reference()
            let islandRef = storageRef.child(self.subURL2!)
            //Download into memory
            self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              } else {

                print("success")
                print(data!)
                self.player2 = try! AVAudioPlayer(data:data!)
                self.player2.delegate = self.del2
                self.player2.volume = 1.0
                self.player2.prepareToPlay()
                self.downloadFourth()
              }
            }
            let observer = downloadTask!.observe(.progress)
            {
                snapshot in
                print(snapshot.progress!)
            }

        }
        else
        {
            return
        }
    }
    
    func downloadFourth()
    {
        if(self.subURL3 != nil)
        {
        print("4")
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
            let storageRef = storage.reference()
            let islandRef = storageRef.child(self.subURL3!)
            //Download into memory
            self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              } else {

                print("success")
                print(data!)
                self.player3 = try! AVAudioPlayer(data:data!)
                self.player3.delegate = self.del3
                self.player3.volume = 1.0
                self.player3.prepareToPlay()
                self.downloadFifth()
              }
            }
            let observer = downloadTask!.observe(.progress)
            {
                snapshot in
                print(snapshot.progress!)
            }

        }
        else
        {
            return
        }
    }
    
    func downloadFifth()
    {
        if(self.subURL4 != nil)
        {
        print("5")
            storage.maxDownloadRetryTime = 2000
            storage.maxOperationRetryTime = 2000
            let storageRef = storage.reference()
            let islandRef = storageRef.child(self.subURL4!)
            //Download into memory
            self.downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
              if let error = error {
                print(error)
              } else {

                print("success")
                print(data!)
                self.player4 = try! AVAudioPlayer(data:data!)
                self.player4.delegate = self.del4
                self.player4.volume = 1.0
                self.player4.prepareToPlay()
              }
            }
            let observer = downloadTask!.observe(.progress)
            {
                snapshot in
                print(snapshot.progress!)
            }

        }
        else
        {
            return
        }
    }
}

class GlobalAVdelegate : NSObject,AVAudioPlayerDelegate{
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        print("first finished")
        
        GlobalPlayer.sharedInstance.player = nil
        if(GlobalPlayer.sharedInstance.player1 != nil)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
        GlobalPlayer.sharedInstance.player1.play()
        }
        else
        {
            GlobalPlayer.sharedInstance.backgroundPlayer.stop()
            GlobalPlayer.sharedInstance.backgroundPlayer = nil
            GlobalPlayer.sharedInstance.playing = false
            GlobalPlayer.sharedInstance.finish = true
            GlobalPlayer.sharedInstance.requestReview()
            GlobalPlayer.sharedInstance.saveTimeAvg()
            GlobalPlayer.sharedInstance.completedTime()
            GlobalPlayer.sharedInstance.coinReward = true
            if(self.premium == false){
                GlobalPlayer.sharedInstance.ads()
                
            }
        }
    }
}

class GlobalAVdelegate1 : NSObject,AVAudioPlayerDelegate{
    
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {

        print("second finished")
        
        GlobalPlayer.sharedInstance.player1 = nil
        if(GlobalPlayer.sharedInstance.player2 != nil)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
        GlobalPlayer.sharedInstance.player2.play()
        }
        else
        {
            GlobalPlayer.sharedInstance.backgroundPlayer.stop()
            GlobalPlayer.sharedInstance.backgroundPlayer = nil
            GlobalPlayer.sharedInstance.playing = false
            GlobalPlayer.sharedInstance.finish = true
            GlobalPlayer.sharedInstance.requestReview()
            GlobalPlayer.sharedInstance.saveTimeAvg()
            GlobalPlayer.sharedInstance.completedTime()
            if(self.premium == false){
                GlobalPlayer.sharedInstance.ads()
                
            }
        }
    }
}

class GlobalAVdelegate2 : NSObject,AVAudioPlayerDelegate{
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        print("third finished")
        
        GlobalPlayer.sharedInstance.player2 = nil
        if(GlobalPlayer.sharedInstance.player3 != nil)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
        GlobalPlayer.sharedInstance.player3.play()
        }
        else
        {
            GlobalPlayer.sharedInstance.backgroundPlayer.stop()
            GlobalPlayer.sharedInstance.backgroundPlayer = nil
            GlobalPlayer.sharedInstance.playing = false
            GlobalPlayer.sharedInstance.finish = true
            GlobalPlayer.sharedInstance.requestReview()
            GlobalPlayer.sharedInstance.saveTimeAvg()
            GlobalPlayer.sharedInstance.completedTime()
            if(self.premium == false){
                GlobalPlayer.sharedInstance.ads()
                
            }
        }
    }
}

class GlobalAVdelegate3 : NSObject,AVAudioPlayerDelegate{
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        print("fourth finished")
        
        GlobalPlayer.sharedInstance.player3 = nil
        if(GlobalPlayer.sharedInstance.player4 != nil)
        {
            do {
                try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
                try AVAudioSession.sharedInstance().setActive(true)
            } catch(let error) {
                print(error.localizedDescription)
            }
        GlobalPlayer.sharedInstance.player4.play()
        }
        else
        {
            GlobalPlayer.sharedInstance.backgroundPlayer.stop()
            GlobalPlayer.sharedInstance.backgroundPlayer = nil
            GlobalPlayer.sharedInstance.playing = false
            GlobalPlayer.sharedInstance.finish = true
            GlobalPlayer.sharedInstance.requestReview()
            GlobalPlayer.sharedInstance.saveTimeAvg()
            GlobalPlayer.sharedInstance.completedTime()
            if(self.premium == false){
                GlobalPlayer.sharedInstance.ads()
                
            }
        }
    }
}

class GlobalAVdelegate4 : NSObject,AVAudioPlayerDelegate{
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        GlobalPlayer.sharedInstance.player4 = nil
            GlobalPlayer.sharedInstance.backgroundPlayer.stop()
            GlobalPlayer.sharedInstance.backgroundPlayer = nil
        GlobalPlayer.sharedInstance.playing = false
        GlobalPlayer.sharedInstance.finish = true
        GlobalPlayer.sharedInstance.requestReview()
        GlobalPlayer.sharedInstance.saveTimeAvg()
        GlobalPlayer.sharedInstance.completedTime()
        GlobalPlayer.sharedInstance.coinReward = true
        if(self.premium == false){
            GlobalPlayer.sharedInstance.ads()
            
        }
       print("all finished")
    }
}


class GlobalAVdelegateBG : NSObject,AVAudioPlayerDelegate{

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch(let error) {
            print(error.localizedDescription)
        }
        GlobalPlayer.sharedInstance.backgroundPlayer.play()
    }
}

class GlobalAVdelegateGame : NSObject,AVAudioPlayerDelegate{

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch(let error) {
            print(error.localizedDescription)
        }
        GlobalPlayer.sharedInstance.shuffleGameSong()
    }
}



class GlobalAVdelegateIntro : NSObject,AVAudioPlayerDelegate{

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch(let error) {
            print(error.localizedDescription)
        }
        GlobalPlayer.sharedInstance.player.play()
    }
}
