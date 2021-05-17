import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    @EnvironmentObject private var databaseManager: DatabaseManager
    @State private var dayInModal: Day? = nil
    @State private var daysInStorage: [Day] = []
    let screenSize: CGSize = UIScreen.main.bounds.size

    let interval: DateInterval
    let showHeaders: Bool
    let content: (Date) -> DateView
    
    private var months: [Date] {
        calendar.generateDates(
            inside: interval,
            matching: DateComponents(day: 1, hour: 0, minute: 0, second: 0)
        )
    }

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
                ForEach(months, id: \.self) { month in
                    Section(header: header(for: month)) {
                        ForEach(days(for: month), id: \.self) { date in
                            if calendar.isDate(date, equalTo: month, toGranularity: .month) {
                                if databaseManager.hasDayInStorage(date: date) {
                                    content(date).id(date)
                                        .frame(width: screenSize.width*0.1, height: screenSize.width*0.1)
                                        .background(Circle().fill(databaseManager.getDayInStorage(date: date)?.mood.getMoodColor() ?? Color(UIColor.systemGray)))
                                        .onTapGesture {
                                            self.dayInModal = databaseManager.getDayInStorage(date: date)
                                        }
                                } else {
                                    content(date).id(date)
                                        .frame(width: screenSize.width*0.1, height: screenSize.width*0.1)
                                        .background(Circle().fill(Color(UIColor.systemGray)))
                                }
                            } else {
                                content(date).hidden()
                            }
                        }
                    }
                }
            }
            .padding()
            .sheet(item: $dayInModal, content: { day in
                ModalDaySummaryView(day: day)
            })
            .onAppear {
                self.daysInStorage = databaseManager.days
            }
        }
    }

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
        CalendarView(interval: .init()) { date in
            Text("31")
                .padding(8)
                
        }
    }
}
