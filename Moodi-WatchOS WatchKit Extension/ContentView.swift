//
//  ContentView.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Hojin Ryu on 05/04/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
//    @State var messageText: [String: Any] = "helllloooo woroodld"
    var body: some View {
        Text(self.model.messageMood?.rawValue ?? "no mood")
//        Button(action: {
//            self.model.session.sendMessage(["message" : self.messageText], replyHandler: nil) { (error) in
//                print(error.localizedDescription)
//            }
//        }) {
//        Text("Send Message")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
