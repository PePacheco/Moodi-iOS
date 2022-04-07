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
    
    func getMoodFromString(string: String) -> Mood {
        switch string {
        case Mood.veryHappy.rawValue:
            return .veryHappy
        case Mood.happy.rawValue:
            return .happy
        case Mood.neutral.rawValue:
            return .neutral
        case Mood.sad.rawValue:
            return .sad
        case Mood.verySad.rawValue:
            return .verySad
        default:
            return .neutral
        }
    }
    
    
    
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
    
    func getFeelingFromString(string: String) -> Feeling {
        switch string {
        case Feeling.anxiety.rawValue:
            return .anxiety
        case Feeling.angry.rawValue:
            return .angry
        case Feeling.insecure.rawValue:
            return .insecure
        case Feeling.tired.rawValue:
            return .tired
        case Feeling.confident.rawValue:
            return .confident
        case Feeling.proud.rawValue:
            return .proud
        case Feeling.relaxed.rawValue:
            return .relaxed
        case Feeling.loving.rawValue:
            return .loving
        default:
            return .relaxed
        }
    }
    
    func getFeelingFromArray(strings: [String]) -> Set<Feeling> {
        var feelings: Set<Feeling> = []
        for string in strings {
            feelings.insert(getFeelingFromString(string: string))
        }
        return feelings
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



