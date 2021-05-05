//
//  Day.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import Foundation

enum Mood: String, CaseIterable, Codable {
    case veryHappy
    case happy
    case neutral
    case sad
    case verySad
    
    var id: String { self.rawValue }
}

enum Feeling: String, CaseIterable, Codable {
    case anxious, angry, insecure, tired
    
    case confident, proud, relaxed, loving
    
    var id: String { self.rawValue }
    
}

struct Day: Codable {
    var date: Date
    var mood: Mood
    var answers: [String]
    var feelings: Set<Feeling>
}
