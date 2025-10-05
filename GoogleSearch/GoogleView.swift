//
//  GoogleView.swift
//  LifeBeats
//
//  Created by User on 6/27/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI


extension String{
    
    func load() -> UIImage
    {
        do
        {
            guard let url = URL(string: self) else {return UIImage()}
            let data:Data = try
            
            Data(contentsOf: url)
            return UIImage(data: data) ?? UIImage()
            
        }
        catch
        {
            
        }
        return UIImage()
    }
    
}

struct GoogleView: View {
    
    @ObservedObject var googleManager = GoogleManager.shared()
    @State var index: Int
    
    var body: some View {

        
//        ScrollView(.vertical)
//        {
            //HStack(spacing: 20)
            VStack
            {
                ForEach(googleManager.items.allItems, id: \.id)
                {
                    item in
                    VStack
                    {
                        //Spacer()
                        Text(item.title[index]!).font(Font.custom("Nexa Bold", size: 16))//.frame(width: 200, height: 60).font(.headline)
//                        ForEach(googleManager.images.allImages, id: \.id)
//                        {
//                            image in
//
//                            Image(uiImage: (image.image[index]?.load() ?? UIImage(systemName: "camera"))!).resizable().frame(width: 200, height: 200)
//                        }
                        
                        Text(item.description[index]!).font(Font.custom("Nexa Bold", size: 13))//.frame(width: 200, height: 160).font(Font.custom("Nexa Bold", size: 18))
//                        Text(item.link[index]!).frame(width: 200, height: 160).font(Font.custom("Nexa Bold", size: 18)).foregroundColor(.blue)
                        //Spacer()
                    }
                }
            }.frame(width: UIScreen.main.bounds.width, height: 100)
    //}
        
    }
}

struct GoogleViewColumn: View {
    

    
    var body: some View {
                    
        
                    GoogleView(index: 0)
        GoogleView(index: 1)
        GoogleView(index: 2)
         
    }
}

