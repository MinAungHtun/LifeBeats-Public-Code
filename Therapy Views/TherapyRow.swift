//
//  TherapyRow.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 3/1/20.

import SwiftUI

struct TherapyRow: View {
    var therapy : Therapy
    var body: some View {
        HStack {
            Image(therapy.sqImName)
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.leading, 8)
                .padding(.bottom, 5)
                .padding(.top, 5)
            Text(therapy.name)
                .font(.headline)
            Spacer()
            if therapy.isFavorite {
                           Image(systemName: "heart.fill")
                               .imageScale(.medium)

                .foregroundColor(.red)
                            .padding(.trailing, 25)
                       }
        }
    }
}

struct TherapyRow_Previews: PreviewProvider {
    static var previews: some View {
        Group
        {
        TherapyRow(therapy: therapyData[0])
        TherapyRow(therapy: therapyData[1])
        }
        .previewLayout(.fixed(width: 300, height: 80))
    }
}
