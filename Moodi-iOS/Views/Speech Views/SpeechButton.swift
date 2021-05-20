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
    @State private var speechRecognizer: SpeechRecognizer
    @State private var isPressed: Bool = false
    @State private var isDenied: Bool = false
    @Binding var text: String
    
    init(text: Binding<String>) {
        self._text = text
        self._speechRecognizer = .init(initialValue: SpeechRecognizer(text: text))
    }
    
    var body: some View {
        
        Button(action: {
            if(self.speechRecognizer.getSpeechStatus() == "Denied - Close the App"){
                self.isDenied.toggle()
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
        .alert(isPresented: $isDenied, content: {
            Alert(title: Text("Oops"), message: Text("Go to the preferences and allow the app to record your microphone"), dismissButton: .default(Text("OK")))
        })
    }
}

struct Button_Previews: PreviewProvider {
    @State static private var text: String = ""
    static var previews: some View {
        SpeechButton(text: $text)
    }
}
