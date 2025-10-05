//
//  ChatFeelings.swift
//  LifeBeats
//
//  Created by User on 7/10/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI

//struct ChatFeelings: View {
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false)
//        {
//            HStack{
//                Text("Angry").padding().foregroundColor(.white).background(Color.gray)
//                    .clipShape(FeelingBubble()).frame(width:100)
//                Text("Fine").padding().foregroundColor(.white).background(Color.gray)
//                .clipShape(FeelingBubble()).frame(width:100)
//                Text("Stressed").padding().foregroundColor(.white).background(Color.gray)
//                .clipShape(FeelingBubble()).frame(width:100)
//                Text("Down").padding().foregroundColor(.white).background(Color.gray)
//                .clipShape(FeelingBubble()).frame(width:100)
//            }
//        }.frame(height: 80)
//
//    }
//}

struct FeelingBubble:Shape
{
    func path(in rect: CGRect) -> Path {
        let path=UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.topLeft, .bottomLeft,.bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}

struct ChatFeelings_Previews: PreviewProvider {
    static var previews: some View {
        Text("D")
    }
}
