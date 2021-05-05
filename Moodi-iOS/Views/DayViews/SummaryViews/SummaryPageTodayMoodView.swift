//
//  SummaryPageTodayMoodView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 05/05/21.
//

import SwiftUI

struct SummaryPageTodayMoodView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        VStack (alignment: .leading){
            Text(NSLocalizedString("SummaryPageTodayMoodTitle", comment: ""))
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.width*0.05, weight: .semibold))
            HStack {
                Circle()
                    .frame(width: screenSize.width*0.06, height: screenSize.width*0.06)
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                Text(LocalizedStringKey(day.mood.id))
                    .font(.system(size: screenSize.width*0.04, weight: .semibold))
            }
            
                Text(NSLocalizedString("SummaryPageTodayFeelingsTitle", comment: ""))
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.system(size: screenSize.width*0.05, weight: .semibold))
            HStack {
                ForEach(0..<4) { _ in
                    DaySummaryEmotionView(size: screenSize.width*0.06)
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                }
            }
        }
        .frame(width: screenSize.width, height: 150, alignment: .leading)
    }
}



struct DaySummaryEmotionView: View {
    let size: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .padding(3)
    }
}
struct SummaryPageTodayMoodView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPageTodayMoodView(day: Day(date: Date(), mood: .veryHappy, answers: ["legal", "oi", "tudo bem"], feelings: [.angry,.confident,.proud]))
    }
}
