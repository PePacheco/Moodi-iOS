//
//  DatabaseManager.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

class DatabaseManager: ObservableObject {
    
    static let shared: DatabaseManager = DatabaseManager()
    
    private (set) var days: [Day]
    
    var hasToday: Bool {
        self.days.contains { day in
            return Date().hasSame(.day, as: day.date) && Date().hasSame(.month, as: day.date) && Date().hasSame(.year, as: day.date)
        }
    }
    
    var hasYesterday: Bool {
        self.days.contains { day in
            return Date().dayBefore.hasSame(.day, as: day.date) && Date().dayBefore.hasSame(.month, as: day.date) && Date().dayBefore.hasSame(.year, as: day.date)
        }
    }
    
    var today: Day {
        self.days.first { day in
            return Date().hasSame(.day, as: day.date) && Date().hasSame(.month, as: day.date) && Date().hasSame(.year, as: day.date)
        } ?? Day(date: Date(), mood: .neutral, answers: ["", "", ""], feelings: [])
    }
    
    var yesterday: Day {
        self.days.first { day in
            return Date().dayBefore.hasSame(.day, as: day.date) && Date().dayBefore.hasSame(.month, as: day.date) && Date().dayBefore.hasSame(.year, as: day.date)
        } ?? Day(date: Date().dayBefore, mood: .neutral, answers: ["", "", ""], feelings: [])
    }
    
    private init(){
        days = Self.loadAllDays()
    }
    
    func store(mood: Mood, answers: [String], feelings: Set<Feeling>) -> Bool {
        objectWillChange.send()
        let day = Day(date: Date(), mood: mood, answers: answers, feelings: feelings)
        self.days.append(day)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(days) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "days")
            return true
        }
        return false
    }
    
    static func loadAllDays() -> [Day] {
        if let savedDay = UserDefaults.standard.data(forKey: "days") {
            let decoder = JSONDecoder()
            if let loadedDay = try? decoder.decode([Day].self, from: savedDay) {
                return loadedDay
            }
        }
        return []
    }
    
    func loadLastNDays(N: Int) -> [Day] {
        var lastNDays: [Day] = []
        if days.count > 0 {
            for day in days[0...days.count-1].reversed() {
                if day.date.distance(from: Date(), only: .day, calendar: .current) >= (-1 * N) {
                    lastNDays.append(day)
                }else {
                    break
                }
            }
        }
        return lastNDays
    }
    
}
