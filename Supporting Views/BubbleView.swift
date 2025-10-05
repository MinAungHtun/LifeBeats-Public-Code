//
//  BubbleView.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 4/2/20.


import SwiftUI

struct BubbleView: View {
    var body: some View {
        Text("Something").padding().foregroundColor(.white).background(Color.blue)
                       .clipShape(Bubble(chat:false))
    }
}

struct RatesBG:Shape
{

    func path(in rect: CGRect) -> Path {
        let path=UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.topLeft, .bottomLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}



struct Bubble:Shape
{
    var chat:Bool
    func path(in rect: CGRect) -> Path {
        let path=UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.topLeft, chat ? .bottomLeft: .bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}

struct RoundedBubble:Shape
{

    func path(in rect: CGRect) -> Path {
        let path=UIBezierPath(roundedRect: rect, byRoundingCorners: [.topRight,.topLeft,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 20, height: 20))
        
        return Path(path.cgPath)
    }
}


struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
    }
}
