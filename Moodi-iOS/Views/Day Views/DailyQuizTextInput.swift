//
//  DailyQuizTextInput.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 06/05/21.
//

import SwiftUI

struct DailyQuizTextInput: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    var question: LocalizedStringKey
    //@GestureState var isDetectingLongPress = false
    @EnvironmentObject var speechRecognizer: SpeechRecognizer
    private let screenSize: CGSize = UIScreen.main.bounds.size
    //private let speechRecognizer = SpeechRecognizer()
    
//    var longPress: some Gesture {
//            LongPressGesture(minimumDuration: 1)
//                .updating($isDetectingLongPress) { currentState, gestureState,
//                        transaction in
//                    gestureState = currentState
//                    speechRecognizer.record(to: $text)
//                    print("aaaaa")
//                }
//                .onEnded { finished in
//                    speechRecognizer.assistant.final()
//                    print("bbbbbbs")
//                }
//        }
    
    var paddingTop: CGFloat {
        if question == LocalizedStringKey("Question3") {
            return screenSize.height * 0.055
        }
        return screenSize.height * 0.05
    }
    
    var textFieldHeight: CGFloat {
        let minHeight: CGFloat = screenSize.height * 0.17
        let maxHeight: CGFloat = screenSize.height * 0.7
        
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
            HStack {
                Text(question)
                    .padding(.horizontal, screenSize.width*0.03)
                    .padding(.top, screenSize.height*0.015)
                    .foregroundColor(Color("primaryText"))
                    .font(.system(size: screenSize.height*0.02, weight: .bold, design: .rounded))
                
                
//                Button(action: {
//                    speechRecognizer.record(to: $text)
//                }){
//
//                }
                
                SpeechButton()
                    
                    
                
                    
            }
            
            if text.isEmpty {
                Text(LocalizedStringKey("AddingNewDayQuestionsPlaceholder"))
                    .foregroundColor(Color("secondaryText"))
                    .font(.system(size: screenSize.height*0.015, weight: .regular, design: .rounded))
                    .padding(.top, paddingTop)
                    .padding(.leading, screenSize.width*0.03)
            }
            
            DynamicHeightTextField(text: $text, height: $textHeight)
                .padding(.top, paddingTop)
                .padding(.leading, screenSize.width*0.03)
            
        }
        .frame(width: screenSize.width*0.9, height: textFieldHeight)
        .asCard()
    }
}

