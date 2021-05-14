//
//  MoodPIckerView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct MoodPickerView: View {
    let screenSize: CGSize
    @Binding var selectedMood: Mood
    
    var body: some View {
        VStack(alignment: .leading){
            Text(NSLocalizedString("PickYourMood", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.022, weight: .semibold, design: .rounded))
            
            HStack {
                ForEach(Mood.allCases, id: \.self) { mood in
                    Button{
                        self.selectedMood = mood
                    } label: {
                        self.getMoodImage(mood: mood)
                            .padding(.horizontal, 5)
                    }
                }
            }
            .frame(width: screenSize.width*0.85,height: screenSize.width*0.2)
        }
        .frame(width: screenSize.width*0.9, height: screenSize.height * 0.18, alignment: .center)
        .asCard()
    }
    
    func getMoodImage(mood: Mood) -> some View {
        mood.getMoodImage()
            .resizable()
            .overlay(
                Circle()
                    .stroke(self.selectedMood == mood ? Color("callToAction") : Color.clear, lineWidth: 6)
            )
            .frame(width: screenSize.width*0.13, height: screenSize.width*0.13)
    }
}


struct MoodPickerView_Previews: PreviewProvider {
    @State static var mockBinding: Mood = .neutral
    static var previews: some View {
        MoodPickerView(screenSize: UIScreen.main.bounds.size, selectedMood: $mockBinding)
    }
}
