//
//  HolmesorWatson.swift
//  LifeBeats
//
//  Created by User on 5/22/21.
//  Copyright © 2021 Life Beats Inc. All rights reserved.
//

import SwiftUI
import HealthKit
import Firebase

struct HolmesorWatson: View {
    let healthStore = HKHealthStore()
    let db = Firestore.firestore()
    let uid = UserDefaults.standard.string(forKey: "UID")
    @State var watson = 0
    @State var sympton = " "
    @State var widget1 : Bool = false
    
    func authorizeHealthKit()
    {
        
        let readData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!])
        let shareData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!

        ])


        healthStore.requestAuthorization(toShare: shareData, read: readData) { (success, error) in
            if !success {
                // Handle the error here.
                print("unsuccessful")
            }
            else
            {
                self.fetchHeartRate()
            }
        }
    }

    func fetchHeartRate()
    {
        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else
        {
            return
        }

        guard let sampleType2 = HKObjectType.quantityType(forIdentifier: .respiratoryRate) else
        {
            return
        }

        let startDate = Calendar.current.date(byAdding: .minute, value: -5, to: Date())
        
        var hkArray: [HKQuantitySample] = []
        var hkQuantityArray: [Double] = []
        var hkArray1: [HKQuantitySample] = []
        var hkQuantityArray1: [Double] = []
            
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)

        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)

        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
            {
            (sample, result, error) in
            guard error == nil else{return}
            guard result != nil else{return}
            print(result ?? "nothing")
            let unit = HKUnit(from: "count/min")
            //60-100
            
            if(result!.count != 0)
            {
            for i in 0...result!.count-1
            {
                
                hkArray.append(result![i] as! HKQuantitySample)
                hkQuantityArray.append(hkArray[i].quantity.doubleValue(for: unit))
                print(hkArray[i])
                print(hkQuantityArray[i])
                if(hkQuantityArray[i] < 60 || hkQuantityArray[i] > 100)
                {
febeIntro()
                }
            }
            }
            
            
        }
        
        let query2 = HKSampleQuery(sampleType: sampleType2, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
            {
            (sample, result, error) in
            guard error == nil else{return}
            guard result != nil else{return}
            print(result ?? "nothing")

            let unit = HKUnit(from: "count/min")
            //12-16
            if(result!.count != 0)
            {
            for i in 0...result!.count-1
            {
                hkArray1.append(result![i] as! HKQuantitySample)
                hkQuantityArray1.append(hkArray1[i].quantity.doubleValue(for: unit))
                print(hkArray1[i])
                print(hkQuantityArray1[i])
                if(hkQuantityArray1[i] < 12 || hkQuantityArray1[i] > 16)
                {
febeIntro()
                }
            }
            }
        }
        healthStore.execute(query)
        healthStore.execute(query2)
    }
    
    func febeIntro()
    {
        let docRef = db.collection("Users").document(uid!)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let docData = document.data()
                let ad = docData!["1.9.1Introduced"] as? Bool ?? false
                if(ad == true)
                {
                    self.watson = 1
                }
            } else {

                print("Document does not exist")
            }
        }
    }
   // let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        if(self.watson == 0)// && self.widget1 == false)
        {
        CategoryHome().environmentObject(UserData()).environment(\.colorScheme, .dark)
            
//            .onOpenURL(perform: { (url) in
//                print(url)
//                self.widget1 = true;
//                        })
            .onAppear(perform: {
                authorizeHealthKit()
            })
            
        }
//        else if(self.widget1 == true)
//        {
//            Text("1")
//        }
        
        else if(self.watson == 1)
        {
           NavigationView {
            WatsonHKDiagnosis().environmentObject(UserData()).environment(\.colorScheme, .dark).onAppear(perform: {
                let userName = UserDefaults.standard.integer(forKey: "HKFinished")
                if(userName == 1)
                {
                    self.watson = 0;
                    //self.timer.upstream.connect().cancel()
                }
            })
            }.environment(\.colorScheme, .dark)
//                .onReceive(timer) { _ in
//
//                    let userName = UserDefaults.standard.integer(forKey: "HKFinished")
//                    if(userName == 1)
//                    {
//                        self.watson = 0;
//                        self.timer.upstream.connect().cancel()
//                    }
//                }

        }
    }
    
    
}

struct HolmesorWatson_Previews: PreviewProvider {
    static var previews: some View {
        HolmesorWatson()
    }
}
