//
//  PaymentBuffer.swift
//  LifeBeats
//
//  Created by User on 9/10/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//

import SwiftUI
import Purchases

struct PaymentBuffer: View {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @State var showAlert : Bool = false
    @State var processing : Bool = false
    func processPurchase()
    {
        print("1")
        //add
        var skProduct : SKProduct?
        var productID : String? = "oyslb1"
        
        self.processing = true
        
        
        Purchases.shared.products([productID!]){ products in
            
            if !products.isEmpty{
                skProduct = products[0]
                
                Purchases.shared.purchaseProduct(skProduct!)
                    {
                    (transaction, purchaseinfo, error, userCancelled)
                    in
                    if error == nil && !userCancelled
                    {
                        print("purchase success")
                        delegate.premium = true
                        self.showAlert = true
                        self.processing = false
                        print(self.showAlert)
                    }
                }
                
            }
        }
        
    }
    var body: some View {
        NavigationView {
        VStack{
            HStack(alignment: .top, spacing: 0)
            {
                Text("Unlock Lifebeats Premium").font(Font.custom("Nexa Bold", size: 24))
                    .fontWeight(.heavy)
            }.padding()
            VStack{
                Text("Now completely free for one year").font(Font.custom("Nexa Bold", size: 20))
                    .fontWeight(.heavy)
            HStack
                {
                    Text("Get access to:").font(Font.custom("Nexa Bold", size: 16)).frame(width: UIScreen.main.bounds.width/1.2 , alignment: .leading)
            }.padding(.top, 5)
                ScrollView{
                VStack
                    {
                        Text("-All mindfulness sessions\n-Expanded soundscapes library for Meditation,\n Sleep and Deep Focus\n-Exclusive member discounts with\n partners of Lifebeats (soon to launch!)\n-And many many more upcoming benefits!").font(Font.custom("Nexa Bold", size: 13))
                }.padding()
                }
                VStack
                    {
                    HStack
                    {
                        Button(action: {processPurchase()})
                        {
                                Text("Get my 1 free year now").font(Font.custom("Nexa Bold", size: 16))
                            .padding()
                        }.foregroundColor(.white)
                        .background(Color.gray).clipShape(FeelingBubble())
                    }.padding()
//                    Text("Start with a 1 year free trial").font(Font.custom("Nexa Bold", size: 16))
                    Text("$99.99").font(Font.custom("Nexa Bold", size: 16)).strikethrough(true, color: .white)
                    Text("Only $46.99/year after. Cancel anytime").font(Font.custom("Nexa Bold", size: 16))
                }.padding(.leading, 10).padding(.top, 10)
            }
//            VStack{
//            HStack
//            {
//                Button(action: {processPurchase()})
//                {
//                        Text("Get my 1 free year now").font(Font.custom("Nexa Bold", size: 16))
//                    .padding()
//                }.foregroundColor(.white)
//                .background(Color.gray).clipShape(FeelingBubble())
//            }.padding()
//                Text("Only $46.99/year after. Cancel anytime").font(Font.custom("Nexa Bold", size: 16))
//            .padding()
//            }
            VStack
            {
                if(self.processing == true)
                {
                    Text("Processing...").font(Font.custom("Nexa Bold", size: 16))
                }

            }
        }.padding(.bottom, UIScreen.main.bounds.height/6)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Purchase Success").font(Font.custom("Nexa Bold", size: 20)), message: Text("Kindly please restart the app. If you experience any issues after, restart again. Should any issues appear, please contact us at admin@lifebeats.co").font(Font.custom("Nexa Bold", size: 16)), dismissButton: .default(Text("OK")))
                
                }
            
        }.environment(\.colorScheme, .dark)
    }
}

struct PaymentBuffer_Previews: PreviewProvider {
    static var previews: some View {
        PaymentBuffer()
    }
}
