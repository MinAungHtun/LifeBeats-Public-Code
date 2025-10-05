//
//  SpotifyContent.swift
//  LifeBeats
//
//  Created by User on 8/11/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SpotifyContent: View {
    
    var appRemote: SPTAppRemote? {
        get {
            return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.appRemote
        }
    }
    
   @State var contentItems = [SPTAppRemoteContentItem]()
    
    var containerItem: SPTAppRemoteContentItem?
    
    @State var playlistImage1 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage2 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage3 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage4 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage5 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage6 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage7 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage8 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage9 : UIImage = UIImage(named: "spotifyContent")!
    @State var playlistImage10 : UIImage = UIImage(named: "spotifyContent")!
    @State var text1 : String? = " "
    @State var text2 : String? = " "
    @State var text3 : String? = " "
    @State var text4 : String? = " "
    @State var text5 : String? = " "
    @State var text6 : String? = " "
    @State var text7 : String? = " "
    @State var text8 : String? = " "
    @State var text9 : String? = " "
    @State var text10 : String? = " "
    @State var uri1 : String? = " "
    @State var uri2 : String? = " "
    @State var uri3 : String? = " "
    @State var uri4 : String? = " "
    @State var uri5 : String? = " "
    @State var uri6 : String? = " "
    @State var uri7 : String? = " "
    @State var uri8 : String? = " "
    @State var uri9 : String? = " "
    @State var uri10 : String? = " "
    @State var ready : Bool? = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            if(self.ready == true)
            {
                ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    Text("Playlists").foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 25))
                    HStack{
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text1 ?? " ", uri: self.uri1 ?? " ", image: self.playlistImage1)){
                                Image(uiImage: playlistImage1).resizable().frame(width: 100, height: 100).padding()}
                            Text(text1!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            
                        }
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text2 ?? " ", uri: self.uri2 ?? " ", image: self.playlistImage2)){
                                Image(uiImage: playlistImage2).resizable().frame(width: 100, height: 100).padding()}
                            Text(text2!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                    }.padding()
                    HStack{
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text3 ?? " ", uri: self.uri3 ?? " ", image: self.playlistImage3)){
                                Image(uiImage: playlistImage3).resizable().frame(width: 100, height: 100).padding()}
                            Text(text3!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text4 ?? " ", uri: self.uri4 ?? " ", image: self.playlistImage4)){
                                Image(uiImage: playlistImage4).resizable().frame(width: 100, height: 100).padding()}
                            Text(text4!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                    }.padding()
                    HStack{
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text5 ?? " ", uri: self.uri5 ?? " ", image: self.playlistImage5)){
                                Image(uiImage: playlistImage5).resizable().frame(width: 100, height: 100).padding()}
                            Text(text5!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text6 ?? " ", uri: self.uri6 ?? " ", image: self.playlistImage6)){
                                Image(uiImage: playlistImage6).resizable().frame(width: 100, height: 100).padding()}
                            Text(text6!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                    }.padding()
                    HStack{
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text7 ?? " ", uri: self.uri7 ?? " ", image: self.playlistImage7)){
                                Image(uiImage: playlistImage7).resizable().frame(width: 100, height: 100).padding()}
                            Text(text7!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text8 ?? " ", uri: self.uri8 ?? " ", image: self.playlistImage8)){
                                Image(uiImage: playlistImage8).resizable().frame(width: 100, height: 100).padding()}
                            Text(text8!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                    }.padding()
                    HStack{
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text9 ?? " ", uri: self.uri9 ?? " ", image: self.playlistImage9)){
                                Image(uiImage: playlistImage9).resizable().frame(width: 100, height: 100).padding()}
                            Text(text9!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }
                        VStack
                        {
                            NavigationLink (destination: SpotifyPlaylistPlayer(songName: self.text10 ?? " ", uri: self.uri10 ?? " ", image: self.playlistImage10)){
                                Image(uiImage: playlistImage10).resizable().frame(width: 100, height: 100).padding()}
                            Text(text10!).font(Font.custom("Nexa Bold", size: 12)).frame(width: 200).multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        }.padding()
                    }.padding()
                }.padding(.leading, 20)
            }
        }
        }.onAppear(perform:             {DispatchQueue.main.async {contentRetrieval()}})
        .onReceive(timer) { _ in
            if(self.ready != true)
            {            DispatchQueue.main.async {
                self.contentRetrieval()
            }
            }
        }
    }
    
    func contentRetrieval()
    {
        GlobalPlayer.sharedInstance.pauseBGMusic()
        if let container = containerItem {
            appRemote?.contentAPI?.fetchChildren(of: container) { (items, error) in
                if let contentItems = items as? [SPTAppRemoteContentItem] {
                    self.contentItems = contentItems
                }
            }
        }
        else
        {
            appRemote?.contentAPI?.fetchRecommendedContentItems(forType: SPTAppRemoteContentTypeDefault, flattenContainers: true) { (items, error) in
                if let contentItems = items as? [SPTAppRemoteContentItem] {
                    self.contentItems = contentItems
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[0], with: CGSize(width: 80, height: 80)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage1 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text1 = self.contentItems[0].title
                        self.uri1 =  self.contentItems[0].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[1], with: CGSize(width: 100, height: 100)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage2 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text2 = self.contentItems[1].title
                        self.uri2 =  self.contentItems[1].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[2], with: CGSize(width: 80, height: 80)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage3 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text3 = self.contentItems[2].title
                        self.uri3 =  self.contentItems[2].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[3], with: CGSize(width: 100, height: 100)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage4 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text4 = self.contentItems[3].title
                        self.uri4 =  self.contentItems[3].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[4], with: CGSize(width: 80, height: 80)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage5 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text5 = self.contentItems[4].title
                        self.uri5 =  self.contentItems[4].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[5], with: CGSize(width: 100, height: 100)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage6 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text6 = self.contentItems[5].title
                        self.uri6 =  self.contentItems[5].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[6], with: CGSize(width: 80, height: 80)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage7 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text7 = self.contentItems[6].title
                        self.uri7 =  self.contentItems[6].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[7], with: CGSize(width: 100, height: 100)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage8 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text8 = self.contentItems[7].title
                        self.uri8 =  self.contentItems[7].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[8], with: CGSize(width: 80, height: 80)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage9 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text9 = self.contentItems[8].title
                        self.uri9 =  self.contentItems[8].uri
                        self.ready = true
                        }
                    }
                    appRemote?.imageAPI?.fetchImage(forItem: contentItems[9], with: CGSize(width: 100, height: 100)) { (image, error) in
                        DispatchQueue.main.async {//tobetested
                        self.playlistImage10 = image as? UIImage ?? UIImage(named: "spotifyContent")!
                        self.text10 = self.contentItems[9].title
                        self.uri10 =  self.contentItems[9].uri
                        self.ready = true
                        }
                    }
                    
                }
            }
        }
    }
}

struct SpotifyContent_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyContent()
    }
}
