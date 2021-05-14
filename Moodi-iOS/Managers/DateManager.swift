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
    
    func fillMonthArray(month: [Date], days: [Day]) -> [DayCalendar]{
        var newArray: [DayCalendar] = []
        for i in month {
            for day in days {
                if (day.date.get(.day) == i.get(.day)) && (day.date.get(.month) == i.get(.month)) {
                    newArray.append(DayCalendar(empty: false, day: day))
                    break
                }else if i.distance(from: day.date, only: .day, calendar: .current) <= -1 {
                    var newDay: Day = day
                    newDay.date = i
                    newArray.append(DayCalendar(empty: true, day: newDay))
                    break
                }
            }
        }
        
        if newArray.count < month.count {
            for _ in newArray.count-1...month.count-2 {
                var date = newArray[newArray.count-1].day.date
                date.addTimeInterval(86400)
                let dayCalendarDummy = DayCalendar(empty: true, day: Day(date: date, mood: .happy, answers: [], feelings: []))
                newArray.append(dayCalendarDummy)
            }
        }
        return newArray
    }
}
