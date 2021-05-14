import SwiftUI

struct CalendarView<DateView>: View where DateView: View {
    @Environment(\.calendar) var calendar
    @State private var dayInModal: Day = Day(date: Date(), mood: .neutral, answers: ["","",""], feelings: [])
    @State private var isShowingModal: Bool = false
    private let daysInStorage: [Day] = DatabaseManager.shared.days

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
                                if DatabaseManager.shared.hasDayInStorage(date: date) {
                                    content(date).id(date)
                                        .background(DatabaseManager.shared.getDayInStorage(date: date).mood.getMoodColor())
                                        .cornerRadius(50)
                                        .onTapGesture {
                                            self.dayInModal = DatabaseManager.shared.getDayInStorage(date: date)
                                            self.isShowingModal.toggle()
                                        }
                                } else {
                                    content(date).id(date)
                                        .background(Color(UIColor.systemGray))
                                        .cornerRadius(50)
                                }
                            } else {
                                content(date).hidden()
                            }
                        }
                    }
                }
            }
            .padding()
            .asCard()
            .sheet(isPresented: $isShowingModal, content: {
                ModalDaySummaryView(showModal: $isShowingModal, day: self.dayInModal)
            })
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
