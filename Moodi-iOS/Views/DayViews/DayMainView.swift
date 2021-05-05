//
//  DayMainView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DayMainView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        NavigationView {
            VStack {
                WeekSummaryView(screenSize: screenSize)
                    .padding(.bottom, screenSize.height*0.04)
                
                DailyQuotesView(screenSize: screenSize)
                    .padding(.bottom, screenSize.height*0.08)
                
                DaySummaryView(screenSize: screenSize)
                
                Spacer()
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
