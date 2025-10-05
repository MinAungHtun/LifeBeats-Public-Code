//
//  VolumeControl.swift
//  LifeBeats
//
//  Created by User on 1/6/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct VolumeControl: View {
    var body: some View {
        VStack
        {
            NavigationView{
                ScrollView{
            Text("Volume Control")
                .font(.headline).fontWeight(.medium)
            VolumeSlider().padding()
                    VolumeSlider1()}
        }.environment(\.colorScheme, .dark)
        }
    }
}

struct VolumeControl_Previews: PreviewProvider {
    static var previews: some View {
        VolumeControl()
    }
}
