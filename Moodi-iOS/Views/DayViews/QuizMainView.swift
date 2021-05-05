//
//  QuizMainView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct QuizMainView: View {
    @State private var selectedMood: Mood = .neutral
    
    var body: some View {
        VStack {
            MoodPickerView(screenSize: UIScreen.main.bounds.size, selectedMood: $selectedMood) 
        }
    }
}

struct QuizMainView_Previews: PreviewProvider {
    static var previews: some View {
        QuizMainView()
    }
}
