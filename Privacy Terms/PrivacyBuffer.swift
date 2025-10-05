//
//  PrivacyBuffer.swift
//  LifeBeats
//
//  Created by User on 2/9/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI

struct PrivacyBuffer: View {
    var body: some View {
        List{
        NavigationLink(destination: PrivacyTerms())
        {
            Text("Privacy Policy").foregroundColor(.white).padding()
        }
        NavigationLink(destination: TermsOfUse())
        {
            Text("Terms of Use").foregroundColor(.white).padding()
        }
        VStack{
            Text("Contact us at admin@lifebeats.co").padding()
            Text("  Find out more at https://lifebeats.co").padding()
        }
        }
    }
}

struct PrivacyBuffer_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyBuffer()
    }
}
