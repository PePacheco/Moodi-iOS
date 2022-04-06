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
    
    func getMoodWatchImage() -> Image {
        switch self {
            case .veryHappy:
                return Image("VeryHappy")
            case .happy:
                return Image("Happy")
            case .neutral:
                return Image("Normal")
            case .sad:
                return Image("Sad")
            case .verySad:
                return Image("VerySad")
        }
    }
    
    func getMoodWtachImageGray() -> Image {
        switch self {
        case .veryHappy:
            return Image("VeryHappyBlack")
        case .happy:
            return Image("HappyBlack")
        case .neutral:
            return Image("NormalBlack")
        case .sad:
            return Image("SadBlack")
        case .verySad:
            return Image("VerySadBlack")
        }
    }
    
    func getMoodImageGray() -> Image {
        switch self {
        case .veryHappy:
            return Image("Very Happy-1")
        case .happy:
            return Image("Happy-1")
        case .neutral:
            return Image("Normal-1")
        case .sad:
            return Image("Sad-1")
        case .verySad:
            return Image("Very Sad-1")
        }
    }
    
    func getMoodColor() -> Color {
        switch self {
        case .veryHappy:
            return Color("customYellow")
        case .happy:
            return Color("customOrange")
        case .neutral:
            return Color("customPurple")
        case .sad:
            return Color("customLightBlue")
        case .verySad:
            return Color("customBlue")
        }
    }
}

enum Feeling: String, CaseIterable, Codable {
    case anxiety, angry, insecure, tired
    
    case confident, proud, relaxed, loving
    
    var id: String { self.rawValue }
    
    func getFeelingColor() -> Color {
        switch self {
        case .anxiety:
            return Color("customBlue")
        case .angry:
            return Color("customRed")
        case .insecure:
            return Color("customPurple")
        case .tired:
            return Color("customLightBlue")
        case .confident:
            return Color("customOrange")
        case .proud:
            return Color("customGreen")
        case .relaxed:
            return Color("customYellow")
        case .loving:
            return Color("customPink")
        }
    }
}

struct Day: Codable, Hashable, Identifiable {
    var id: Date {
        date
    }
    var date: Date
    var mood: Mood
    var answers: [String]
    var feelings: Set<Feeling>
    
    var dayDic: [String: Any] {
        return ["date": date,
                "mood": mood,
                "answers": answers,
                "feelings": feelings]
    }
    
    var nsDictionary: NSDictionary {
        return dayDic as NSDictionary
    }
    
    func toDic() -> [String: Any] {
            let setFeelings: [String] = feelings.map { $0.id }

            var dict = [String: Any]()
            dict["date"] = date
            dict["mood"] = mood.id
            dict["answers"] = answers
            dict["feelings"] = setFeelings

            return dict
        }
}



