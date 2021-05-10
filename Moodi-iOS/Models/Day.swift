//
//  Day.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

enum Mood: String, CaseIterable, Codable {
    case veryHappy
    case happy
    case neutral
    case sad
    case verySad
    
    var id: String { self.rawValue }
    
    func getMoodImage() -> Image {
        switch self {
        case .veryHappy:
            return Image("Very Happy")
        case .happy:
            return Image("Happy")
        case .neutral:
            return Image("Normal")
        case .sad:
            return Image("Sad")
        case .verySad:
            return Image("Very Sad")
        }
    }
}

enum Feeling: String, CaseIterable, Codable {
    case anxiety, angry, insecure, tired
    
    case confident, proud, relaxed, loving
    
    var id: String { self.rawValue }
    
}

struct Day: Codable {
    var date: Date
    var mood: Mood
    var answers: [String]
    var feelings: Set<Feeling>
}
