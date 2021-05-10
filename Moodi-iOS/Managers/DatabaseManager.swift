//
//  DatabaseManager.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import Foundation

class DatabaseManager {
    
    static let shared: DatabaseManager = DatabaseManager()
    
    private (set) var days: [Day]
    
    var hasToday: Bool {
        self.days.contains { day in
            return Date().hasSame(.day, as: day.date)
        }
    }
    
    var today: Day? {
        self.days.first { day in
            return Date().hasSame(.day, as: day.date)
        }
    }
    
    private init(){
        days = Self.load()
    }
    
    func store(mood: Mood, answers: [String], feelings: Set<Feeling>) -> Bool{
        let day = Day(date: Date(), mood: mood, answers: answers, feelings: feelings)
        self.days.append(day)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(days) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "days")
            print(self.days.count)
            return true
        }
        
        return false
    }
    
    static func load() -> [Day] {
        if let savedDay = UserDefaults.standard.data(forKey: "days") {
            let decoder = JSONDecoder()
            if let loadedDay = try? decoder.decode([Day].self, from: savedDay) {
                return loadedDay
            }
        }
        return []
    }
}
