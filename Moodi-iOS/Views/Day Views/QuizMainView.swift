//
//  QuizMainView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct QuizMainView: View {
    @State private var selectedFeelings: Set<Feeling> = []
    @State private var selectedMood: Mood = .neutral
    @State private var answers: [String] = ["", "", ""]
    @Binding var isPresentingDayMainView: Bool
    
    private let screenSize: CGSize = UIScreen.main.bounds.size
    
    init(isPresentingDayMainView: Binding<Bool>) {
        self._isPresentingDayMainView = isPresentingDayMainView
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont.rounded(ofSize: 26, weight: .bold)]
    }
    
    var body: some View {
        VStack(spacing: 40) {
            MoodPickerView(screenSize: self.screenSize, selectedMood: $selectedMood)
            
            FeelingSelectView(screenSize: self.screenSize, selectedFeelings: $selectedFeelings)
        }
        .navigationBarTitle(Text(LocalizedStringKey("AddingNewDayMainLabel")), displayMode: .large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: DailyQuestionsView(answers: $answers, isPresentingDayMainView: $isPresentingDayMainView, selectedFeelings:selectedFeelings, selectedMood: selectedMood, screenSize: screenSize)) {
                    Text(LocalizedStringKey("Next"))
                }
            }
        }
    }
}

struct QuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMainView(isPresentingDayMainView: .constant(false))
    }
}
