//
//  DailyQuotesView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DailyQuotesView: View {
    let screenSize: CGSize
    let yesterdayObjective: String
    let tips: [String] = ["tip1", "tip2", "tip3", "tip4", "tip5", "tip6", "tip7", "tip8", "tip9", "tip10", "tip11", "tip12", "tip13", "tip14", "tip15", "tip16", "tip17", "tip18", "tip19", "tip20", "tip21", "tip22"]
    
    var body: some View {
        Circle()
            .foregroundColor(Color("callToAction"))
            .frame(width: screenSize.width*0.65, height: screenSize.width*0.65)
            .overlay(
                TabView {
                    SentenceOfTheDay(sentence: NSLocalizedString("DailyQuotesTipLabel", comment: ""), screenSize: screenSize, text: NSLocalizedString("tip1", comment: ""))
                    
                    SentenceOfTheDay(sentence: NSLocalizedString("DailyQuotesObjectiveLabel", comment: ""), screenSize: screenSize, text: yesterdayObjective)
                }
                .tabViewStyle(PageTabViewStyle())
            )
            .mask(Circle())
    }
}

struct SentenceOfTheDay: View {
    let sentence: String
    let screenSize: CGSize
    let text: String
    
    var body: some View {
        VStack {
            Text(self.sentence)
                .foregroundColor(Color("invertedPrimaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold, design: .rounded))
                .padding(.bottom,  screenSize.height * 0.02)
            Text(self.text)
                .foregroundColor(Color("invertedPrimaryText"))
                .multilineTextAlignment(.center)
                .font(.system(size: screenSize.height*0.02, weight: .medium, design: .rounded))
                .padding(.horizontal, screenSize.width * 0.06)
                .padding(.bottom, screenSize.height * 0.04)
        }
    }
}

struct DailyQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuotesView(screenSize: UIScreen.main.bounds.size, yesterdayObjective: "Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur.")
    }
}
