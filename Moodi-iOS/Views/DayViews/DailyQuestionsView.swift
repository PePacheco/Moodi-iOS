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
    @State private var alertText: String = "Deu Ruim"
    var selectedFeelings: Set<Feeling>
    var selectedMood: Mood
    
    
    private var questions: [String] = ["O que eu fiz certo?", "O que eu poderia ter feito melhor?", "O que eu posso mudar para ser melhor amanhã?"]
    
    init(selectedFeelings: Set<Feeling>, selectedMood: Mood) {
        self.selectedFeelings = selectedFeelings
        self.selectedMood = selectedMood
    }
    
    var body: some View {
        
        VStack {
            ForEach(0..<3) { id in
                TextFieldDynamic(text: $answers[id], textHeight: $textHeight[id], question: questions[id])
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text(alertText), message: Text("" + ""))
        }
        .padding()
        .navigationBarTitle("Como foi o seu dia?", displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(LocalizedStringKey("Save")) {
                    let response = DatabaseManager.shared.store(mood: selectedMood, answers: answers, feelings: selectedFeelings)
                    if response {
                        alertText = "Deu bom"
                    }
                    self.showAlert = true
                    //self.presentationMode.wrappedValue.dismiss()
                    //self.presentationMode.wrappedValue.dismiss()
                }
                
            }
            
        }
    }
}

struct TextFieldDynamic: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    var question: String
    
    var paddingTop: CGFloat {
        
        if question == "O que eu posso mudar para ser melhor amanhã?" {
            return 60
        }
        
        return 40
    }
    
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = 144
        let maxHeight: CGFloat = 500
        
        if textHeight < minHeight {
            return minHeight
        }
        
        if textHeight > maxHeight {
            return maxHeight
        }
        return textHeight
    }
    
    var body: some View{
        ZStack(alignment: .topLeading) {
            Color(UIColor.secondarySystemBackground)
            Text(question)
                .padding([.top, .leading], 10)
            
            if text.isEmpty {
                Text("Escreva aqui")
                    .foregroundColor(Color(UIColor.placeholderText))
                    .padding(.top, paddingTop)
                    .padding(.leading, 10)
            }
            
            DynamicHeightTextField(text: $text, height: $textHeight)
                .padding(.top, paddingTop)
                .padding(.leading, 10)
            
        }
        .frame(width: 338, height: textFieldHeight)
    }
}


