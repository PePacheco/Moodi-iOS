//
//  WeekSummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct StreakView: View {
    @EnvironmentObject private var databaseManager: DatabaseManager
    @State var streak: Int = 0
    let screenSize: CGSize
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "flame.fill")
                    .resizable()
                    .foregroundColor(Color("callToAction"))
                    .frame(width: screenSize.height * 0.03, height: screenSize.height * 0.03)
                Text("\(streak) \(NSLocalizedString("WeekSummaryDay", comment: ""))")
                    .font(.system(size: screenSize.height*0.02, weight: .medium, design: .rounded))
                    .foregroundColor(Color("primaryText"))
            }
            .frame(width: screenSize.width * 0.4, height: screenSize.height * 0.05)
            .asCard()
            Spacer()
        }
        .padding(.leading)
        .padding(.top)
        .onAppear {
            streak = DateManager.shared.calculateStreak(days: databaseManager.days)
        }
    }
}

struct WeekSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView(screenSize: UIScreen.main.bounds.size)
    }
}
