//
//  SPTPlaylistsTracks.swift
//  LifeBeats
//
//  Created by User on 12/5/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SPTPlaylistsTracks: View {
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
            }){
            result.body
            }
        }
            }
        }.onAppear(perform: {            DispatchQueue.main.async {search()}})
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
//                print(contentItems.title)
                appRemote?.contentAPI?.fetchChildren(of: contentItems)
                {
                 (item, err)
                    in
                    print(item!)
                    if let cItems = item as? [SPTAppRemoteContentItem]
                    {
                        for i in 0..<cItems.count{
                            let songName = cItems[i].title
                            let uri = cItems[i].uri
                            let subtitle = cItems[i].subtitle
                            DispatchQueue.main.async {//tobetested
                            self.results.append(PlaylistTracks.init(songName: songName!, uri: uri, artist: subtitle!))
                            }
                        }
                    }
                }
            }
            if let e = error
            {
                print(e)
            }

            print(items!)
        }
        print(self.playlistID)
    }

}

struct SPTPlaylistsTracks_Previews: PreviewProvider {
    static var previews: some View {
        SPTPlaylistsTracks()
    }
}
