//
//  CrytoExchange.swift
//  LifeBeats
//
//  Created by User on 2/11/22.
//  Copyright © 2022 Life Beats Inc. All rights reserved.
//

import SwiftUI
import CodeScanner
import Photos
import Firebase


struct CrytoExchange: View {
    
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")!
    @State var isPresentingScanner = false
    @State var scannedCode: String = " "
    @State var messageText: String = " "
    @State var receiving: String = " "
    @State var receivingInt: Int = 0
    //let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    func processInt (text : String)
    {
        print("TIS \(text)")
        let dummy = (text as NSString).integerValue
        let value = dummy/1000
        print("TIS \(dummy ?? 4)")
        self.receiving = String(value)
        
        let docRef = db.collection("Users").document(uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()

                let ref = self.db.collection("Users").document(self.uid).setData([ "ExchangeAmount" : self.receiving ], merge: true){ err in
                                if let err = err {
                                    print("Error adding document: \(err)")
                                } else {
                                    //print("Document added with ID: \(ref!.documentID)")
                                    print("added1")
                                    

                                }
                            }
            }
        }
    }
    
    var body: some View {
        
        
        ScrollView(.vertical, showsIndicators: false){
        VStack{
            
            ZStack
            {
                Circle()//.background(Color.white)
                Text("300 in-game Coin").font(Font.custom("Nexa Bold", size: 16)).foregroundColor(Color.black)
            }.padding().frame(height: 200 )
            
            ZStack{
                RatesBG().frame(height: 80).foregroundColor(.blue)
            HStack
            {
                Text("1 LifeBeats Coin")                    .font(Font.custom("Nexa Bold", size: 12)).padding()
                Text("0.001 in game Coin")                    .font(Font.custom("Nexa Bold", size: 12))
            }
            }
            
            Button(action:{self.isPresentingScanner = true})
            {
                Text("Scan your crypto wallet QR code")                    .font(Font.custom("Nexa Bold", size: 12))
            }.padding()
            
            Text("Your crypto wallet address:")                    .font(Font.custom("Nexa Bold", size: 12))
            
            Text(self.scannedCode)                    .font(Font.custom("Nexa Bold", size: 12))
                .padding()
            
            ZStack{
                RatesBG().frame(height: 180).foregroundColor(.blue)
                VStack{
                    Text("Rate")                    .font(Font.custom("Nexa Bold", size: 14))
                        .font(.title2)
            HStack{
            Text("In game coin:")                    .font(Font.custom("Nexa Bold", size: 12)).padding()
                Text("1000").font(Font.custom("Nexa Bold", size: 12)).padding()
            }
            
            HStack{
            Text("LifeBeats coin:")                    .font(Font.custom("Nexa Bold", size: 12)).padding()
                Text("1")                    .font(Font.custom("Nexa Bold", size: 12)).padding()
            }.padding(.trailing, 25)}
            }
            
            HStack{
            Text("Exchanging:")                    .font(Font.custom("Nexa Bold", size: 12))
                TextField("", text: $messageText)// formatter: NumberFormatter())
                    .keyboardType(.numberPad)
                    .frame(height: 50).padding(.leading, 5).foregroundColor(.blue).background(RatesBG())
                

            }.padding()
            Button(action:{
                
               // self.receivingInt = Int(self.messageText) ?? 0
                print("TIS \(messageText)")
                
processInt(text: messageText)
                //self.receiving = self.receivingInt*3
                
                
                let docRef = db.collection("Users").document(uid)
                docRef.getDocument { (document, error) in
                    if let document = document, document.exists {
                        let docData = document.data()

                        let ref = self.db.collection("Users").document(self.uid).setData([ "cryptoAddress" : self.scannedCode ], merge: true){ err in
                                        if let err = err {
                                            print("Error adding document: \(err)")
                                        } else {
                                            //print("Document added with ID: \(ref!.documentID)")
                                            print("added1")
                                            

                                        }
                                    }
                        
                        let ref1 = self.db.collection("Users").document(self.uid).setData([ "exchangeAlert" : true ], merge: true){ err in
                                        if let err = err {
                                            print("Error adding document: \(err)")
                                        } else {
                                            //print("Document added with ID: \(ref!.documentID)")
                                            print("added1")
                                            

                                        }
                                    }
                    }
                    else {
                        print("Document does not exist")
                    }
                }})
            {
            ZStack{     Circle().foregroundColor(.blue).frame(height: 30)
                Image(systemName: "arrow.up.arrow.down").foregroundColor(.white)
            }}
            HStack{
            Text("Receiving:")                    .font(Font.custom("Nexa Bold", size: 16)).padding()
                Text(self.receiving)                    .font(Font.custom("Nexa Bold", size: 16)).padding()
            }
            Text("Exchange starts 1000 in game coin minimum. Exchange at your own risk")              .font(Font.custom("Nexa Bold", size: 12)).padding()
            
        }.padding(.bottom, UIScreen.main.bounds.height/10)
        .sheet(isPresented: $isPresentingScanner) {
                        CodeScannerView(codeTypes: [.qr]) { response in
                            if case let .success(result) = response {
                                scannedCode = result.string
                                isPresentingScanner = false
                            }
                        }
            
                    }
        
//        .onReceive (timer){ _ in
//            self.receivingInt = Int(self.messageText) ?? 0
//            //self.receiving = self.receivingInt*3
//            //print(self.messageText)
//            //print("1")
//        }
        }//.background(Color.gray)
    }
}

struct CrytoExchange_Previews: PreviewProvider {
    static var previews: some View {
        CrytoExchange()
    }
}
