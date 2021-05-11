//
//  DaySummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DaySummaryView: View {
    @State private var isPresentingDayMainView: Bool = false
    let screenSize: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("DaySummaryLabel", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .semibold))
            
            HStack {
                Text(NSLocalizedString("DaySummaryMakeReflection", comment: ""))
                    .foregroundColor(Color("callToAction"))
                    .font(.system(size: screenSize.height*0.025, weight: .semibold))
                if !DatabaseManager.shared.hasToday {
                    NavigationLink.init(
                        destination: QuizMainView(isPresentingDayMainView: $isPresentingDayMainView),
                        isActive: $isPresentingDayMainView,
                        label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                                .foregroundColor(Color("callToAction"))
                        })
                } else {
                    SummaryDayMoodModalView(day: DatabaseManager.shared.today!)
                }
            }
            .frame(width: screenSize.width*0.9, height: screenSize.height * 0.16, alignment: .center)
            .asCard()
        }
    }
}

struct DaySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DaySummaryView(screenSize: UIScreen.main.bounds.size)
    }
}
