//  Therapy.swift
//  Lifebeats
//  Copyright © 2020 Life beats Inc. All rights reserved.
//  Created by User on 2/29/20.
//  ASMR/Sound/ES_ASMR Gift Wrapping - Autonomic Sensations.mp3
//  ASMR/Sound/ES_ASMR Soda Water - Autonomic Sensations.mp3
//  ASMR/Sound/ES_ASMR Stone Beach Waves - Autonomic Sensations.mp3
//  ASMR/Sound/ES_Playing with Bubble Wrap - Wave Function.mp3

import SwiftUI
import CoreLocation

struct Therapy: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinates: Coordinates
    var duration: String
    var instructor: String
    var mp3Name: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var free: Bool?
    var arrayId: Int?
    var freeBGTrack: Bool?
    var multipleBGTrackCategories: Bool?
    var natureOnlyFreeTrack: Bool?
    var therapyDescription: String?
    var url: String?
    var fiveMinsUrl: String?
    var tenMinsUrl: String?
    var tenMinsUrl1: String?
    var tenMinsUrl2: String?
    var tenMinsUrl3: String?
    var fifteenMinsUrl1: String?
    var fifteenMinsUrl2: String?
    var fifteenMinsUrl3: String?
    var thirtyMinsUrl1: String?
    var thirtyMinsUrl2: String?
    var thirtyMinsUrl3: String?
    var thirtyMinsUrl4: String?
    var thirtyMinsUrl5: String?
    var tenMinsUnguidedUrl: String?
    var bufferImageName: String?
    var time: TimeInterval?
    var timeCG: CGFloat?
    var sqImName: String
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    var featureImage: Image? {
        guard isFeatured else { return nil }
        return Image(
        ImageStore.loadImage(name: "\(imageName)_feature"),
        scale: 2,
        label: Text(name))}
        
    enum Category: String, CaseIterable, Codable, Hashable {
        case meditation = "Meditation"
        case deepFocus = "Deep Focus"
        case quickRemedies = "Quick Remedies"
        case sleep = "Sleep"
        //rows for home page
        case aceYourDay = "Ace Your Day"
        case browseCategories = "Browse Categories"
        case studentLiving = "Student Living"
        case mindfulnessAtWork = "Mindfulness at work"
        case selfLove = "Self Love"
        case beginnerMindfulness = "Beginner Mindfulness"
        //case ASMR = "ASMR"
    }
}

extension Therapy {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}
