////
////  RecordView.swift
////  Lifebeats
////  Copyright © 2020 Life beats Inc. All rights reserved.
////  Created by User on 3/3/20.
//
//import SwiftUI
//
//struct RecordView: View {
//    var record: Record
//    @State private var showDetail = false
//    
//    var transition: AnyTransition {
//        let insertion = AnyTransition.move(edge: .leading)
//            .combined(with: .opacity)
//        let removal = AnyTransition.scale
//            .combined(with: .opacity)
//        return .asymmetric(insertion: insertion, removal: removal)
//    }
//    
//    var body: some View {
//        VStack {
//            HStack {
//                RecordGraph(record: record, path: \.mood)
//                    .frame(width: 50, height: 30)
//                    .animation(nil)
//                
//                VStack(alignment: .leading) {
//                    Text(record.name)
//                        .font(.headline)
//                    Text(record.distanceText)
//                }
//                
//                Spacer()
//
//                Button(action: {
//                    withAnimation {
//                        self.showDetail.toggle()
//                    }
//                }) {
//                    Image(systemName: "chevron.right.circle")
//                        .imageScale(.large)
//                        .rotationEffect(.degrees(showDetail ? 90 : 0))
//                        .scaleEffect(showDetail ? 1.5 : 1)
//                        .padding()
//                }
//            }.padding(.bottom, 40)
//
//            if showDetail {
//                RecordDetail(record: record)
//                    .transition(transition)
//            }
//        }
//    }
//}
//
//struct RecordView_Previews: PreviewProvider {
//    static var previews: some View {
//        VStack {
//        RecordView(record: recordData[0])
//                .padding()
//            Spacer()
//        }
//    }
//}
