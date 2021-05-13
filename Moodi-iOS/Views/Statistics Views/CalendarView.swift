import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar

    let interval: DateInterval
    let showHeaders: Bool
    let content: (Date) -> DateView

    init(
        interval: DateInterval,
        showHeaders: Bool = true,
        @ViewBuilder content: @escaping (Date) -> DateView
    ) {
        self.interval = interval
        self.showHeaders = showHeaders
        self.content = content
    }

    var body: some View {
        
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                ForEach(allTimeDayCalendar, id: \.self) { month in
                    Section(header: header(for: month[0].day.date)) {
                        ForEach(month, id: \.self) { date in
                            if calendar.isDate(date, equalTo: date, toGranularity: .month) {
                                
                                content(date).id(date)
                            } else {
                                content(date).hidden()
                            }
                        }
                    }
                }
            }
        }
    }

    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }
    
    var monthArray = DateManager.shared.newMonthArray(month: 5, year: 2021) // passar valor dinamico
    var days = DatabaseManager.shared.days
    lazy var dayCalendar = DateManager.fillMonthArray(month: monthArray, days: days)
    
    lazy var allTimeDayCalendar: [[DayCalendar]] = [dayCalendar, dayCalendar, dayCalendar]

    private func header(for month: Date) -> some View {
        let component = calendar.component(.month, from: month)
        let formatter = component == 1 ? DateFormatter.monthAndYear : .month

        return Group {
            if showHeaders {
                Text(formatter.string(from: month))
                    .font(.title)
                    .padding()
            }
        }
    }

    private func days(for month: Date) -> [Date] {
        guard
            let monthInterval = calendar.dateInterval(of: .month, for: month),
            let monthFirstWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.start),
            let monthLastWeek = calendar.dateInterval(of: .weekOfMonth, for: monthInterval.end)
        else { return [] }
        return calendar.generateDates(
            inside: DateInterval(start: monthFirstWeek.start, end: monthLastWeek.end),
            matching: DateComponents(hour: 0, minute: 0, second: 0)
        )
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(interval: .init()) { _ in
            Text("31")
                .padding(8)
                .background(Color.blue)
                .cornerRadius(8)
        }
    }
}
