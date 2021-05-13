//
//  DayCalendar.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 13/05/21.
//

import Foundation


struct DayCalendar: Hashable {
    static func == (lhs: DayCalendar, rhs: DayCalendar) -> Bool {
        return true
    }
    
    var empty: Bool
    var day: Day
    
    func printDay() {
        print("Empty: \(empty), day: \(day.date)")
    }
}
