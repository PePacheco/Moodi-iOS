//
//  SpeechMainView.swift
//  MyMood-iOS
//
//  Created by Hojin Ryu on 04/05/21.
//

import SwiftUI

struct SpeechMainView: View {
    @State private var transcriptAnswer = ""
    @State private var isRecording = false
    private let speechRecognizer = SpeechRecognizer()
    var body: some View {
        VStack {
            Text("How was your day today?")
            
            Text(transcriptAnswer)
            
            Button(action: {
                speechRecognizer.record(to: $transcriptAnswer)
            }){
                Image(systemName: "mic.fill")
            }
        }
        .padding()
        .onAppear {
//            speechRecognizer.record(to: $transcriptAnswer)
            isRecording = true
        }
        .onDisappear {
            speechRecognizer.stopRecording()
            isRecording = false
            
        }
    }
}

struct SpeechMainView_Previews: PreviewProvider {
    static var previews: some View {
        SpeechMainView()
    }
}
