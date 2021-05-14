//
//  last30daysView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 12/05/21.
//

import SwiftUI

struct LastNdaysView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    @State private var lastNDays = 30
    private var interval: DateInterval {
        switch lastNDays {
        case 30:
            return DateInterval(start: Date(), end: Date())
        case 90:
            return DateInterval(start: Date().monthBefore.monthBefore, end: Date())
        case 365:
            return DateInterval(start: Date().yearBefore, end: Date())
        default:
            return DateInterval(start: Date().dayBefore, end: Date())
        }
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack{
                Picker(selection: $lastNDays, label: Text("N days"), content: {
                    Text("30 " + NSLocalizedString("Days", comment: "")).tag(30)
                    Text("3 " + NSLocalizedString("Months", comment: "")).tag(90)
                    Text("1 " + NSLocalizedString("Year", comment: "")).tag(365)
                    //Text(NSLocalizedString("All Time", comment: "")).tag(DatabaseManager.shared.days.count)
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: screenSize.width*0.9)
                .padding(.bottom, 16)
            }
            
            PieChart(entries: dataDonutChart(last30days: DatabaseManager.shared.loadLastNDays(N: lastNDays)))
                .padding()
                .frame(width: screenSize.width*0.9, height: 300)
                .asCard()
                .padding(.bottom, 8)
            PieChart(entries: dataDonutChart2(last30days: DatabaseManager.shared.loadLastNDays(N: lastNDays)))
                .padding()
                .frame(width: screenSize.width*0.9, height: 330)
                .asCard()
            
            CalendarView(interval: interval) { date in
                Text(date.day)
                    .padding(8)
                    .cornerRadius(8)
            }
            .frame(width: screenSize.width * 0.9)
        }
    }
}

struct lastNdaysView_Previews: PreviewProvider {
    static var previews: some View {
        LastNdaysView()
    }
}
