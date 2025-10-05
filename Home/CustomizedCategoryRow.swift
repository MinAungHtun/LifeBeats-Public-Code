//
//  CustomizedCategoryRow.swift
//  LifeBeats
//
//  Created by User on 9/8/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct CustomizedCategoryRow: View {
    //@EnvironmentObject var userData: UserData
    var name: LocalizedStringKey
    var items: [Therapy]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.name).font(Font.custom("Nexa Bold", size: 16))
        .fontWeight(.heavy)
          .padding(.leading, 15)
          .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0){
            
            ForEach(self.items) { therapy in
                
                
               NavigationLink(
                    destination: TherapyDetail(
                        therapy: therapy
                    ).environmentObject(UserData())
                ) {
                    CategoryItem(therapy: therapy)
               }
                //NavigationLink(destination: EmptyView(), label: {})
//                NavigationLink(destination: EmptyView()) {
//                    EmptyView()
//                }
//                NavigationLink(destination: EmptyView()) {
//                    EmptyView()
//                }
            }
                }
            }
        }
       //.frame(height: 220)
    }
}


struct CategoryRowFebe: View {
    //@EnvironmentObject var userData: UserData
    var name: String
    var indx: Int
    var items: [Therapy]
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.name).font(Font.custom("Nexa Bold", size: 16))
        .fontWeight(.heavy)
          .padding(.leading, 15)
          .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0){
            
            ForEach(self.items) { therapy in
                
                
                Button(action:{GlobalPlayer.sharedInstance.febeIndx = indx;GlobalPlayer.sharedInstance.febeTrigged = true})
                {
                    CategoryItem(therapy: therapy)
               }
                //NavigationLink(destination: EmptyView(), label: {})
//                NavigationLink(destination: EmptyView()) {
//                    EmptyView()
//                }
//                NavigationLink(destination: EmptyView()) {
//                    EmptyView()
//                }
            }
                }
            }
        }
       //.frame(height: 220)
    }
}

struct TherapyRowFebe: View {
    //@EnvironmentObject var userData: UserData
    var name: String
    //var items: [Therapy]
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        VStack(alignment: .leading){
            Text(self.name).font(Font.custom("Nexa Bold", size: 16))
        .fontWeight(.heavy)
          .padding(.leading, 15)
          .padding(.top, 5)
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 0){
            

                
                
                Button(action:{GlobalPlayer.sharedInstance.febeIndx = 16;GlobalPlayer.sharedInstance.febeTrigged = true})
                {
                    CategoryItem(therapy: userData.therapies[16])
               }
                Button(action:{GlobalPlayer.sharedInstance.febeIndx = 17;GlobalPlayer.sharedInstance.febeTrigged = true})
                {
                    CategoryItem(therapy: userData.therapies[17])
               }
                Button(action:{GlobalPlayer.sharedInstance.febeIndx = 18;GlobalPlayer.sharedInstance.febeTrigged = true})
                {
                    CategoryItem(therapy: userData.therapies[18])
               }

            
                }
            }
        }
       //.frame(height: 220)
    }
}

struct CustomizedCategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return CustomizedCategoryRow(name: "Suggested For You",items: [userData.therapies[10], userData.therapies[17], userData.therapies[13], userData.therapies[18], userData.therapies[11]])
    }
}
