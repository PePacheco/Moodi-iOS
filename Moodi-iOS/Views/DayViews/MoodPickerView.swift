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
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.height*0.022, weight: .semibold))
            
            HStack {
                ForEach(Mood.allCases, id: \.self) { mood in
                    VStack(spacing: 5) {
                        Button{
                            self.selectedMood = mood
                        } label: {
                            Rectangle()
                                .foregroundColor(Color(UIColor.tertiaryLabel))
                                .frame(width: screenSize.width*0.12, height: screenSize.width*0.12)
                        }
                        
                        Text(mood.id)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                            .font(.system(size: screenSize.height*0.016, weight: .thin))
                    }
                    .padding(.horizontal, screenSize.width*0.008)
                }
            }.frame(height: screenSize.width*0.16)
            Text("Selected mood: \(selectedMood.id)")
        }
    }
}

