//
//  ViewModelWatch.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Hojin Ryu on 05/04/22.
//

import Foundation
import WatchConnectivity

class ViewModelWatch : NSObject,  WCSessionDelegate, ObservableObject{
    var session: WCSession
    @Published var messageDate: Date?
    @Published var messageMood: String?
    @Published var messageFeelings: [String]?
    @Published var messageAnswers: [String]?
    init(session: WCSession = .default){
        self.session = session
        super.init()
        self.session.delegate = self
        session.activate()
    }
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async {
            self.messageDate = message["date"] as? Date
            self.messageMood = message["mood"] as? String
            self.messageFeelings = message["feelings"] as? [String]
            self.messageAnswers = message["answers"] as? [String]
        }
    }
}
