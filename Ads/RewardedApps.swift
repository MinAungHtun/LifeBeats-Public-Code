//
//  RewardedApps.swift
//  LifeBeats
//
//  Created by User on 1/4/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import GoogleMobileAds

struct RewardedApps: View {
    
    @State var rewarded:GADRewardBasedVideoAd!
    
    var body: some View {
        
        Button(action:{
                if self.rewarded.isReady
        {
            let root = UIApplication.shared.windows.first?.rootViewController
            self.rewarded.present(fromRootViewController: root!)
        }
        })
        {
            Text("Ads").font(Font.custom("Nexa Bold", size: 16))
        }
            .onAppear(perform: {
                
                self.rewarded = GADRewardBasedVideoAd()
                let req = GADRequest()
                self.rewarded.load(req, withAdUnitID: "ca-app-pub-2549645746750255/7262967641")
            })
    }
}


struct NewRewardedApps: View
{
   @State var rewardedAd: GADRewardedAd?
    let delegate = UIApplication.shared.connectedScenes.first?.delegate as! SceneDelegate
    
    var body: some View
    {
        Text("T").font(Font.custom("Nexa Bold", size: 16)).onAppear(perform: {
            self.rewardedAd = GADRewardedAd(adUnitID: "ca-app-pub-3940256099942544/1712485313")
            self.rewardedAd?.load(GADRequest()) { error in
                if let error = error {
                  // Handle ad failed to load case.
                } else {
                    if self.rewardedAd?.isReady == true {
                        let root = UIApplication.shared.windows.first?.rootViewController
                        self.rewardedAd?.present(fromRootViewController: root!, delegate: delegate)
                    }
                }
              }
        })
    }
}

struct RewardedApps_Previews: PreviewProvider {
    static var previews: some View {
        RewardedApps()
    }
}
