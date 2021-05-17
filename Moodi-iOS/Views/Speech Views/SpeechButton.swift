//
//  SpeechButton.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 16/05/21.
//

import Speech
import SwiftUI
import Foundation

struct SpeechButton: View {
    @State private var speechRecognizer: SpeechRecognizer;
    @State private var isPressed: Bool = false
    @State private var actionPop: Bool = false
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
        self.speechRecognizer = SpeechRecognizer(text: text)
    }
    
    var body: some View {
        
        Button(action: {
            if(self.speechRecognizer.getSpeechStatus() == "Denied"){
                self.actionPop.toggle()
            }else{
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){
                    self.speechRecognizer.isRecording.toggle()
                    self.isPressed.toggle()
                }
                self.speechRecognizer.isRecording ? self.speechRecognizer.startRecording() : self.speechRecognizer.stopRecording()
            }
        }){
            Image(systemName: "mic.fill")
                .resizable()
                .frame(width: 15, height: 20)
               .foregroundColor(.white)
                .background(self.isPressed ? Circle().foregroundColor(.red).frame(width: 50, height: 50) : Circle().foregroundColor(.blue).frame(width: 30, height: 30))
        }
        .actionSheet(isPresented: $actionPop){
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Reinstall the Appp"))])
        }
    }
}

struct Button_Previews: PreviewProvider {
    @State static private var text: String = ""
    static var previews: some View {
        SpeechButton(text: $text)
    }
}
