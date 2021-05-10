//
//  WeekSummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct StreakView: View {
    let screenSize: CGSize
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "flame.fill")
                    .foregroundColor(Color("callToAction"))
                    .frame(width: screenSize.height * 0.05, height: screenSize.height * 0.05)
                Text("14 \(NSLocalizedString("WeekSummaryDay", comment: ""))")
                    .font(.system(size: screenSize.height*0.02, weight: .medium))
                    .foregroundColor(Color("primaryText"))
            }
            .padding(.trailing, 20)
            .frame(width: screenSize.width * 0.4, height: screenSize.height * 0.05)
            .asCard()
            Spacer()
        }
        .padding(.leading)
        .padding(.top)
    }
}

struct WeekSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView(screenSize: UIScreen.main.bounds.size)
    }
}
