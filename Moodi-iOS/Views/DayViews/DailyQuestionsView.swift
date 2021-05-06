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
    @State private var showAlert: Bool = false
    @State private var alertText: LocalizedStringKey = LocalizedStringKey("AddingNewDayQuestionsBadAlert")
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
        }
        .padding()
        .navigationBarTitle(LocalizedStringKey("AddingNewDayQuestionsQuestion"), displayMode: .inline)
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertText), message: Text("" + ""))
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(LocalizedStringKey("Save")) {
                    let response = DatabaseManager.shared.store(mood: selectedMood, answers: answers, feelings: selectedFeelings)
                    if response {
                        alertText = LocalizedStringKey("AddingNewDayQuestionsGoodAlert")
                    }
                    self.showAlert = true
                }
            }
            
        }
    }
}
