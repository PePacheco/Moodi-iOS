//
//  DailyQuestionsView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 06/05/21.
//

import SwiftUI

struct DailyQuestionsView: View {
    @State private var id: UUID?
    @State private var textHeight: [CGFloat] = [0, 0, 0]
    @Binding var answers: [String]
    @Binding var isPresentingDayMainView: Bool
    let selectedFeelings: Set<Feeling>
    let selectedMood: Mood
    let screenSize: CGSize
    
    init(answers: Binding<[String]>, isPresentingDayMainView: Binding<Bool>, selectedFeelings: Set<Feeling>, selectedMood: Mood, screenSize: CGSize) {
        self._answers = answers
        self._isPresentingDayMainView = isPresentingDayMainView
        self.selectedFeelings = selectedFeelings
        self.selectedMood = selectedMood
        self.screenSize = screenSize
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.rounded(ofSize: 26, weight: .bold)]
    }
    
    private let questions: [LocalizedStringKey] = [LocalizedStringKey("Question1"), LocalizedStringKey("Question2"), LocalizedStringKey("Question3")]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(0..<3) { id in
                    DailyQuizTextInput(text: $answers[id], textHeight: $textHeight[id], question: questions[id])
                }
            }
            .padding()
            .navigationBarTitle(LocalizedStringKey("AddingNewDayQuestionsQuestion"), displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SummaryPageView(isPresentingDayMainView: $isPresentingDayMainView, day: Day(date: Date(), mood: self.selectedMood, answers: self.answers, feelings: self.selectedFeelings)), tag: id ?? UUID(), selection: $id) {
                        Text(LocalizedStringKey("Next"))
                    }
                }
            }
        }
    }
}

struct DailyQuestionsView_Previews: PreviewProvider {
    @State static var answers: [String] = ["", "", ""]
    @State static var mockBinding: Bool = true
    static var previews: some View {
        DailyQuestionsView(answers: $answers, isPresentingDayMainView: .constant(false), selectedFeelings: Set([.angry]), selectedMood: .happy, screenSize: UIScreen.main.bounds.size)
    }
}
