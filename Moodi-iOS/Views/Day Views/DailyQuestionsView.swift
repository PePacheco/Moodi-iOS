//
//  DailyQuestionsView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 06/05/21.
//

import SwiftUI

struct DailyQuestionsView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var answers: [String] = ["", "", ""]
    @State private var textHeight: [CGFloat] = [0, 0, 0]
    @State var showNewView = false
    let selectedFeelings: Set<Feeling>
    let selectedMood: Mood
    let screenSize: CGSize
    
    private var questions: [LocalizedStringKey] = [LocalizedStringKey("Question1"), LocalizedStringKey("Question2"), LocalizedStringKey("Question3")]
    
    init(selectedFeelings: Set<Feeling>, selectedMood: Mood, screenSize: CGSize) {
        self.selectedFeelings = selectedFeelings
        self.selectedMood = selectedMood
        self.screenSize = screenSize
    }
    
    var body: some View {
        VStack {
            ForEach(0..<3) { id in
                DailyQuizTextInput(text: $answers[id], textHeight: $textHeight[id], question: questions[id])
            }
            NavigationLink(
                destination: SummaryPageView(day: Day(date: Date(), mood: self.selectedMood, answers: self.answers, feelings: self.selectedFeelings)),
                isActive: $showNewView
            ) {
                EmptyView()
            }.isDetailLink(false)
                
        }
        .padding()
        .navigationBarTitle(LocalizedStringKey("AddingNewDayQuestionsQuestion"), displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(LocalizedStringKey("Save")) {
                    let _ = DatabaseManager.shared.store(mood: selectedMood, answers: self.answers, feelings: selectedFeelings)
                    self.showNewView.toggle()
                }
            }
        }
    }
}

struct DailyQuestionsView_Previews: PreviewProvider {
    @State static var mockBinding: Bool = true
    static var previews: some View {
        DailyQuestionsView(selectedFeelings: Set([.angry]), selectedMood: .happy, screenSize: UIScreen.main.bounds.size)
    }
}
