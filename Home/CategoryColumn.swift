//
//  CategoryColumn.swift
//  LifeBeats
//
//  Created by User on 5/4/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct CategoryColumn: View {
    
   // var name: String
//    var items: [Therapy]
//    var categories: [String: [Therapy]] {
//        Dictionary(
//            grouping: therapyData,
//            by: { $0.category.rawValue }
//        )
//    }
    @State private var expanded: Bool = false
    let userData = UserData()
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Browse Categories").font(Font.custom("Nexa Bold", size: 16))
        .fontWeight(.heavy)
          .padding(.leading, 15)
          .padding(.top, 5)
        
       // ScrollView(.horizontal, showsIndicators: false) {
            VStack{

                HStack(alignment: .top, spacing: 0){
                
                    NavigationLink(
                         destination: TherapyDetail(
                             therapy: userData.therapies[16]
                         ).environmentObject(UserData())
                     )
                    {
                    ColumnCategoryItem(therapy: userData.therapies[16])
                    }
                    NavigationLink(
                         destination: TherapyDetail(
                             therapy: userData.therapies[17]
                         ).environmentObject(UserData())
                     )
                    {
                    ColumnCategoryItem(therapy: userData.therapies[17])
                    }
                   
                }
                
            HStack(alignment: .top, spacing: 0){
                
                NavigationLink(
                     destination: TherapyDetail(
                         therapy: userData.therapies[18]
                     ).environmentObject(UserData())
                 )
                {
                    ColumnCategoryItem(therapy: userData.therapies[18])
                }
                NavigationLink(
                    destination: TherapyColumn(name: userData.therapies[36].name)
                 )
                {
                    ColumnCategoryItem(therapy: userData.therapies[36])
                }
                   
            }
                
            HStack(alignment: .top, spacing: 0){
            
                NavigationLink(
                    destination: TherapyColumn(name: userData.therapies[37].name)
                 )
                {
                    ColumnCategoryItem(therapy: userData.therapies[37])
                }
                NavigationLink(
                    destination: TherapyColumn(name: userData.therapies[38].name)
                 )
                {
                    ColumnCategoryItem(therapy: userData.therapies[38])
                }
            }
                HStack(alignment: .top, spacing: 0){
                    NavigationLink(
                        destination: TherapyColumn(name: userData.therapies[39].name)
                     )
                    {
                        ColumnCategoryItem(therapy: userData.therapies[39])
                    }
                    NavigationLink(
                        destination: TherapyColumn(name: userData.therapies[40].name)
                     )
                    {
                        ColumnCategoryItem(therapy: userData.therapies[40])
                    }
            }
                HStack(alignment: .top, spacing: 0){
                    NavigationLink(
                        destination: TherapyColumn(name: userData.therapies[44].name)
                     )
                    {
                        ColumnCategoryItem(therapy: userData.therapies[44])
                    }
            }
//                                NavigationLink(destination: FireStoree())
//                                {
//                                    Text("TTT")
//                                }.padding()
//                if #available(iOS 16.1, *) {
//                    NavigationLink(destination: DynamicIslandView())
//                    {
//                        Text("Dynamic Island")
//                    }.padding()
//                } else {
//                    // Fallback on earlier versions
//                    Text("Nothing")
//                }
//                
//                NavigationLink(destination: CrytoExchange())
//                                {
//                                    Text("Exchange")
//                                }.padding()
//                NavigationLink(destination: Febe2())
//                                {
//                                    Text("NewFebe")
//                                }.padding()
//                                NavigationLink(destination: WatsonView())
//                                                {
//                                                    Text("Febe1.5")
//                                                }.padding()
//                NavigationLink(destination: LifeTimer())
//                                {
//                                    Text("Timer")
//                                }.padding()
//                NavigationLink(destination: GoogleSearchView(searchWord: "xbox series"))
//                                {
//                                    Text("GoogleSearchAPItest")
//                                }.padding()
                
            }
            //}
        }
    }
}





struct CategoryColumn_Previews: PreviewProvider {
    static var previews: some View {
        Text("I")
        //CategoryColumn()
    }
}
