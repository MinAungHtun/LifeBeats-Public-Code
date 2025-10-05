////
////  WatsonTherapyDetail.swift
////  Lifebeats
////  Copyright © 2020 Life beats Inc. All rights reserved.
////  Created by User on 4/7/20.
//
//
//import SwiftUI
//
//struct WatsonTherapyDetail: View {
//   @State var info:Int = 0
//   
//   @EnvironmentObject var userData: UserData
//    
//    //@Binding var isPresented: Bool
//    
//   
//   var therapy:Therapy
//    @State var duration : String = " "
//    @State var categoryName : String = " "
//   
//   var categories: [String: [bgTrack]] {
//       Dictionary(
//           grouping: bgTrackData,
//           by: { $0.category.rawValue }
//       )
//   }
//
//   var body: some View {
//       VStack{
//       if (self.info == 0)
//       {
//           VStack{
//            ScrollView(.vertical, showsIndicators: false){
//            LazyVStack{
//                   Text(therapy.category.rawValue)
//                   .font(.title)
//                   .fontWeight(.semibold).padding()
//                   .listRowInsets(EdgeInsets())
//                   
//               Text(therapy.name)
//                   .font(.headline)
//                .fontWeight(.semibold)
//                .padding()
//                   .listRowInsets(EdgeInsets())
//                   
//                Image(therapy.bufferImageName!).resizable().frame(width: UIScreen.main.bounds.width, height: 250)
//                   .listRowInsets(EdgeInsets())
//                   
//                Text(therapy.therapyDescription!).font(.body).fontWeight(.regular).padding(.leading, 10).padding(.top,10).padding()
//                   .listRowInsets(EdgeInsets())
//                   
//                   Text("Featured background soundscapes").font(.system(size: 20)).fontWeight(.bold).padding()
//                   .listRowInsets(EdgeInsets())
//                
//                   if (therapy.name == "Fitness Prep")
//                   {
//                       BGTracksCategoryRow(category: "Fitness Prep")
//                       .listRowInsets(EdgeInsets())
//                   }
//                   else
//                   {
//                       BGTracksCategoryRow(category: therapy.category.rawValue)
//                       .listRowInsets(EdgeInsets())
//                   }
//                   Button(action: {self.info = 1})
//                       {
//                           Text("Start Therapy")
//                               .foregroundColor(Color.blue)
//                           .listRowInsets(EdgeInsets())
//
//                   }.padding()
//               }
//           }
//           }.onDisappear(perform:
//                        {
//                            if(therapy.name == "10 mins Deep Focus")
//                            {
//                                GlobalPlayer.sharedInstance.therapySongURL = therapy.tenMinsUrl1
//                                GlobalPlayer.sharedInstance.subURL1 = therapy.tenMinsUrl2
//                                GlobalPlayer.sharedInstance.subURL2 = therapy.tenMinsUrl3
//                            }
//                            else if(therapy.name == "30 mins Deep Focus")
//                            {
//                                GlobalPlayer.sharedInstance.therapySongURL = therapy.thirtyMinsUrl1
//                                GlobalPlayer.sharedInstance.subURL1 = therapy.thirtyMinsUrl2
//                                GlobalPlayer.sharedInstance.subURL2 = therapy.thirtyMinsUrl3
//                                GlobalPlayer.sharedInstance.subURL3 = therapy.thirtyMinsUrl4
//                                GlobalPlayer.sharedInstance.subURL4 = therapy.thirtyMinsUrl5
//                            }
//                            else if(therapy.name == "15 mins Sleep")
//                            {
//                                GlobalPlayer.sharedInstance.therapySongURL = therapy.fifteenMinsUrl1
//                                GlobalPlayer.sharedInstance.subURL1 = therapy.fifteenMinsUrl2
//                                GlobalPlayer.sharedInstance.subURL2 = therapy.fifteenMinsUrl3
//                            }
//                            else
//                            {
//                                GlobalPlayer.sharedInstance.therapySongURL = therapy.url
//                            }                            
//                        })
//           .background(Color.black)
//       }
//       else if (self.info == 1)
//       {
//        VStack{
//           
//            ScrollView(.vertical, showsIndicators: false)
//            {
//                Text(therapy.name)
//                    .font(.title)
//                Text(self.duration)
//                    .font(.headline)
//                Text("1:32/15:00").padding()
//                VStack{
//                    
//                VStack{
//                    Text(self.therapy.therapyDescription!).font(.body).fontWeight(.regular).padding(.leading, 20).padding(.top,10).padding(.trailing, 20)
//                }
//        VStack
//        {
//            MusicPlayer(song: therapy.mp3Name, categoryName : self.categoryName, therapyName : self.therapy.name).frame(width: UIScreen.main.bounds.width/1.1, height: 270)
//        }
//        .padding(.top, 20)
//        .padding(.leading, 30)
//        .padding(.trailing, 30)
////                    NavigationLink(destination: SoundCloudMain())
////                    {
////                        Text("SoundCloud")
////                    }.padding(.bottom, 20)
////                  NavigationLink(destination: AppleMusicMain())
////                  {
////                      Text("AppleMusic")
////                  }.padding(.bottom, 20)
//                    NavigationLink(destination: SpotifyMain())
//                    {
//                        Text("Spotify")
//                    }.padding(.bottom, 20)
//                }.padding(.top, UIScreen.main.bounds.height/4)
//            }.padding(.leading, 10)
//            .padding(.trailing, 10)
//            
//        }.padding(.top, 50).background(GradientBackground().blur(radius: 5))
//           
//       }
//       }.onAppear(perform: {
//        if(therapy.name == "Fitness Prep")
//        {
//            self.categoryName = "Fitness Prep"
//        }
//        else if (therapy.name == "Deep Focus" || therapy.name == "Sleep" || therapy.name == "Meditation")
//        {
//            self.categoryName = therapy.name
//        }
//        else
//        {
//            self.categoryName = therapy.category.rawValue
//        }
//       })
//    .environment(\.colorScheme, .dark)
//       
//   }
//            
//}
//
//struct WatsonTherapyDetail_Previews: PreviewProvider {
//    static var previews: some View {
////         let userData = UserData()
////        return WatsonTherapyDetail(therapy: userData.therapies[0], isPresented: )
////                          .environmentObject(userData)
//        Text("What")
//    }
//}
