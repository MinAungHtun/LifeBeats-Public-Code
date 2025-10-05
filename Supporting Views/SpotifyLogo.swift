//
//  SpotifyLogo.swift
//  LifeBeats
//
//  Created by User on 6/29/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct SpotifyLogo: View {
    var body: some View {
      VStack{

                               Image("Spotify").renderingMode(.original).clipShape(Circle()).overlay(Circle().stroke(Color.black,lineWidth: 2))
                               .shadow(radius: 20)
                               .accessibility(label: Text("Spotify"))
                           
                   
               }
    }
}

struct SpotifyLogo_Previews: PreviewProvider {
    static var previews: some View {
        SpotifyLogo()
    }
}
