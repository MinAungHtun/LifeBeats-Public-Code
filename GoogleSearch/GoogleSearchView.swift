//
//  SearchView.swift
//  LifeBeats
//
//  Created by User on 6/27/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct GoogleSearchView: View {
    
    @State  var fetch = GoogleManager() //private
    @State  var searchWord : String         //private
    
    var body: some View {
        ScrollView(.vertical)
        {
            VStack(spacing: 2.0)
            {
//                ForEach(0..<9)
//                {index in
//
//                    GoogleView(index: index).padding()
//                }.padding()
                GoogleView(index: 0)//.padding()
                GoogleView(index: 1)//.padding()
                GoogleView(index: 2)//.padding()
            }
           // Divider()
                .onAppear
                {
                    fetch.fetchGoogle(searchWord: searchWord)
                }
        }
    }
}


