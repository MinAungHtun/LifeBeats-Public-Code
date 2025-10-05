////
////  HKTest.swift
////  LifeBeats
////
////  Created by User on 10/25/20.
////  Copyright © 2020 Life Beats Inc. All rights reserved.
////
//
//import SwiftUI
//import HealthKit
//
//struct HKTest: View {
//    let healthStore = HKHealthStore()
////    var BPM : String
////        {
////            get {
////                return (UIApplication.shared.delegate as? AppDelegate)!.BPM
////            }
////        }
//    @State var BPM : String = " "
//    
//    var body: some View {
//        VStack{
//        Text("\(self.BPM) BPM")
//        }
//        Button(action: authorizeHealthKit)
//        {
//            Text("HealthKit")
//        }.padding(.top, 20)
//    }
//    
//    
//    func authorizeHealthKit()
//    {
////        let readData = Set([HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)])
////        let shareData = Set([HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.heartRate)])
//        let readData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!,HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!])
//        let shareData = Set([HKObjectType.quantityType(forIdentifier: .heartRate)!,HKObjectType.quantityType(forIdentifier: .respiratoryRate)!
//                             
//        //                     ,HKCategoryType.categoryType(forIdentifier: .irregularHeartRhythmEvent)!
//        ])
//    
//        
//        healthStore.requestAuthorization(toShare: shareData, read: readData) { (success, error) in
//            if !success {
//                // Handle the error here.
//                print("unsuccessful")
//            }
//            else
//            {
//                self.fetchHeartRate()
//            }
//        }
//    }
//
//    func fetchHeartRate()
//    {
//        guard let sampleType = HKObjectType.quantityType(forIdentifier: .heartRate) else
//        {
//            return
//        }
//        
////        guard let sampleType1 = HKCategoryType.categoryType(forIdentifier: .irregularHeartRhythmEvent) else
////        {
////            return
////        }
//
//        guard let sampleType1 = HKObjectType.categoryType(forIdentifier: .irregularHeartRhythmEvent) else
//        {
//            return
//        }
//        
//        guard let sampleType2 = HKObjectType.quantityType(forIdentifier: .respiratoryRate) else
//        {
//            return
//        }
//        
//        let startDate = Calendar.current.date(byAdding: .month, value: -1, to: Date())
//
//        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
//
//        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
//
//        let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
//            {
//            (sample, result, error) in
//            guard error == nil else{return}
//
//            print(result ?? "nothing")
//
//            let data = result![0] as! HKQuantitySample
//            let unit = HKUnit(from: "count/min")
//            let latestHr = data.quantity.doubleValue(for: unit)
//            print("Latest Hr\(latestHr) BPM")
//            self.BPM = String(format: "%.1f", latestHr)
//
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd/MM/yyyy hh:mm s"
//            let StartDate = dateFormatter.string(from: data.startDate)
//            let EndDate = dateFormatter.string(from: data.endDate)
//            print("StartDate \(StartDate), EndDate\(EndDate)")
//        }
//        
//        let query1 = HKSampleQuery(sampleType: sampleType1, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
//            {
//            (sample, result, error) in
//            guard error == nil else{return}
//
//            print(result ?? "nothing")
//
//            let data = result![0] as! HKQuantitySample
//            let unit = HKUnit(from: "count/min")
//            let latestHr = data.quantity.doubleValue(for: unit)
//            print("Latest Hr\(latestHr) BPM")
//            self.BPM = String(format: "%.1f", latestHr)
//
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd/MM/yyyy hh:mm s"
//            let StartDate = dateFormatter.string(from: data.startDate)
//            let EndDate = dateFormatter.string(from: data.endDate)
//            print("StartDate \(StartDate), EndDate\(EndDate)")
//        }
//        
//        let query2 = HKSampleQuery(sampleType: sampleType2, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor])
//            {
//            (sample, result, error) in
//            guard error == nil else{return}
//
//            print(result ?? "nothing")
//
//            let data = result![0] as! HKQuantitySample
//            let unit = HKUnit(from: "count/min")
//            let latestHr = data.quantity.doubleValue(for: unit)
//            print("Latest Hr\(latestHr) BPM")
//            self.BPM = String(format: "%.1f", latestHr)
//
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd/MM/yyyy hh:mm s"
//            let StartDate = dateFormatter.string(from: data.startDate)
//            let EndDate = dateFormatter.string(from: data.endDate)
//            print("StartDate \(StartDate), EndDate\(EndDate)")
//        }
//        healthStore.execute(query)
//        healthStore.execute(query1)
//        healthStore.execute(query2)
//    }
//
//}
//
//struct HKTest_Previews: PreviewProvider {
//    static var previews: some View {
//        HKTest()
//    }
//}
