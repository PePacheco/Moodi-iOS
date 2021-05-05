//
//  WeekSummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct WeekSummaryView: View {
    let screenSize: CGSize
    
    var body: some View {
        ZStack {
            Color(hex: 0xCCCDC6)
            VStack(alignment: .leading) {
//                Text(NSLocalizedString("WeekSummaryLabel", comment: ""))
//                    .font(.system(size: 21, weight: .semibold))
//                HStack {
//                    ForEach(0..<7) { _ in
//                        WeekSummaryItemView(size: screenSize.width*0.1)
//                    }
//                }
                HStack {
                    Rectangle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color(UIColor.systemGray))
                    Text("Streak: 14 \(NSLocalizedString("WeekSummaryDay", comment: ""))")
                        .foregroundColor(Color(UIColor.systemGray))
                }
                
            }
            .frame(width: screenSize.width)
            .padding(.leading, -screenSize.width/2)
        }
        .frame(height: screenSize.height*0.06)
    }
}

struct WeekSummaryItemView: View {
    let size: CGFloat
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .padding(3)
    }
}

struct WeekSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        WeekSummaryView(screenSize: UIScreen.main.bounds.size)
    }
}
