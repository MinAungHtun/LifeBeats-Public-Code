//
//  WidgetAttribute.swift
//  LifeBeats
//
//  Created by User on 11/6/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI
import ActivityKit

struct WidgetAttribute: ActivityAttributes {
   
    public typealias PlayingStatus = ContentState
    
    public struct ContentState: Codable,Hashable{
        var status: Status = .play
    }
    
    var therapyId : Int
    var therapyName : String
}

enum Status: String,CaseIterable,Codable,Equatable
{
    case play = "play.fill"
    case pause = "pause.fill"
    case pause1 = "pause"
}
