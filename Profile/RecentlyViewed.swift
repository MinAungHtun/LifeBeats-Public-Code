//
//  RecentlyViewed.swift
//  LifeBeats
//
//  Created by User on 8/25/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct RecentlyViewed: View {
        var colors: [Color] = [.red, .green, .blue]

    var body: some View {
        VStack {
            ForEach(colors, id: \.self) { color in
                Text(color.description.capitalized)
                    .padding()
                    .background(color)
            }
        }
    }
}

struct RecentlyViewed_Previews: PreviewProvider {
    static var previews: some View {
        RecentlyViewed()
    }
}
