//
//  SummaryPageView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 05/05/21.
//

import SwiftUI

struct SummaryPageView: View {
    @EnvironmentObject private var preferences: PreferencesStore
    @Binding var isPresentingDayMainView: Bool
    let day: Day
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack (alignment: .center, spacing: 20){
                Text(LocalizedStringKey("SummaryPageTodayMoodTitle"))
                    .foregroundColor(Color("primaryText"))
                    .font(.system(size: screenSize.width*0.05, weight: .bold, design: .rounded))
                    .padding(.top)
                    .padding(.trailing, screenSize.width/1.8)
                SummaryDayMoodModalView(day: day)
                    .asCard()
                Text(LocalizedStringKey("reflexion"))
                    .foregroundColor(Color("primaryText"))
                    .font(.system(size: screenSize.width*0.05, weight: .bold, design: .rounded))
                    .padding(.top)
                    .padding(.trailing, screenSize.width/1.6)
                RectangleBox(question: "Question1", answer: day.answers[0])
                RectangleBox(question: "Question2", answer: day.answers[1])
                RectangleBox(question: "Question3", answer: day.answers[2])
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(LocalizedStringKey("Save")) {
                    let _ = DatabaseManager.shared.store(mood: day.mood, answers: day.answers, feelings: day.feelings)
                    self.isPresentingDayMainView.toggle()
                }
            }
        }
        .navigationBarTitle(LocalizedStringKey("SummaryPageViewTitle"), displayMode: .inline)
    }
}

struct RectangleBox: View {
    var question: String
    var answer: String
    let screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(LocalizedStringKey(question))
                    .foregroundColor(Color("primaryText"))
                    .font(.system(size: screenSize.height*0.02, weight: .bold, design: .rounded))
                Divider()
                Text(answer)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("secondaryText"))
                    .font(.system(size: screenSize.height*0.016, weight: .regular, design: .rounded))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding()
        }
        .frame(width: screenSize.width * 0.9)
        .asCard()
        .padding(.horizontal, screenSize.width*0.048)
    }
}

struct SummaryPageView_Previews: PreviewProvider {
    @State static var mockBinding: Bool = true
    static var previews: some View {
        SummaryPageView(isPresentingDayMainView: .constant(false), day: Day(date: Date(), mood: .veryHappy, answers: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget."], feelings: [.angry,.confident,.proud,.loving, .relaxed]))
    }
}
