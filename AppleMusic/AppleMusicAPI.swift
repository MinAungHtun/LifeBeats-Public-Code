//
//  AppleMusicAPI.swift
//  MusicPlayer
//
//  Created by Sai Kambampati on 5/30/20.
//  Copyright © 2020 Sai Kambmapati. All rights reserved.
//

import Foundation
import StoreKit

class AppleMusicAPI {
    let developerToken = "eyJ0eXAiOiJKV1QiLCJhbGciOiJFUzI1NiIsImtpZCI6IldKVFlBNkw5MzMifQ.eyJpc3MiOiJaMzI1OUdMQjRYIiwiZXhwIjoxNjM4MDQ5Nzg0LCJpYXQiOjE2MjIyODE3ODR9.KbX0Hg8VJDHdEy29xJDwrnyr_FO507zeQclW5NFOUs8uLvZ6o7W74V8E2-06DQngpiA_aHQGcPb6X_yeKzTo8A"

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
                
               // lock.signal()
            }
        }.resume()
        
        }
       // lock.wait()
       // print(storefrontID!)
       // return storefrontID
    }
    
    func searchAppleMusic(_ searchTerm: String!) -> [Song] {
        //let lock = DispatchSemaphore(value: 0)
        var songs = [Song]()

        
//        fetchStorefrontID()
//        {
//        (FSFID) in
        getUserToken()
        {
        (token) in
            
            let musicURL = URL(string: "https://api.music.apple.com/v1/catalog/\(self.fetchStorefrontID())/search?term=\(searchTerm.replacingOccurrences(of: " ", with: "+"))&types=songs&limit=25")!
        var musicRequest = URLRequest(url: musicURL)
        musicRequest.httpMethod = "GET"
            musicRequest.addValue("Bearer \(self.developerToken)", forHTTPHeaderField: "Authorization")
        musicRequest.addValue(token, forHTTPHeaderField: "Music-User-Token")
        
        URLSession.shared.dataTask(with: musicRequest) { (data, response, error) in
            guard error == nil else { return }
            if let json = try? JSON(data: data!) {
                let result = (json["results"]["songs"]["data"]).array!
                for song in result {
                    let attributes = song["attributes"]
                    let currentSong = Song(id: attributes["playParams"]["id"].string!, name: attributes["name"].string!, artistName: attributes["artistName"].string!, artworkURL: attributes["artwork"]["url"].string!)
                    print(currentSong)
                    songs.append(currentSong)
                }
                //lock.signal()
            } else {
                //lock.signal()
            }
        }.resume()
        }
        //}
        //lock.wait()
        return songs
    }
}
