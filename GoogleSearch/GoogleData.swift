//
//  GoogleData.swift
//  LifeBeats
//
//  Created by User on 6/23/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import Foundation

struct GoogleData: Codable{
    
    let items: [Items]
    
    struct Items: Codable{
        let title: String?
        let snippet: String?
        let link: String?
        let pagemap: Pagemap
        
        struct Pagemap: Codable{
            let metatags: [Metatag]
            
            struct Metatag: Codable{
                let ogImage: String?
                
                enum CodingKeys: String, CodingKey
                {
                    case ogImage = "og:image"
                }
                
            }
            
        }
        
    }
    
}
