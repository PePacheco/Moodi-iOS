//
//  DaySummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DaySummaryView: View {
    let screenSize: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("DaySummaryLabel", comment: ""))
                .foregroundColor(Color(UIColor.systemGray))
                .font(.system(size: 20, weight: .semibold))
            
            ZStack {
                Color(hex: 0xCCCDC6)
                Text(NSLocalizedString("DaySummaryMakeReflection", comment: ""))
                    .foregroundColor(Color(UIColor.systemGray))
                    .font(.system(size: 20, weight: .semibold))
            }
            .frame(width: screenSize.width*0.8, height: screenSize.height * 0.13, alignment: .center)
        }
    }
}

struct DaySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DaySummaryView(screenSize: UIScreen.main.bounds.size)
    }
}
