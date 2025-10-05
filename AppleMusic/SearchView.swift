//
//  SearchView.swift
//  MusicPlayer
//
//  Created by Sai Kambampati on 3/18/20.
//  Copyright © 2020 Sai Kambmapati. All rights reserved.
//

import SwiftUI
import StoreKit
import MediaPlayer
import SDWebImageSwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @State  var userToken: String = " "
    @State  var storeFrontID: String = " "
    @State  var searching = 0
    @State private var searchResults = [Song]()
    @Binding var musicPlayer: MPMusicPlayerController
    @Binding var currentSong: Song
    
    var body: some View {
        VStack {
//            TextField("Search Songs", text: $searchText, onCommit: {
//                UIApplication.shared.resignFirstResponder()
//                if self.searchText.isEmpty {
//                    self.searchResults = []
//                } else {
//                    SKCloudServiceController.requestAuthorization { (status) in
//                        if status == .authorized {
//                            self.searchResults = AppleMusicAPI().searchAppleMusic(self.searchText)
//                        }
//                    }
//                }
//            })
//            .textFieldStyle(RoundedBorderTextFieldStyle())
//            .padding(.horizontal, 16)
//            .accentColor(.pink)
            VStack{
                SearchTextField(sendAction: sendKey)
                    .frame(alignment: .topLeading)
                if(self.searching == 1)
                {
                Text("Searching....").font(Font.custom("Nexa Bold", size: 16))
                }
                
            }
//            .onAppear(perform:
//                        {
//                            //AppleMusicAPI().searchAppleMusic("Taylor Swift")
//                            //self.fetchStorefrontID()
//
//                        })
            
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
                        Spacer()
                        Button(action: {
                            self.currentSong = song
                            self.musicPlayer.setQueue(with: [song.id])
                            print(song.id)
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
//            .onAppear(perform: {
//                self.searching = 0
//                self.hideKeyboard()
//            })
        }
    }
    
    
    let developerToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IldKVFlBNkw5MzMifQ.eyJpc3MiOiJaMzI1OUdMQjRYIiwiZXhwIjoxNjM4MDQ5Nzg0LCJpYXQiOjE2MjIyODE3ODR9.KbX0Hg8VJDHdEy29xJDwrnyr_FO507zeQclW5NFOUs8uLvZ6o7W74V8E2-06DQngpiA_aHQGcPb6X_yeKzTo8A"
    
    private func sendKey(key:String)
    {
        //search(keyword: key)
        
        if key.isEmpty {
                            self.searchResults = []
                            
                        } else {
                            DispatchQueue.main.async {
                            SKCloudServiceController.requestAuthorization { (status) in
                                if status == .authorized {
                                    fetchStorefrontID(keyword: key)
                                }
                            }}
                        }
        
        
        self.searching = 1
        self.hideKeyboard()
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
    
    func fetchStorefrontID(keyword:String) //-> String
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
                searchAppleMusic(keyword)
               // lock.signal()
            }
        }.resume()
        
        }
       // lock.wait()
       // print(storefrontID!)
       // return storefrontID
    }
    
    func searchAppleMusic(_ searchTerm: String!) //-> [Song]
    {
        //let lock = DispatchSemaphore(value: 0)
       // var songs = [Song]()

        
//        fetchStorefrontID()
//        {
//        (FSFID) in
//        getUserToken()
//        {
//        (token) in
            
        let musicURL = URL(string: "https://api.music.apple.com/v1/catalog/\(self.storeFrontID)/search?term=\(searchTerm.replacingOccurrences(of: " ", with: "+"))&types=songs&limit=25")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
            musicRequest.addValue("Bearer \(self.developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(self.userToken, forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            if let json = try? JSON(data: data!) {
                print(json)
                let result = (json["results"]["songs"]["data"]).array!
                for song in result {
                    let attributes = song["attributes"]
                    let currentSong = Song(id: attributes["playParams"]["id"].string!, name: attributes["name"].string!, artistName: attributes["artistName"].string!, artworkURL: attributes["artwork"]["url"].string!)
                    print(attributes["name"].string!)
                    DispatchQueue.main.async {//tobetested
                    self.searchResults.append(currentSong)
                    self.searching = 0
                    }
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
