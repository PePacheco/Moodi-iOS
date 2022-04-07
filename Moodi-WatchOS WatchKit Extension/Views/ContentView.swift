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
    @State var feelings: Set<Feeling> = []
    var body: some View {
            VStack {
                HStack {
                    Text(LocalizedStringKey("MoodScreenText"))
                        .font(.title3)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, 10)
                        .padding(.top, 8)
                    NavigationLink(destination: FeelingView(selectedMood: $selectedMood, selectedFeelings: $feelings)) {
                        Image(systemName: "arrow.forward.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color("callToAction"))
                }
                    .frame(width: 35, height: 35)
                    .buttonStyle(.plain)
                }
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
