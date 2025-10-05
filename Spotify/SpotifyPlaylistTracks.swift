//
//  SpotifyPlaylistTracks.swift
//  LifeBeats
//
//  Created by User on 11/29/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Alamofire
import AVFoundation

struct PlaylistTracks : View, Identifiable
{
    var id = UUID()
    var songName : String
    var uri : String
    var artist : String
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
            VStack(alignment: .leading)
        {
                Text(self.songName).foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 12))
                Text(self.artist).foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 10))
        }
        }.frame(width: UIScreen.main.bounds.width-50, height: 50, alignment: .leading)
        }
    }
}


struct SpotifyPlaylistTracks: View {
    @State var Song : String = " "
    @State var playlistID : String = " "
    //typealias JSONStandard = [String : AnyObject]
    var accessToken : String
        {
            get {
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.accessToken ?? " "
            }
        }
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
    
    @State var results = [PlaylistTracks]()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false)
        {
            VStack{
        ForEach(results)
        { result in
            Button(action: {
                appRemote?.playerAPI?.play(result.uri, callback: defaultCallback)
                GlobalPlayer.sharedInstance.spotify = true
                GlobalPlayer.sharedInstance.spotifySongName = result.songName
            }){
            result.body
            }
        }
            }
        }.onAppear(perform: {if(self.playlistID != " "){
                    DispatchQueue.main.async {self.search()}}})
    }
    
    func search()
    {
        appRemote?.contentAPI?.fetchContentItem(forURI: self.playlistID)
        {
            (items, error)
            in
            if let contentItems = items as? SPTAppRemoteContentItem
            {
//                print(contentItems[0].title ?? "nothing")
//                print(contentItems.count)
                //print(contentItems.title)
                appRemote?.contentAPI?.fetchChildren(of: contentItems)
                {
                 (item, err)
                    in
                    //print(item!)
                    if let cItems = item as? [SPTAppRemoteContentItem]
                    {
                        for i in 0..<cItems.count{
                            let songName = cItems[i].title
                            let uri = cItems[i].uri
                            let subtitle = cItems[i].subtitle
                            DispatchQueue.main.async {//tobetested
                            self.results.append(PlaylistTracks.init(songName: songName ?? " ", uri: uri, artist: subtitle ?? " "))
                            }
                        }
                    }
                }
            }
            if let e = error
            {
                print(e)
            }

           // print(items!)
        }
        print(self.playlistID)
    }
//        let searchURL = "https://api.spotify.com/v1/playlists/21THa8j9TaSGuXYNBU5tsC/tracks&access_token=\(self.accessToken)"
//        Alamofire.request(searchURL).responseJSON(completionHandler: {
//            response in
//            self.parseData(JSONData: response.data!)
//            print(response.data ?? "failure")
//        })
    
    
    
//    func parseData(JSONData : Data) {
//        do {
//            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
//            if let tracks = readableJSON["tracks"] as? JSONStandard{
//                if let items = tracks["id"] as? [JSONStandard] {
//                    print(items[0])
//            for i in 0..<items.count{
//            let item = items[i]
//            let name = item["name"] as! String
//            let url = item["uri"] as! String
//            if let album = item["album"] as? JSONStandard{
//            if let images = album["images"] as? [JSONStandard]{
//                let image = images[0]
//                let mainImageURL =  URL(string: image["url"] as! String)
//                let mainImageData = NSData(contentsOf: mainImageURL!)
//                self.mainImage = UIImage(data: mainImageData as! Data)
//                    }
//                    }
//                if let artist = item["artists"] as? NSArray
//                    {
//
//                if let name = artist[0] as? JSONStandard
//                        {
//                    self.artist = name["name"] as! String
//                        }
//                    }
//                self.results.append(SearchResult.init(image: self.mainImage!, songName: name, artistName: self.artist, uri: url))
//                self.count = self.count + 1
//                    }
//                }
//            }
//        }
//        catch{
//            print(error)
//        }
//    }
}

struct SpotifyPlaylistTracks_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyPlaylistTracks()
    }
}
