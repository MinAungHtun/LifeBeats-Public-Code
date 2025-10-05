//
//  UpdatePopUp.swift
//  LifeBeats
//
//  Created by User on 3/27/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct UpdatePopUp: View {
    var body: some View {
        VStack{
            Text("New Contents").font(Font.custom("Nexa Bold", size: 18)).padding(.bottom, 40)
            Image("Curiosity").resizable().clipShape(Circle()).frame(width: 60, height: 60)
            
        }.padding(.bottom, 30)
    }
}

struct UpdatePopUp_Previews: PreviewProvider {
    static var previews: some View {
        UpdatePopUp()
    }
}
