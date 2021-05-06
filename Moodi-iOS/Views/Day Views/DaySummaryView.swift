//
//  DaySummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DaySummaryView: View {
    
    let screenSize: CGSize
    
    @State private var isPresentedAddingNewDay: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("DaySummaryLabel", comment: ""))
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.height*0.025, weight: .semibold))
            
            ZStack {
                Color(UIColor.tertiaryLabel)
                HStack {
                    Text(NSLocalizedString("DaySummaryMakeReflection", comment: ""))
                        .foregroundColor(Color(UIColor.secondaryLabel))
                        .font(.system(size: screenSize.height*0.025, weight: .semibold))
                    if true || !DatabaseManager.shared.hasToday {
                        Button {
                            self.isPresentedAddingNewDay = true
                        } label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: screenSize.height*0.04, height: screenSize.height*0.04)
                                .foregroundColor(Color(UIColor.label))
                        }
                        .fullScreenCover(isPresented: $isPresentedAddingNewDay) {
                            QuizMainView()
                        }
                    }
                }
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
