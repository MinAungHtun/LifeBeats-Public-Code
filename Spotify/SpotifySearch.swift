//
//  SpotifySearch.swift
//  LifeBeats
//
//  Created by User on 11/16/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Alamofire
import AVFoundation

struct SearchResult : View, Identifiable
{
    var id = UUID()
    var image : UIImage 
    var songName : String
    var artistName : String
    var uri : String
    var body: some View
    {
        VStack(alignment: .leading){
        HStack{
        Image(uiImage: image).resizable().frame(width: 70, height: 70)
            VStack(alignment: .leading)
        {
                Text(self.songName).foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 12))
                Text(self.artistName).foregroundColor(.white)
                    .font(Font.custom("Nexa Bold", size: 10))
        }
        }.frame(width: UIScreen.main.bounds.width-50, height: 90, alignment: .leading)
        }
    }
}

struct SpotifySearch: View {
    typealias JSONStandard = [String : AnyObject]
    @State private var showingAlert = true
    @State var artist : String = " "
    @State var mainImage : UIImage? = UIImage(named: "itunes")
    var accessToken : String
        {
            get {
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.accessToken ?? " "
            }
        }
    @State var results = [SearchResult]()
    @State var count : Int = 0
    @State var player : Bool = false
    @State var searchName = ""
    @State var timeRemaining = 2
    @State var animate : Bool = false
    
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            HStack{
                SearchTextField(sendAction: sendKeyword)
                    .frame(alignment: .topLeading)
            }.frame(alignment: .topLeading)
            if(self.animate == true && self.count == 0) //self.count == 0
            {
            Text("Searching....").font(Font.custom("Nexa Bold", size: 16))
            }
            else if(self.count == 20) //self.count == 20
            {
                ScrollView(.vertical, showsIndicators: false)
                {
                    VStack{
                ForEach(results)
                { result in
                    NavigationLink(destination: SpotifySearchPlayer(songName: result.songName, artist: result.artistName, uri: result.uri, image: result.image))
                    {
                    result.body
                    }
                }
                    }
                }
                .onAppear(perform: {
                    self.hideKeyboard()
                })
            }
        }
    }
    
    private func sendKeyword(key:String)
    {
        DispatchQueue.main.async {
        search(keyword: key)
        }
        //self.hideKeyboard()
    }
    
    
    func search(keyword:String)
    {
        self.animate = true;
        self.count = 0;
        self.results.removeAll()
        let keywords = keyword.replacingOccurrences(of: " ", with: "+")
        let searchURL = "https://api.spotify.com/v1/search?q=\(keywords)&type=track&&limit=20&access_token=\(self.accessToken)"
        Alamofire.request(searchURL).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            //print(response.data!)
        })
    }
    
    func parseData(JSONData : Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! JSONStandard
            //print(readableJSON)
            if let tracks = readableJSON["tracks"] as? JSONStandard{
                if let items = tracks["items"] as? [JSONStandard] {
            for i in 0..<items.count{
            let item = items[i]
            let name = item["name"] as! String
            let url = item["uri"] as! String
            if let album = item["album"] as? JSONStandard{
            if let images = album["images"] as? [JSONStandard]{
                let image = images[0]
                let mainImageURL =  URL(string: image["url"] as! String)
                let mainImageData = NSData(contentsOf: mainImageURL!)
                DispatchQueue.main.async {//tobetested
                self.mainImage = UIImage(data: mainImageData as! Data)
                }
                    }
                    }
                if let artist = item["artists"] as? NSArray
                    {
                    
                if let name = artist[0] as? JSONStandard
                        {
                    DispatchQueue.main.async {//tobetested
                    self.artist = name["name"] as! String
                    }
                        }
                    }
                DispatchQueue.main.async {//tobetested
                    self.results.append(SearchResult.init(image: self.mainImage!, songName: name, artistName: self.artist, uri: url))
                    
                
                self.count = self.count + 1
                if(self.count == 20)
                {
                    self.animate = false
                }
                }
                    }
                }
            }
        }
        catch{
            print(error)
        }
    }
}

struct SpotifySearch_Previews: PreviewProvider {
    static var previews: some View {
        SpotifySearch()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
