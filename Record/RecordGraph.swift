////
////  RecordGraph.swift
////  Lifebeats
////  Copyright © 2020 Life beats Inc. All rights reserved.
////  Created by User on 3/3/20.
//
//
//import SwiftUI
//
//func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
//    where C.Element == Range<Double> {
//    guard !ranges.isEmpty else { return 0..<0 }
//    let low = ranges.lazy.map { $0.lowerBound }.min()!
//    let high = ranges.lazy.map { $0.upperBound }.max()!
//    return low..<high
//}
//
//func magnitude(of range: Range<Double>) -> Double {
//    return range.upperBound - range.lowerBound
//}
//
//extension Animation {
//    static func ripple(index: Int) -> Animation {
//        Animation.spring(dampingFraction: 0.5)
//            .speed(2)
//            .delay(0.03 * Double(index))
//    }
//}
//
//struct RecordGraph: View {
//    var record: Record
//    var path: KeyPath<Record.Observation, Range<Double>>
//    
//    var color: Color {
//        switch path {
//        case \.mood:
//            return .green
//        case \.meditation:
//            return Color(hue: 0, saturation: 0.5, brightness: 0.7)
//        case \.sleep:
//            return Color(hue: 0.7, saturation: 0.4, brightness: 0.7)
//        default:
//            return .black
//        }
//    }
//    
//    var body: some View {
//        let data = record.observations
//        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: self.path] })
//        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
//        let heightRatio = (1 - CGFloat(maxMagnitude / magnitude(of: overallRange))) / 2
//
//        return GeometryReader { proxy in
//            HStack(alignment: .bottom, spacing: proxy.size.width / 120) {
//                ForEach(data.indices) { index in
//                    GraphCapsule(
//                        index: index,
//                        height: proxy.size.height,
//                        range: data[index][keyPath: self.path],
//                        overallRange: overallRange)
//                    .colorMultiply(self.color)
//                    //.transition(.slide)
//                    .animation(.ripple(index: index))
//                }
//                .offset(x: 0, y: proxy.size.height * heightRatio)
//            }
//        }
//    }
//}
//
//struct RecordGraph_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RecordGraph(record: recordData[0], path: \.mood)
//                .frame(height: 200)
//            RecordGraph(record: recordData[0], path: \.meditation)
//                .frame(height: 200)
//            RecordGraph(record: recordData[0], path: \.sleep)
//                .frame(height: 200)
//        }
//    }
//}
