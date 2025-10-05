//
//  FebeNavBuffer.swift
//  LifeBeats
//
//  Created by User on 8/21/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct FebeNavBuffer: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var febeTriggered:Bool = GlobalPlayer.sharedInstance.febeTrigged
    @State var therapyInx:Int = 17
    @State var evening : Bool
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack{
            if(self.febeTriggered == true)
            {
                TherapyDetail(therapy: userData.therapies[therapyInx])
            }
            else
            {
                WatsonBuffer(evening: self.evening)
            }
    }
        .onReceive(timer) { _ in
            self.febeTriggered = GlobalPlayer.sharedInstance.febeTrigged
            //print(GlobalPlayer.sharedInstance.febeTrigged)
            //print(evening)
            self.therapyInx = GlobalPlayer.sharedInstance.febeIndx
        }
    }
}

//struct FebeNavBuffer_Previews: PreviewProvider {
//    static var previews: some View {
//        FebeNavBuffer()
//    }
//}
