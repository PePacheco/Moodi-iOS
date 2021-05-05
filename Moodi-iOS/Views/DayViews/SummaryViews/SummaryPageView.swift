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
        VStack (alignment: .leading){
                Text(NSLocalizedString("SummaryPageViewTitle", comment: ""))
                    .font(.system(size: screenSize.width*0.08, weight: .semibold))
                    .foregroundColor(Color(UIColor.label))
                SummaryPageTodayMoodView(day: day)
                    .padding(.vertical)
                SummaryTodayQuestionsView(day: day)
            Button(NSLocalizedString("ButtonDoneText", comment: ""), action: {
                
            })
            .frame(width: screenSize.width*0.4, height: screenSize.height*0.06)
            .background(Color(UIColor.tertiaryLabel))
            .foregroundColor(Color(UIColor.secondaryLabel))
            .padding(.leading, screenSize.width*0.50)
            .offset(y: screenSize.height*0.06)
        }
        .padding(.leading, screenSize.width*0.1)
        .padding(.top, -screenSize.width*0.22)
    }
}

struct SummaryPageView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryPageView(day: Day(date: Date(), mood: .veryHappy, answers: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget."], feelings: [.angry,.confident,.proud]))
    }
}
