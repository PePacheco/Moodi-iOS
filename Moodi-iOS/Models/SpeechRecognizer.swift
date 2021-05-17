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


//struct SpeechRecognizer {
//     class SpeechAssist {
//        var audioEngine: AVAudioEngine?
//        var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
//        var recognitionTask: SFSpeechRecognitionTask?
//        var speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: Locale.preferredLanguages.first ?? "pt-BR"))
//        var isFinal = false
//
//        deinit {
//            reset()
//        }
//
//        func reset() {
//            recognitionTask?.cancel()
//            audioEngine?.stop()
//            audioEngine = nil
//            recognitionRequest = nil
//            recognitionTask = nil
//        }
//
//        func final(){
//            isFinal = true
//        }
//    }
//
//    let assistant = SpeechAssist()
//
//    func record(to speech: Binding<String>) {
//        relay(speech, message: "Requesting access")
//        canAccess { authorized in
//            guard authorized else {
//                relay(speech, message: "Access denied")
//                return
//            }
//
//            relay(speech, message: "")
//
//
//            assistant.audioEngine = AVAudioEngine()
//            guard let audioEngine = assistant.audioEngine else {
//                fatalError("Unable to create audio engine")
//            }
//            assistant.recognitionRequest = SFSpeechAudioBufferRecognitionRequest()
//            guard let recognitionRequest = assistant.recognitionRequest else {
//                fatalError("Unable to create request")
//            }
//            recognitionRequest.shouldReportPartialResults = true
//
//            do {
//                relay(speech, message: "")
//
//                let audioSession = AVAudioSession.sharedInstance()
//                try audioSession.setCategory(.record, mode: .measurement, options: .duckOthers)
//                try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
//                let inputNode = audioEngine.inputNode
//                relay(speech, message: "Found input node")
////                var timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: Selector(("didFinishTalk")), userInfo: nil, repeats: false)
//                let recordingFormat = inputNode.outputFormat(forBus: 0)
//                inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer: AVAudioPCMBuffer, when: AVAudioTime) in
//                    recognitionRequest.append(buffer)
//                }
//                relay(speech, message: "")
//                audioEngine.prepare()
//                try audioEngine.start()
//                assistant.recognitionTask = assistant.speechRecognizer?.recognitionTask(with: recognitionRequest) { (result, error) in
////                    timer.invalidate()
////                    timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: Selector(("didFinishTalk")), userInfo: nil, repeats: false)
//                    if let result = result {
//                        relay(speech, message: result.bestTranscription.formattedString)
//                    }
//
//                    assistant.final()
//
//                    if error != nil || assistant.isFinal {
//                        audioEngine.stop()
//                        inputNode.removeTap(onBus: 0)
//                        self.assistant.recognitionRequest = nil
//                    }
//                }
//            } catch {
//                print("Error transcibing audio: " + error.localizedDescription)
//                assistant.reset()
//            }
//        }
//    }
//
//    /// Stop transcribing audio.
//    func stopRecording() {
//        assistant.reset()
//    }
//
//    private func canAccess(withHandler handler: @escaping (Bool) -> Void) {
//        SFSpeechRecognizer.requestAuthorization { status in
//            if status == .authorized {
//                AVAudioSession.sharedInstance().requestRecordPermission { authorized in
//                    handler(authorized)
//                }
//            } else {
//                handler(false)
//            }
//        }
//    }
//
//    private func relay(_ binding: Binding<String>, message: String) {
//        DispatchQueue.main.async {
//            binding.wrappedValue = message
//        }
//    }
//}

public class SpeechRecognizer: ObservableObject{
    init(){
        
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
        
        recognitionTask?.cancel()
        self.recognitionTask = nil

    }
    
    func getButton()->SpeechButton{
        return button
    }
    
    func startRecording(){
        
        outputText = "";
        
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
            if (result != nil){
                self.outputText = (result?.transcriptions[0].formattedString)!
            }
            if let result = result{
                self.outputText = result.transcriptions[0].formattedString
            }
            print(self.outputText)
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
    @Published var button = SpeechButton()
    
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: Locale.preferredLanguages.first ?? "pt-BR"))
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private let authStat = SFSpeechRecognizer.authorizationStatus()
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    public var outputText:String = "";
    
    
}
