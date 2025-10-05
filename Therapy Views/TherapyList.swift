////
////  TherapyList.swift
////  Lifebeats
////  Copyright © 2020 Life beats Inc. All rights reserved.
////  Created by User on 3/6/20.
//
//
//import SwiftUI
//
//struct TherapyList<DetailView: View>: View {
//    @EnvironmentObject private var userData: UserData
//    
//    let detailViewProducer: (Therapy) -> DetailView
//    
//    var body: some View {
//        List {
//            Toggle(isOn: $userData.showFavoritesOnly) {
//                Text("Show LifeBeat's Featured Only")
//            }
//            
//            ForEach(userData.therapies) { therapy in
//                if !self.userData.showFavoritesOnly || therapy.isFavorite {
//                    NavigationLink(
//                    destination: self.detailViewProducer(therapy).environmentObject(self.userData))
//                     {
//                        TherapyRow(therapy: therapy)
//                            .frame(height: 70)
//                    }
//                }
//            }
//        }
//        .navigationBarTitle(Text("Therapies"))
//    }
//}
//
//#if os(watchOS)
//typealias PreviewDetailView = WatchTherapyDetail
//#else
//typealias PreviewDetailView = TherapyDetail
//#endif
//
//struct TherapyList_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        
//        Text("123")
//        
////  TherapyList { PreviewDetailView(therapy: $0) }
////            .environmentObject(UserData())
//    }
//}
