//
//  RequestReview.swift
//  LifeBeats
//
//  Created by User on 1/24/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import StoreKit


struct RequestReview: View {
    var body: some View {
        Button(action:{if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
            
        }}){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)}
    }
}

struct RequestReview_Previews: PreviewProvider {
    static var previews: some View {
        RequestReview()
    }
}
