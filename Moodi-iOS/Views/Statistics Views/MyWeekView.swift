//
//  MyWeekView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 14/05/21.
//

import SwiftUI

struct MyWeekView: View {
    @EnvironmentObject private var databaseManager: DatabaseManager
    @State private var dayInModal: Day? = nil
    let week: [Date]  = DateManager.shared.returnWeek()
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(LocalizedStringKey("WeekSummaryLabel"))
                .font(.system(size: screenSize.height*0.024, weight: .bold, design: .rounded))
                .foregroundColor(Color("primaryText"))
                .padding(.top, 8)
            
            HStack {
                ForEach(week, id: \.self) { day in
                    if databaseManager.hasDayInStorage(date: day) {
                        Circle()
                            .frame(width: screenSize.width*0.1, height: screenSize.height*0.1)
                            .foregroundColor(databaseManager.getDayInStorage(date: day)?.mood.getMoodColor() ?? Color(UIColor.systemGray))
                            .padding(.horizontal, screenSize.width*0.004)
                            .overlay(Text(day.dayOfWeek() ?? "").font(.system(size: screenSize.height*0.02, weight: .regular, design: .rounded)))
                            .onTapGesture {
                                self.dayInModal = databaseManager.getDayInStorage(date: day)
                            }
                    } else {
                        Circle()
                            .frame(width: screenSize.width*0.1, height: screenSize.height*0.1)
                            .foregroundColor(Color(UIColor.systemGray))
                            .overlay(Text(day.dayOfWeek() ?? "").font(.system(size: screenSize.height*0.02, weight: .regular, design: .rounded)))
                            .padding(.horizontal, screenSize.width*0.004)
                    }
                }
            }
            .padding(.vertical, -4)
            .sheet(item: $dayInModal, content: { day in
                ModalDaySummaryView(day: day)
            })
        }
    }
}

struct MyWeekView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeekView()
            .environmentObject(DatabaseManager.shared)
    }
}
