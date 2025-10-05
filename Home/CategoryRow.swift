//
//  CategoryRow.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/3/20.


import SwiftUI

struct CategoryRow: View {
     var categoryName: String
       var items: [Therapy]
    var premium : Bool
    {
        get {
            return (UIApplication.shared.delegate as? AppDelegate)!.premium
                    }

    }
       
       var body: some View {
            VStack(alignment: .leading) {
                      Text(self.categoryName).font(Font.custom("Nexa Bold", size: 16))
                          
                        .fontWeight(.bold)
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
                              }
                          }
                      }

                  }
            //.frame(height: 220)
       }
}

struct CategoryItem: View {
    var therapy: Therapy
    var body: some View {
        VStack(alignment: .leading) {
            Image(therapy.sqImName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(LocalizedStringKey(therapy.name)).font(Font.custom("Nexa Bold", size: 12))
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct ColumnCategoryItem: View {
    var therapy: Therapy
    var body: some View {
        VStack(alignment: .leading) {
            Image(therapy.sqImName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 175, height: 155)
                .cornerRadius(5)
            Text(therapy.name).font(Font.custom("Nexa Bold", size: 12))
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
        .padding(.trailing, 5)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    
        static var previews: some View {
        
         CategoryRow(
                   categoryName: therapyData[0].category.rawValue,
                   items: Array(therapyData.prefix(4))
               )
               .environmentObject(UserData())
    }
}
