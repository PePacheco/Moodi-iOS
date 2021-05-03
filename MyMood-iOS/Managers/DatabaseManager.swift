//
//  DatabaseManager.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import Foundation

class DatabaseManager {
    
    static let shared: DatabaseManager = DatabaseManager()
    
    private init(){}
    
    func store(mood: Mood, answer: String){
        var data = self.load()
        let day = Day(date: Date(), mood: mood, answer: answer)
        data.append(day)
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "days")
            print(data)
        }
    }
    
    func load() -> [Day] {
        if let savedDay = UserDefaults.standard.data(forKey: "days") {
            let decoder = JSONDecoder()
            if let loadedDay = try? decoder.decode([Day].self, from: savedDay) {
                return loadedDay
            }
        }
        return []
    }
}
