//
//  AdsView.swift
//  LifeBeats
//
//  Created by User on 10/2/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
// kGADAdSizeBanner

import SwiftUI
import GoogleMobileAds

struct AdsView: View {
    var body: some View {
        AdView().frame(height: 60)
    }
}

struct AdsView_Previews: PreviewProvider {
    static var previews: some View {
        AdsView()
    }
}


struct AdView: UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<AdView>) -> GADBannerView {
        let banner = GADBannerView(adSize: GADPortraitAnchoredAdaptiveBannerAdSizeWithWidth(UIScreen.main.bounds.width))
        banner.adUnitID = "ca-app-pub-2549645746750255/4299916470"
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: UIViewRepresentableContext<AdView>) {
        
    }
}
