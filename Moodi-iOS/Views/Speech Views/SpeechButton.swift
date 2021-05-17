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
    
    @State var isPressed:Bool = false
    @State var actionPop:Bool = false
    @EnvironmentObject var speechRecognizer: SpeechRecognizer
    
    var body: some View {
        
        Button(action:{// Button
            if(self.speechRecognizer.getSpeechStatus() == "Denied"){// checks status of auth if no auth pop up error
                self.actionPop.toggle()
            }else{
                withAnimation(.spring(response: 0.4, dampingFraction: 0.3, blendDuration: 0.3)){self.speechRecognizer.isRecording.toggle()}// button animation
                self.speechRecognizer.isRecording ? self.speechRecognizer.startRecording() : self.speechRecognizer.stopRecording()
            }
        }){
            Image(systemName: "mic.fill")// Button Image
//                .resizable()
//                .frame(width: 40, height: 40)
//                .foregroundColor(.white)
//                .background(speechRecognizer.isRecording ? Circle().foregroundColor(.red).frame(width: 85, height: 85) : Circle().foregroundColor(.blue).frame(width: 70, height: 70))
        }.actionSheet(isPresented: $actionPop){
            ActionSheet(title: Text("ERROR: - 1"), message: Text("Access Denied by User"), buttons: [ActionSheet.Button.destructive(Text("Reinstall the Appp"))])// Error catch if the auth failed or denied
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        SpeechButton().environmentObject(SpeechRecognizer())
    }
}
