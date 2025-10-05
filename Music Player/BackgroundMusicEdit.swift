//
//  BackgroundMusicEdit.swift
//  LifeBeats
//
//  Created by User on 6/29/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct BackgroundMusicEdit: View {
    @State var category : String?
    @State var music : Bool? = false
    @Binding var isPresented : Bool
    let lifeBeatsColor = Color(red: 167.0 / 255, green: 198.0 / 255, blue: 203.0 / 255)
    @State var premium : Bool = (UIApplication.shared.delegate as? AppDelegate)!.premium

    var body: some View {
        VStack{
            Image("bgArt").resizable().frame(height: 100)
            ZStack{
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
            VStack{
//            HStack{
//            Button("Done")
//            {
//            self.isPresented = false
//            }.padding(.leading, UIScreen.main.bounds.width - 100)
//            }
                Text("Soundscape Selection").font(Font.custom("Nexa Bold", size: 23)).fontWeight(.medium)
//                if(self.music == true)
//                {
//            VStack
//            {
//                if (self.premium == true)
//                {
//                NavigationLink(destination: SpotifyMain())
//                {
//                    HStack{
//                    SpotifyLogo()
//                        Text("Spotify Connect").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(.white)
//                    }
//                }.padding(.bottom, 20)
//                    NavigationLink(destination: AppleMusicMainInterface())
//                    {
//                        HStack{
//                            Image("AppleMusic").resizable().frame(width: 30, height: 30)
//                            Text("Apple Music").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(.white)
//                            Text("(subscription required)").font(Font.custom("Nexa Bold", size: 10)).foregroundColor(.white)
//                        }
//                    }.padding(.bottom, 20)                .padding(.top, 20)
//                }
////                NavigationLink(destination: SoundCloudMain())
////                {
////                    HStack{
////                        Text("SoundCloud")
////                    }
////                }.padding(.bottom, 20)
////                  NavigationLink(destination: AppleMusicMain())
////                  {
////                      Text("AppleMusic")
////                  }.padding(.bottom, 20)
//            }.padding(.top, 30).padding(.bottom, 40)
//                }
//                else if(self.music == false){Text (" ")}
            BGTracksList(category: self.category!).environmentObject(UserData())
//                if(self.music == true)
//                {
//            VStack
//            {
//                NavigationLink(destination: SpotifyMain())
//                {
//                    HStack{
//                    SpotifyLogo()
//                    Text("Spotify")
//                    }
//                }.padding(.bottom, 20)
////                NavigationLink(destination: SoundCloudMain())
////                {
////                    HStack{
////                        Text("SoundCloud")
////                    }
////                }.padding(.bottom, 20)
////                  NavigationLink(destination: AppleMusicMain())
////                  {
////                      Text("AppleMusic")
////                  }.padding(.bottom, 20)
//            }.padding(.top, 30).padding(.bottom, 40)
//                }
//                else
                if(self.music == false){Text (" ")}
//            VStack
//            {
//                Text("Volume Control")
//                    .font(.title).fontWeight(.medium)
//                VolumeSlider().padding()
//                VolumeSlider1()
//            }
//            .padding(.bottom, 30)
            }
            }
            //.padding(.top, -30)
        }.environment(\.colorScheme, .dark)
        }.clipShape(CustomBezel())
        }.onAppear(perform: {
            if(self.category == "Deep Focus" || self.category == "Sleep")
               {
                self.music = true
               }
            //GlobalPlayer.sharedInstance.spotifyAuth = false;
        })
        .background(Image("bgLB"))
        //.padding(.top, -30)
    }
}

struct CustomBezel : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 55, height: 100))
        
        return Path(path.cgPath)
    }
}

struct BackgroundMusicEdit_Previews: PreviewProvider {
    static var previews: some View {
        Text("there's nothing")
    }
}
