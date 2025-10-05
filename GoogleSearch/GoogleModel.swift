//
//  GoogleModel.swift
//  LifeBeats
//
//  Created by User on 6/23/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import Foundation

struct GoogleModel: Identifiable {
    
    let id = UUID()
    let title: [String?]
    let description: [String?]
    let link: [String?]
}


struct ItemsData {
    
    var allItems: [GoogleModel]

}


struct GoogleImage: Identifiable {
    
    let id = UUID()
    let image: [String?]
}

struct ImagesData{
    
    var allImages: [GoogleImage]
}
