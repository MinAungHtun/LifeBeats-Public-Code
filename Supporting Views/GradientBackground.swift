//
//  GradientBackground.swift
//  LifeBeats
//
//  Created by User on 9/3/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct GradientBackground: View {
    var body: some View {
        ZStack
            {
                LinearGradient(gradient: .init(colors: [.gray, .black]), startPoint: .bottom, endPoint: .top).edgesIgnoringSafeArea(.all)
                
                
        }
    }
}

struct GradientBackground_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackground()
    }
}
