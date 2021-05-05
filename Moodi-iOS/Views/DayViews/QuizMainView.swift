//
//  QuizMainView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct QuizMainView: View {
    @Environment(\.presentationMode) private var presentationMode
    @State private var selectedFeelings: Set<Feeling> = []
    @State private var selectedMood: Mood = .neutral
    @State private var answers: [String] = []
    
    private let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        NavigationView {
            VStack(spacing: 80) {
                MoodPickerView(screenSize: self.screenSize, selectedMood: $selectedMood)
                
                FeelingSelectView(screenSize: self.screenSize, selectedFeelings: $selectedFeelings)
            }
            .navigationBarTitle(LocalizedStringKey("AddingNewDayMainLabel"), displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(LocalizedStringKey("Next")) {
                        print("Add tapped!")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(LocalizedStringKey("Close")) {
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct QuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMainView()
    }
}
