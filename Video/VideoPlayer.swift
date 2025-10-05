//
//  VideoPlayer.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.

//  Created by User on 3/7/20.


import SwiftUI
import AVKit
import Firebase

struct VideoPlayer1: View {
    @State var videoname: String
    let storage = Storage.storage(url:"gs://lifebeats-1.appspot.com/")
    @State var fileURL : URL?
    @State var fbURL : String = " "
    @State var ready : Bool = false
   // let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    func shuffleIntro()
    {
        let number = Int.random(in: 2...4) //
        if (number == 1)
        {
            self.fbURL = "ASMR/Video/Bubble Wrap ASMR.mp4"
            self.videoname = "Bubble Wrap"
            GlobalPlayer.sharedInstance.backgroundVideoName = "Bubble Wrap"
        }
       else if (number == 2)
        {
        self.fbURL = "ASMR/Video/Gift wrapping ASMR.mp4"
        self.videoname = "Gift Wrapping"
        GlobalPlayer.sharedInstance.backgroundVideoName = "Gift Wrapping"
        play()
        }
       else if (number == 3)
        {
        self.fbURL = "ASMR/Video/Soda Water ASMR.mp4"
        self.videoname = "Soda Water"
        GlobalPlayer.sharedInstance.backgroundVideoName = "Soda Water"
        play()
        }
       else if (number == 4)
        {
        self.fbURL = "ASMR/Video/Stone beach waves ASMR.mp4"
        self.videoname = "Stone Beach Waves"
        GlobalPlayer.sharedInstance.backgroundVideoName = "Stone Beach Waves"
        play()
        }
        
    }
    
    
    func checkBubbleWrap()
    {
        
        
    }
    
    func play()
    {
        do{
            self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.videoname ?? " ")
            guard let url = self.fileURL  else { self.downloadIntro(); return  }
           let introPlayer = try AVAudioPlayer(contentsOf: url)
            print("play")
            self.ready = true
        //self.introPlayer.delegate = self.introDel
        //self.playDownloadedBG()
          //  self.playDownloadedTherapy()
        }
        catch
        {
            self.downloadIntro()
            print("playintro")
        }
    }
    
    
    func downloadIntro()
    {
        print("intro")
        storage.maxDownloadRetryTime = 2000
        storage.maxOperationRetryTime = 2000
        let storageRef = storage.reference()
        let islandRef = storageRef.child(self.fbURL)
        self.fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(self.videoname ?? " ")
        
        // Create local filesystem URL
        
        // Download to the local filesystem
        let downloadTask = islandRef.getData(maxSize: 25 * 1024 * 1024) { data, error in
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
                //let introPlayer = try AVAudioPlayer(contentsOf: url)
                self.ready = true
               // self.introPlayer.delegate = self.introDel
                //self.playDownloadedTherapy()
                //self.playDownloadedBG()
                            } catch {
                                print(error)
                            }
            }
          }
        }
        let observer = downloadTask.observe(.progress)
        {
            snapshot in
            print(snapshot.progress!)
        }

    }
    
    
    
    
    var body: some View {

        
//        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//      let playerItem = AVPlayerItem(url: URL(fileURLWithPath: documentsPath.appendingFormat("/\(clipId).mp4")))
//      player = AVPlayer(playerItem: playerItem)
        
        VStack{
        if(self.ready == true)
        {
            player(name: videoname, fileURL: fileURL!).frame(width: UIScreen.main.bounds.width ,height:UIScreen.main.bounds.height)
            //VideoPlayer(player: AVPlayer(url: URL(fileURLWithPath: documentsPath.appendingFormat("/\(videoname).mp4"))))
        }
        }.onAppear(perform: {
            shuffleIntro()
            print("good")
        })
    }
}

//struct VideoPlayer_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoPlayer(videoname: "testing")
//    }
//}



struct player: UIViewControllerRepresentable
{
    var name:String
    var fileURL : URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<player>) -> AVPlayerViewController {

        let controller = AVPlayerViewController()
        //let path = Bundle.main.path(forResource: name, ofType:"mp4")
       // let playerItem = AVPlayerItem(url: fileURL)
        
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
              let playerItem = AVPlayerItem(url: URL(fileURLWithPath: documentsPath.appendingFormat("/\(name).mp4")))
              let videoPlayer = AVPlayer(playerItem: playerItem)
       // let videoPathURL =  URL(fileURLWithPath: fileURL.absoluteString)
        //let videoPlayer = AVPlayer(url: fileURL)
        videoPlayer.play()
        controller.player = videoPlayer
        return controller
    }
    
    
    
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<player>) {

    }



}
