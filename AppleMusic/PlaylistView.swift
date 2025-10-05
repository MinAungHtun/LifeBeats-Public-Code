//
//  PlaylistView.swift
//  LifeBeats
//
//  Created by User on 6/5/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
// GET https://api.music.apple.com/v1/me/library/playlists

import SwiftUI
import StoreKit
import MediaPlayer
import SDWebImageSwiftUI

struct PlaylistView: View {
    
    let developerToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IldKVFlBNkw5MzMifQ.eyJpc3MiOiJaMzI1OUdMQjRYIiwiZXhwIjoxNjM4MDQ5Nzg0LCJpYXQiOjE2MjIyODE3ODR9.KbX0Hg8VJDHdEy29xJDwrnyr_FO507zeQclW5NFOUs8uLvZ6o7W74V8E2-06DQngpiA_aHQGcPb6X_yeKzTo8A"
    @State private var searchText = ""
    @State  var userToken: String = " "
    @State  var storeFrontID: String = " "
    @State  var searching = 0
    @State private var searchResults = [Song]()
    @Binding var musicPlayer: MPMusicPlayerController
    @Binding var currentSong: Song

    
    var body: some View {
        
        VStack{
            if(self.searching == 0)
            {
        Text("You don't have any songs in your library or haven't synced yet.").onAppear(perform: {
            DispatchQueue.main.async {
                sendKey()}
            self.musicPlayer.stop()
            self.currentSong = Song(id: "", name: "", artistName: "", artworkURL: "")
        })
            }
        
        
        List {
            ForEach(searchResults, id:\.id) { song in
                HStack {
                    WebImage(url: URL(string: song.artworkURL.replacingOccurrences(of: "{w}", with: "80").replacingOccurrences(of: "{h}", with: "80")))
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(5)
                        .shadow(radius: 2)

                    VStack(alignment: .leading) {
                        Text(song.name)
                            .font(.headline)
                        Text(song.artistName)
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    Spacer()//i.LVk6rQWTZLGmdV3 i.PkdZ7AaUPEbqRoM
                    Button(action: {
                        self.currentSong = song
                       // let mplayer = MPMusicPlayerApplicationController.applicationQueuePlayer
                        
                        //let descriptor:MPMusicPlayerStoreQueueDescriptor = MPMusicPlayerStoreQueueDescriptor(storeIDs: ["i.PkdZ7AaUPEbqRoM", "i.LVk6rQWTZLGmdV3"])
                        self.musicPlayer.setQueue(with: [song.id])
                       // MPMediaQuery.songs()
                        //self.musicPlayer.setQueue(with: [song.id])
                        //print(song.id)
                        //429945620
                        //self.musicPlayer.prepareToPlay()
                        //self.musicPlayer.play()
                        self.musicPlayer.play()
                        GlobalPlayer.sharedInstance.appleMusic = true
                    }) {
                        Image(systemName: "play.fill")
                            .foregroundColor(.pink)
                    }
                }
            }
        }
        .accentColor(.pink)
        }

    }
    
    
    private func sendKey()
    {
        //search(keyword: key)
        
//        if key.isEmpty {
//                            self.searchResults = []
//
//                        } else {
                            SKCloudServiceController.requestAuthorization { (status) in
                                if status == .authorized {
                                    fetchStorefrontID()
                                }
                            }
                        //}
        
        
       // self.searching = 1
        //self.hideKeyboard()
//        fetchStorefrontID(keyword: key)
        //self.hideKeyboard()
    }

    func getUserToken(completion: @escaping (String) -> Void)
    {
        var userToken = String()
        
        // 1
        //let lock = DispatchSemaphore(value: 0)
        
        // 2
        SKCloudServiceController().requestUserToken(forDeveloperToken: developerToken) { (receivedToken, error) in
            // 3
            guard error == nil else { return }
            if let token = receivedToken {
                userToken = token
                //lock.signal()
                print(userToken)
                print("pp")
                self.userToken = userToken
                completion(userToken)
            }
        }
        
        // 4
        //lock.wait()
        //print(userToken)
       // return userToken
    }
    
    func fetchStorefrontID() //-> String
    {
       // let lock = DispatchSemaphore(value: 0)
        //self.searchText = keyword
        getUserToken()
        {
        (token) in
            
            print(token)
        //var storefrontID: String!
        
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/storefront")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
            musicRequest.addValue("Bearer \(self.developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(token, forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            
            if let json = try? JSON(data: data!) {
                let result = (json["data"]).array!
                let id = (result[0].dictionaryValue)["id"]!
                //storefrontID = id.stringValue
               // print("prin")
                print(id.stringValue)
                self.storeFrontID =  id.stringValue
                searchAppleMusic()
               // lock.signal()
            }
        }.resume()
        
        }
       // lock.wait()
       // print(storefrontID!)
       // return storefrontID
    }
    
    func searchAppleMusic() //-> [Song]
    {
        //let lock = DispatchSemaphore(value: 0)
       // var songs = [Song]()

        
//        fetchStorefrontID()
//        {
//        (FSFID) in
//        getUserToken()
//        {
//        (token) in
            
        let musicURL = URL(string: "https://api.music.apple.com/v1/me/library/songs")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
            musicRequest.addValue("Bearer \(self.developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(self.userToken, forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            if let json = try? JSON(data: data!) {
                print(json)
                let result = (json["data"]).array!
                for song in result {
                    let attributes = song["attributes"]
                    let currentSong = Song(id: attributes["playParams"]["catalogId"].string!, name: attributes["name"].string!, artistName: attributes["artistName"].string!, artworkURL: attributes["artwork"]["url"].string!)
                    print(attributes["name"].string!)
                  DispatchQueue.main.async {//tobetested
                    
                        self.searchResults.append(currentSong)
                    //tobetested
                        self.searching = 1}
                }
                
                //lock.signal()
            } else {
                //lock.signal()
            }
        }.resume()
       // }
        //}
        //lock.wait()
        //return songs
    }
}


