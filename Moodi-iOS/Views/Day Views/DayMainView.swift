//
//  DayMainView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DayMainView: View {
    @EnvironmentObject private var databaseManager: DatabaseManager
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack {
                    StreakView(screenSize: screenSize)
                        .padding(.bottom, screenSize.height*0.04)
                    
                    DailyQuotesView(screenSize: screenSize, yesterdayObjective: databaseManager.getDayInStorage(date: Date().dayBefore)?.answers[2] ?? NSLocalizedString("No Objective Added", comment: ""))
                        .padding(.bottom, screenSize.height*0.04)
                    
                    DaySummaryView(screenSize: screenSize)
                    
                    Spacer()
                }
            }
            .navigationBarTitle(NSLocalizedString("DayMainViewNavBarTitle", comment: ""), displayMode: .inline)
        }
    }
}

struct DayMainView_Previews: PreviewProvider {
    static var previews: some View {
        DayMainView()
    }
}
