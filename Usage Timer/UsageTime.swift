//
//  UsageTime.swift
//  LifeBeats
//
//  Created by User on 1/5/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import Foundation
import Firebase


class UserTimer
{
    static let sharedInstance = UserTimer()
    var usageTimer: Timer?
    var oldTime: Int = 0
    let db = Firestore.firestore()
    var uTime: Int? = 0
//    var dateFS : String
//        {
//            get {
//                return (UIApplication.shared.delegate as? AppDelegate)!.dateFS
//            }
//        }
    
    func timerStarts()
    {
        usageTimer = Timer.scheduledTimer(withTimeInterval: 60, repeats: true) { [self] timer in
            
            print("Fired")
            self.uTime = UserDefaults.standard.integer(forKey: "usageTime") 
            UserDefaults.standard.set(self.uTime! + 1, forKey: "usageTime")
            print(self.uTime!)
        }
    }
    
    func timerStops()
    {
        usageTimer?.invalidate()
    }
}
