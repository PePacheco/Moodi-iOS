//
//  DailyQuotesView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DailyQuotesView: View {
    let screenSize: CGSize
    
    var body: some View {
        Circle()
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .frame(width: screenSize.width*0.6, height: screenSize.width*0.6)
            .overlay(
                TabView {
                    SentenceOfTheDay(sentence: NSLocalizedString("DailyQuotesTipLabel", comment: ""), screenSize: screenSize)
                    
                    SentenceOfTheDay(sentence: NSLocalizedString("DailyQuotesObjectiveLabel", comment: ""), screenSize: screenSize)
                }
                .tabViewStyle(PageTabViewStyle())
            )
            .mask(Circle())
    }
}

struct SentenceOfTheDay: View {
    let sentence: String
    let screenSize: CGSize
    
    var body: some View {
        VStack {
            Text(self.sentence)
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.height*0.025, weight: .semibold))
                .padding(.bottom, 18)
            Text("Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur.")
                .foregroundColor(Color(UIColor.secondaryLabel))
                .multilineTextAlignment(.center)
                .font(.system(size: screenSize.height*0.02, weight: .medium))
                .padding(.horizontal, screenSize.width * 0.06)
                .padding(.bottom, screenSize.height * 0.04)
        }
    }
}

struct DailyQuotesView_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuotesView(screenSize: UIScreen.main.bounds.size)
    }
}
