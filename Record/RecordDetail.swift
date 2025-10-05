////
////  RecordDetail.swift
////  Lifebeats
////  Copyright © 2020 Life beats Inc. All rights reserved.
////  Created by User on 3/3/20.
//
//
//import SwiftUI
//
//struct RecordDetail: View {
//    let record: Record
//    @State var dataToShow = \Record.Observation.mood
//    
//    var buttons = [
//        ("Mood", \Record.Observation.mood),
//        ("Meditation", \Record.Observation.meditation),
//        ("Sleep", \Record.Observation.sleep),
//    ]
//    
//    var body: some View {
//        return VStack {
//            RecordGraph(record: record, path: dataToShow)
//                .frame(height: 130)
//            
//            HStack(spacing: 25) {
//                ForEach(buttons, id: \.0) { value in
//                    Button(action: {
//                        self.dataToShow = value.1
//                    }) {
//                        Text(value.0)
//                            .font(.system(size: 15))
//                            .foregroundColor(value.1 == self.dataToShow
//                                ? Color.gray
//                                : Color.accentColor)
//                            .animation(nil)
//                    }
//                }
//            }
//            .padding(.top,10)
//
//            
//        }
//    }
//}
//
//struct RecordDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RecordDetail(record: recordData[0])
//    }
//}
