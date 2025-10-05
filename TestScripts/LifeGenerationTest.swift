//
//  LifeGenerationTest.swift
//  LifeBeats
//
//  Created by User on 7/21/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct LifeGenerationTest: View {
    var body: some View {
        VStack{
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }.onAppear(perform: {
            if let date = UserDefaults.standard.object(forKey: "creationTime") as? Date {
            if let diff = Calendar.current.dateComponents([.hour], from: date, to: Date()).hour, diff > 1 {
                print("true")
            }
            }
        })
    }
}

struct LifeGenerationTest_Previews: PreviewProvider {
    static var previews: some View {
        LifeGenerationTest()
    }
}
