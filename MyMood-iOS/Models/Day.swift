//
//  Day.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import Foundation

enum Mood: String, Codable {
    case veryHappy
    case happy
    case neutral
    case sad
    case verySad
    
    var id: String { self.rawValue }
}

enum Feeling: String, Codable {
    // negatives
    case anxious
    case angry
    case insecure
    case tired
    // positives
    case confident
    case proud
    case relaxed
    case loving
    
    var id: String { self.rawValue }
}

struct Day: Codable {
    var date: Date
    var mood: Mood
    var answers: [String]
    var feelings: [Feeling]
}
