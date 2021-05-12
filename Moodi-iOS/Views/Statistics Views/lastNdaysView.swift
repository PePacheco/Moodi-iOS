//
//  last30daysView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 12/05/21.
//

import SwiftUI

struct lastNdaysView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    @State private var lastNDays = 30
    
    var body: some View {
        VStack{
            VStack{
                Picker(selection: $lastNDays, label: Text("N days"), content: {
                    Text("30 days").tag(30)
                    Text("3 months").tag(90)
                    Text("1 year").tag(365)
                    Text("All time").tag(DatabaseManager.shared.days.count)
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
        }
    }
}

struct lastNdaysView_Previews: PreviewProvider {
    static var previews: some View {
        lastNdaysView()
    }
}
