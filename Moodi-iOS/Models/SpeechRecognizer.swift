//
//  SpeechRecognizer.swift
//  MyMood-iOS
//
//  Created by Hojin Ryu on 04/05/21.
//

//import AVFoundation
import Foundation
import Speech
import SwiftUI

public class SpeechRecognizer: ObservableObject{
    init(text: Binding<String>){
        
        recognitionTask?.cancel()
        self.recognitionTask = nil
        self._outputText = text
    }
    
    public static func requestStatus() {
        SFSpeechRecognizer.requestAuthorization{ authStatus in
            OperationQueue.main.addOperation {
                switch authStatus {
                    case .authorized:
                        break

                    case .denied:
                        break
                    
                    case .restricted:
                        break
                      
                    case .notDetermined:
                        break
                      
                    default:
                        break
                }
            }
        }
    }
    
    func startRecording(){
        
        let audioSession = AVAudioSession.sharedInstance()
        let inputNode = audioEngine.inputNode
        
        do{
            try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        }catch{
            print("ERROR: - Audio Session Failed!")
        }
        
        let recordingFormat = inputNode.outputFormat(forBus: 0)
        inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do{
            try audioEngine.start()
        }catch{
            print("ERROR: - Audio Engine failed to start")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
        guard let recognitionRequest = recognitionRequest else { fatalError("Unable to create a SFSpeechAudioBufferRecognitionRequest object") }
        recognitionRequest.shouldReportPartialResults = true
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest){ result, error in
//            if (result != nil){
//                self.outputText = (result?.transcriptions[0].formattedString)!
//            }
            if let result = result{
                self.outputText = result.transcriptions[0].formattedString
            }
            if error != nil {
                self.audioEngine.stop()
                inputNode.removeTap(onBus: 0)
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
            }
        }
    }
    
    func stopRecording(){
        audioEngine.stop()
        recognitionRequest?.endAudio()
        self.audioEngine.inputNode.removeTap(onBus: 0)
        self.recognitionTask?.cancel()
        self.recognitionTask = nil
        
    }
    
    func getSpeechStatus()->String{
        
        switch authStat{
            
            case .authorized:
                return "Authorized"
            
            case .notDetermined:
                return "Not yet Determined"
            
            case .denied:
                return "Denied - Close the App"
            
            case .restricted:
                return "Restricted - Close the App"
            
            default:
                return "ERROR: No Status Defined"
    
        }
    }
    
    @Published var isRecording:Bool = false
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: Locale.preferredLanguages.first ?? "pt-BR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private let authStat = SFSpeechRecognizer.authorizationStatus()
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @Binding var outputText:String
    
}
