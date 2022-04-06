//
//  ContentView.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Hojin Ryu on 05/04/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
    @State var selectedMood: Mood = .neutral
    var body: some View {
            VStack {
                Text(LocalizedStringKey("MoodScreenText"))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 55)
                    .padding(.top, 8)
                HStack {
                    MoodButton(mood: .veryHappy, selectedMood: $selectedMood)
                    MoodButton(mood: .happy, selectedMood: $selectedMood)
                }
                HStack {
                    MoodButton(mood: .neutral, selectedMood: $selectedMood)
                    MoodButton(mood: .sad, selectedMood: $selectedMood)
                }
                MoodButton(mood: .verySad, selectedMood: $selectedMood)
            }
        }
         //Text(self.model.messageMood?.rawValue ?? "no mood")
//        Button(action: {
//            self.model.session.sendMessage(["message" : self.messageText], replyHandler: nil) { (error) in
//                print(error.localizedDescription)
//            }
//        }) {
//        Text("Send Message")t
//        }
    }


struct MoodButton: View {
    var mood: Mood
    @Binding var selectedMood: Mood
    
    var body: some View {
        if mood == selectedMood {
            self.mood.getMoodWatchImage()
        } else {
            self.mood.getMoodWtachImageGray()
                .onTapGesture {
                    selectedMood = mood
                }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
