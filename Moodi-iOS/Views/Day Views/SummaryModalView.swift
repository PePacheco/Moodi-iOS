//
//  SummaryModalView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 06/05/21.
//

import SwiftUI

struct ModalDaySummaryView: View {
    @Environment(\.presentationMode) var presentationMode
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                    .padding(.leading)
                    Text(LocalizedStringKey("SummaryPageViewTitle"))
                        .font(.system(size: screenSize.width*0.05, weight: .semibold, design: .rounded))
                        .foregroundColor(Color(UIColor.label))
                        .padding(.top, screenSize.height*0.02)
                        .padding(.leading, screenSize.width*0.04)
                        .padding(.bottom, screenSize.height*0.02)
                }
                HStack {
                    Text(formatDate(date: day.date))
                        .foregroundColor(Color("primaryText"))
                        .font(.system(size: screenSize.width*0.06, weight: .bold, design: .rounded))
                        .padding()
                    Spacer()
                }
                .padding(.bottom, -16)
                .frame(width: screenSize.width*0.8)
                SummaryDayMoodModalView(day: day)
                    .padding(.bottom)
                RectangleBox(question: "Question1", answer: day.answers[0])
                RectangleBox(question: "Question2", answer: day.answers[1])
                RectangleBox(question: "Question3", answer: day.answers[2])
            }
        }
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "E, d MMM yyyy"

        return dateFormatterGet.string(from: date)
    }
}
