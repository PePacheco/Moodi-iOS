//
//  SummaryPageView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 05/05/21.
//

import SwiftUI

struct SummaryPageView: View {
    @EnvironmentObject private var preferences: PreferencesStore
    @EnvironmentObject private var databaseManager: DatabaseManager
    @Binding var isPresentingDayMainView: Bool
    let day: Day
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack (alignment: .center, spacing: 20){
                HStack {
                    Text(LocalizedStringKey("SummaryPageTodayMoodTitle"))
                        .foregroundColor(Color("primaryText"))
                        .font(.system(size: screenSize.width*0.06, weight: .bold, design: .rounded))
                        .padding(.top)
                    Spacer()
                }
                .frame(width: screenSize.width*0.88)
                SummaryDayMoodModalView(day: day)
                    .frame(width: screenSize.width*0.9)
                    .frame(minHeight: screenSize.height * 0.18)
                    .asCard()
                HStack {
                    Text(LocalizedStringKey("reflection"))
                        .foregroundColor(Color("primaryText"))
                        .font(.system(size: screenSize.width*0.05, weight: .bold, design: .rounded))
                        .padding(.top)
                    Spacer()
                }
                .frame(width: screenSize.width*0.88)
                
                RectangleBox(question: "Question1", answer: day.answers[0])
                RectangleBox(question: "Question2", answer: day.answers[1])
                RectangleBox(question: "Question3", answer: day.answers[2])
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(LocalizedStringKey("Save")) {
                    let _ = databaseManager.store(mood: day.mood, answers: day.answers, feelings: day.feelings)
                    self.isPresentingDayMainView.toggle()
                }
            }
        }
        .navigationBarTitle(LocalizedStringKey("SummaryPageViewTitle"), displayMode: .inline)
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "E d MMM yyyy"

        return dateFormatterGet.string(from: date)
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
