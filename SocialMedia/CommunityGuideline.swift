//
//  CommunityGuideline.swift
//  LifeBeats
//
//  Created by User on 10/9/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct CommunityGuideline: View {
    var body: some View {
        VStack{
            ScrollView{
            Text("Community Guidelines").font(.title).padding()
            Text("The Lifebeats Community Group is designed for all users of Lifebeats to engage with each other and share experiences on mindfulness, stress management, anxiety relief and all mental wellness topics.\nWhile we aim to ensure an open and free discussion platform, we are obliged to enforce certain rules and regulations to ensure a safe and secure environment for all Lifebeats users.\nShould you have been found to violate any of the rules below, our moderators will have the right to remove you from the group and restrict your access till further notice.\nRules\nRule 1\nRemember the human. Our Community Group is a place for creating community and belonging, not for attacking marginalized or vulnerable groups of people. Everyone has a right to use our Community Group free of harassment, bullying, and threats of violence. Users that incite violence or that promote hate based on identity or vulnerability will be banned\nRule 2\nPost authentic content where you have a personal interest, and do not cheat or engage in content manipulation (including spamming, vote manipulation, ban evasion, or subscriber fraud) or otherwise interfere with or disrupt with the Community Group.\nRule 3\nRespect the privacy of others. Instigating harassment, for example by revealing someone’s personal or confidential information, is not allowed. Never post or threaten to post intimate or sexually-explicit media of someone.\nRule 4\nDo not post or encourage the posting of sexual or suggestive content.\nRule 5\nYou don’t have to use your real name to use Lifebeats or our Community Group, but don’t impersonate an individual or an entity in a misleading or deceptive manner.\nRule 6\nKeep it legal, and avoid posting illegal content or soliciting or facilitating illegal or prohibited transactions.\nRule 7\nDon’t break the site or do anything that interferes with normal use of Lifebeats. Enforcement \nWe have a variety of ways of enforcing our rules, including, but not limited to \n* Asking you nicely to knock it off \n* Asking you less nicely \n* Temporary or permanent suspension of accounts \n* Removal of privileges from, or adding restrictions to, accounts \n* Removal of content ").padding()
            }
        }
    }
}

struct CommunityGuideline_Previews: PreviewProvider {
    static var previews: some View {
        CommunityGuideline()
    }
}
