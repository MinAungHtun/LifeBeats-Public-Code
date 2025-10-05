//
//  ContentView.swift
//  DynamicIslandDemo
//
//  Created by Mohammad Azam on 9/9/22.
//

import SwiftUI
import ActivityKit

enum ImageFrame: CGFloat {
    case collapse = 30
    case expanded = 80
}

@available(iOS 16.1, *)
struct DyanmicIslandContent: View {
    
    @State private var activity: Activity<WidgetAttribute>? = nil
    
    var body: some View {
        VStack {
            Button(action:{
                let attribute = WidgetAttribute(therapyId: 1, therapyName: "hti")
                let state = WidgetAttribute.ContentState(status: .play)
                activity = try? Activity<WidgetAttribute>.request(attributes: attribute, contentState: state, pushType: nil)
                
            }){
                Text("Start Dynamic Island")
            }
            Spacer()
        }
    }
}

@available(iOS 16.1, *)
struct DynamicIslandView: View {
    
//    @Binding var expanded: Bool
//
//    var body: some View {
//        if #available(iOS 15.0, *) {
//            VStack {
//
//                HStack {
//                    Image("Lifebeats")
//                        .resizable()
//                        .frame(width: expanded ? ImageFrame.expanded.rawValue: ImageFrame.collapse.rawValue, height: expanded ? ImageFrame.expanded.rawValue: ImageFrame.collapse.rawValue)
//                        .clipShape(Circle())
//                        .padding(10)
//
//                    if expanded {
//                        VStack(alignment: .leading) {
//                            Text("Batman")
//                                .font(.title)
//                            Text("Under the red hood")
//                                .opacity(0.5)
//                        }.foregroundColor(.white)
//                    }
//
//                    Spacer()
//                    Image(systemName: "chart.bar.fill")
//                        .foregroundColor(.white)
//                        .padding(10)
//                }
//
//                if expanded {
//                    HStack {
//                        Image(systemName: "backward.fill")
//                        Image(systemName: "play.fill")
//                        Image(systemName: "forward.fill")
//
//                    }.foregroundColor(.white)
//                        .font(.title)
//                }
//
//            }.frame(maxWidth: .infinity, maxHeight: expanded ? 200: 60)
//                .contentShape(Rectangle())
//                .onTapGesture {
//                    withAnimation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 1.0)) {
//                        expanded.toggle()
//                    }
//                }
//                .background {
//                    Color.black
//                }
//                .clipShape(RoundedRectangle(cornerRadius: 40.0, style: .continuous))
//                .padding()
//        } else {
//            // Fallback on earlier versions
//        }
//    }
    @State private var activity: Activity<WidgetAttribute>? = nil
    
    var body: some View {
        VStack {
            Button(action:{
                let attribute = WidgetAttribute(therapyId: 1, therapyName: "hti")
                let state = WidgetAttribute.ContentState(status: .play)
                activity = try? Activity<WidgetAttribute>.request(attributes: attribute, contentState: state, pushType: nil)
                
            }){
                Text("Start Dynamic Island")
            }
            Spacer()
        }
    }
}


//struct DyanmicIslandContent: View {
//    
//    @State private var expanded: Bool = false
//    
//    var body: some View {
//        VStack {
//            DynamicIslandView(expanded: $expanded)
//            Spacer()
//        }
//    }
//}

//struct DynamicIslandContent_Previews: PreviewProvider {
//    static var previews: some View {
//        
//    }
//}
