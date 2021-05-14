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
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    MyWeekView()
                    NavigationLink(destination: CalendarStatisticView()) {
                        HStack {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color("callToAction"))
                            Text("Ver calendário")
                                .foregroundColor(Color("callToAction"))
                                .font(.system(size: screenSize.height*0.022, weight: .semibold, design: .rounded))
                        }
                        .padding(.bottom, 16)
                    }
                    Picker(selection: $lastNDays, label: Text("N days"), content: {
                        Text("30 " + NSLocalizedString("Days", comment: "")).tag(30)
                            .font(.system(size: screenSize.height*0.020, weight: .regular, design: .rounded))
                        Text("3 " + NSLocalizedString("Months", comment: "")).tag(90)
                            .font(.system(size: screenSize.height*0.020, weight: .regular, design: .rounded))
                        Text("1 " + NSLocalizedString("Year", comment: "")).tag(365)
                            .font(.system(size: screenSize.height*0.020, weight: .regular, design: .rounded))
                        Text(NSLocalizedString("All Time", comment: "")).tag(DatabaseManager.shared.days.count)
                            .font(.system(size: screenSize.height*0.020, weight: .regular, design: .rounded))
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: screenSize.width*0.9)
                    .padding(.bottom, 16)
                }
                
                VStack(alignment: .leading) {
                    Text("Humores")
                        .font(.system(size: screenSize.height*0.022, weight: .semibold, design: .rounded))
                    PieChart(entries: dataDonutChart(last30days: DatabaseManager.shared.loadLastNDays(N: lastNDays)))
                        .padding()
                        .frame(width: screenSize.width*0.9, height: 300)
                        .asCard()
                        .padding(.bottom, 16)
                    Text("Sentimentos")
                        .font(.system(size: screenSize.height*0.022, weight: .semibold, design: .rounded))
                    PieChart(entries: dataDonutChart2(last30days: DatabaseManager.shared.loadLastNDays(N: lastNDays)))
                        .padding()
                        .frame(width: screenSize.width*0.9, height: 300)
                        .asCard()
                }
            }
            .navigationBarTitle(LocalizedStringKey("Statistics"), displayMode: .inline)
        }
    }
}

struct lastNdaysView_Previews: PreviewProvider {
    static var previews: some View {
        LastNdaysView()
    }
}
