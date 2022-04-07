//
//  ViewModelPhone.swift
//  Moodi-iOS
//
//  Created by Hojin Ryu on 05/04/22.
//

import Foundation
import WatchConnectivity

class ViewModelPhone : NSObject,  WCSessionDelegate, ObservableObject{
    var session: WCSession
    @Published var messageDate: Date?
    @Published var messageMood: String?
    @Published var messageFeelings: [String]?
    @Published var messageAnswers: [String]?
    @Published var messageDay: Day?
    
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
 
            
            self.messageDate = message["date"] as? Date
            self.messageMood = message["mood"] as? String
            self.messageFeelings = message["feelings"] as? [String]
            self.messageAnswers = message["answers"] as? [String]
            
            let mood = Mood(rawValue: self.messageMood ?? "")
            var feelingSet: Set<Feeling> = []
            var feelings = self.messageFeelings?.forEach({ string in
                feelingSet.insert(Feeling(rawValue: string) ?? .relaxed)
            })
            
            let _ = DatabaseManager.shared.store(mood: mood ?? .neutral, answers: [], feelings: feelingSet)
            print("salvou")

        }
        
    }
    
}
