//
//  EnlargedMinimizedPlayer.swift
//  LifeBeats
//
//  Created by User on 10/20/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct EnlargedMinimizedPlayer: View {
    @State var categoryName : String?
    @State var therapyName : String?
    @State var description : String?
    @State var duration : String?
    @State var playing : Bool?
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false)
            {
                TimerCircle()
                
                VStack{
                    Text(self.therapyName!).font(Font.custom("Nexa Bold", size: 23))
                        
        VStack
        {
            MusicPlayer(playing : self.playing!, id: 9999, categoryName : self.categoryName!, therapyName : self.therapyName!, start : false).frame(width: UIScreen.main.bounds.width/1.1, height: 250)
        }
        .padding(.leading, 30)
        .padding(.trailing, 30)
                }
                //.padding(.top, UIScreen.main.bounds.height/7)
            }.padding(.leading, 10)
            //.padding(.top, 100)
            .padding(.trailing, 10)
        }
        .onReceive(timer) { _ in
            if (GlobalPlayer.sharedInstance.finish == true)
            {
                if(self.categoryName != "Sleep" && self.categoryName != "Meditation")
                {
                self.presentationMode.wrappedValue.dismiss()
                }
            }
        }

        .background(TherapyBG(categoryName:self.categoryName!))
        .environment(\.colorScheme, .dark)
        
    }
}

struct EnlargedMinimizedPlayer_Previews: PreviewProvider {
    static var previews: some View {
        //EnlargedMinimizedPlayer()
    Text("Nothing")
    }
}
