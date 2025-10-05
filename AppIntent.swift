//
//  AppIntent.swift
//  LifeBeats
//
//  Created by User on 1/22/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import Foundation
import Intents

class AppIntent
{
    class func allowSiri()
    {
        INPreferences.requestSiriAuthorization{status in
            switch status
            {
            case .notDetermined,
                 .restricted,
                .denied:
                print("Siri error")
            case .authorized:
                print("Siri success")
            @unknown default:
                print("unknown")
            
            }
        }
    }
    
    
    class func todayAchievements()
    {
        let intent = ReviewTodayAchievementsIntent()
        intent.suggestedInvocationPhrase = "Minutes on Lifebeats"
        intent.shortcutAvailability = .sleepMindfulness
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate
        {
            error in
            if let error = error as NSError?
            {
                print("siri donation error \(error.description)")
            }
            else
            {
                print("siri donation success")
            }
        }
    }
}
