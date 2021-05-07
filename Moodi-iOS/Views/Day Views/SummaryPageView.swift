//
//  SummaryPageView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 05/05/21.
//

import SwiftUI

struct SummaryPageView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .leading){
                    Text(LocalizedStringKey("SummaryPageViewTitle"))
                        .font(.system(size: screenSize.width*0.08, weight: .semibold))
                        .foregroundColor(Color(UIColor.label))
                        .padding(.leading, screenSize.width*0.06)
                        .padding(.bottom, screenSize.height*0.02)
                    SummaryDayMoodModalView(day: day)
                    RectangleBox(question: "FirstDailyQuestion", answer: day.answers[0])
                    RectangleBox(question: "SecondDailyQuestion", answer: day.answers[1])
                    RectangleBox(question: "ThirdDailyQuestion", answer: day.answers[2])
                Button(LocalizedStringKey("ButtonDoneText"), action: {
                    
                })
                .frame(width: screenSize.width*0.4, height: screenSize.height*0.06)
                .background(Color(UIColor.tertiaryLabel))
                .foregroundColor(Color(UIColor.secondaryLabel))
                .padding(.leading, screenSize.width*0.56)
                .padding(.bottom, screenSize.height*0.02)
            }
        }
     }
}

struct RectangleBox: View {
    var question: String
    var answer: String
    let screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.quaternaryLabel))
            VStack {
                Text(LocalizedStringKey(question))
                    .foregroundColor(Color(UIColor.secondaryLabel))
                Divider()
                Text(answer)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .padding(.horizontal, screenSize.width*0.048)
    }
}

struct SummaryPageView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPageView(day: Day(date: Date(), mood: .veryHappy, answers: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget."], feelings: [.angry,.confident,.proud,.loving, .relaxed]))
    }
}
