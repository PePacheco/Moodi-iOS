//
//  DateManager.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 12/05/21.
//

import Foundation

class DateManager {
    
    static let shared: DateManager = DateManager()
    
    private init() {}
    
    func newMonthArray(month: Int, year: Int) -> [Date]{
        var dateComponents = DateComponents()
        let calendar = Calendar.current
        var newMonthArray: [Date] = []
        dateComponents.calendar = .current
        dateComponents.day = 1
        dateComponents.month = month
        dateComponents.year = year
        for _ in 1...31 {
            if dateComponents.isValidDate {
                newMonthArray.append(calendar.date(from: dateComponents)!)
                dateComponents.day! += 1
            } else {
                break
            }
        }
        return newMonthArray
    }
    
    func calculateStreak(days: [Day]) -> Int {
        var count = 0
        var yesterday = Date().dayBefore

        for _ in days {
            let conditional = days.contains { item in
                return yesterday.hasSame(.day, as: item.date) && yesterday.hasSame(.month, as: item.date) && yesterday.hasSame(.year, as: item.date)
            }
            if conditional {
                count += 1
            } else {
                break
            }
            yesterday = yesterday.dayBefore
        }
        return count
    }
    
}
