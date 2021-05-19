//
//  DaySummaryView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI

struct DaySummaryView: View {
    @EnvironmentObject private var databaseManager: DatabaseManager
    private let didBecomeActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    @State private var isShowingModal: Bool = false
    @State private var isPresentingDayMainView: Bool = false
    let screenSize: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("DaySummaryLabel", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .semibold, design: .rounded))
            
            HStack {
                if let day = databaseManager.getDayInStorage(date: Date()) {
                    SummaryDayMoodModalView(day: day)
                        .sheet(isPresented: $isShowingModal) {
                            ModalDaySummaryView(day: day)
                        }
                        .onTapGesture {
                            self.isShowingModal.toggle()
                        }
                } else {
                    NavigationLink.init(
                        destination: QuizMainView(isPresentingDayMainView: $isPresentingDayMainView),
                        isActive: $isPresentingDayMainView,
                        label: {
                            HStack {
                                Text(NSLocalizedString("DaySummaryMakeReflection", comment: ""))
                                    .foregroundColor(Color("callToAction"))
                                    .font(.system(size: screenSize.height*0.025, weight: .semibold))
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: screenSize.height*0.03, height: screenSize.height*0.03)
                                    .foregroundColor(Color("callToAction"))
                            }
                        })
                }
            }
            .onReceive(didBecomeActive, perform: { _ in
                databaseManager.updateViews()
            })
            .frame(width: screenSize.width*0.9, height: screenSize.height * 0.24, alignment: .center)
            .asCard()
        }
    }
}

struct DaySummaryView_Previews: PreviewProvider {
    static var previews: some View {
        DaySummaryView(screenSize: UIScreen.main.bounds.size)
            .environmentObject(DatabaseManager.shared)
    }
}
