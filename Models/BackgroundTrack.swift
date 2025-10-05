//
//  BackgroundTrack.swift
//  LifeBeats
//
//  Created by User on 8/31/20.
//  Copyright © 2020 Life Beats Inc. All rights reserved.
//


import SwiftUI

struct bgTrack : Hashable, Codable, Identifiable
{
    var id: Int
    var name: String
    fileprivate var imageName: String
    var mp3Name: String
    var category: Category
    var isFavorite: Bool
    var isFeatured: Bool
    var URL: String?
    
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case nature = "Nature"
        case fitness = "Fitness"
        case acousticFocus = "Acoustic Focus"
        case edmFocus = "EDM Focus"
        case focusBeatsAlbum = "Focus Beats Album"
        case hypnoticFocus = "Hypnotic Focus"
        case jazz = "Jazz"
        case lullaby = "Lullaby"
        case oceanDreaming = "Ocean Dreaming"
        case sleepySoundScapesAlbum = "Sleepy Soundscapes Album"
        case mindfulness = "Mindfulness"
        //background track grouping category below
        case deepFocus = "Deep Focus"
        case sleep = "Sleep"
        case meditation = "Meditation"
        case fitnessCategory = "Fitness Category"
        case free = "Free"
        case medNature = "Meditation Nature"
        case soothingFocus = "Soothing Focus"
        case sleepyAcoustics = "Sleepy Acoustics"
        case relaxingLullabies = "Relaxing Lullabies"
        case relaxBreathing = "Relax Breathing"
        case japaneseSpa = "Japanese Spa"
        case calmShores = "Calm Shores"
        case dreamySlumber = "Dreamy Slumber"
        case ASMR = "ASMR"
        case soothingBeats = "Soothing Beats"
        case laidBackFocusBeats = "Laid Back Focus Beats"
        case natureLullabies = "Nature Lullabies"
        case calmBreathing = "Calm Breathing"
    }
}

extension bgTrack {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

