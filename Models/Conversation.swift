//
//  Conversation.swift
//  LifeBeats
//
//  Created by User on 3/13/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct conversationLines : Hashable, Codable, Identifiable
{
    var id: Int
    var line: String
    var use: Use
    var arrayId: Int?
    
enum Use: String, CaseIterable, Codable, Hashable {
    case greeting = "Greeting"
    case farewell = "Farewell"
    case firsrReply = "First Reply"
}
    
}
