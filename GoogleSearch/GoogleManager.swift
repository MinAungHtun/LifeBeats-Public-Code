//
//  GoogleManager.swift
//  LifeBeats
//
//  Created by User on 6/23/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import Foundation

class GoogleManager: ObservableObject
{
    @Published var items = ItemsData(allItems: [])
    @Published var images = ImagesData(allImages: [])
    let apiKey = "AIzaSyDROuaShRDwGZJ_VNk01TPQDtdBREiFTSM"
    let searchID = "ee050ae07f9ebca29"
    
    private static var sharedNetworkManager: GoogleManager =
    {
        let googleManager = GoogleManager()
        return googleManager
    }()
    
    class func shared() -> GoogleManager{
        return sharedNetworkManager
    }
    
    func fetchGoogle(searchWord: String)
    {
        let newString = searchWord.replacingOccurrences(of: " ", with: "+")
        let urlString = "https://www.googleapis.com/customsearch/v1?q=\(newString)&key=\(apiKey)&cx=\(searchID)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String)
    {
        
        if let url = URL(string: urlString)
        {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url)
            {(data, response, error) in
                
                if error != nil
                {
                        print(error!)
                    return
                }
                if let safeData = data
                {
                    self.parseJSON(googleData: safeData)
                }
                
            }
            task.resume()
        }
    }
    
    func parseJSON(googleData: Data)
    {
        do
        {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let responseItems = try decoder.decode(GoogleData.self, from: googleData)
            let thumbnail = responseItems.items.map({$0.pagemap.metatags.map({$0.ogImage})})
            let allImages = Array(thumbnail.joined())
            let title = responseItems.items.map({$0.title})
            let description = responseItems.items.map({$0.snippet})
            let link = responseItems.items.map({$0.link})
            
            DispatchQueue.main.async {
                let googleImages = GoogleImage(image: allImages)
                GoogleManager.shared().images.allImages.append(googleImages)
            }
            
            let googleResult = GoogleModel(title: title, description: description, link: link)
            
            DispatchQueue.main.async {
                GoogleManager.shared().items.allItems.append(googleResult)
            }
        }
        catch
        {
            print(error)
        }
        
    }
}


