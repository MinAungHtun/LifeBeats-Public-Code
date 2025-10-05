/*

Abstract:
A model object that stores app data.
*/
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var therapies = therapyData
    //@Published var profile = Profile.default
    @Published var bgTracks = bgTrackData
    @Published var conversations = conversationData
}
