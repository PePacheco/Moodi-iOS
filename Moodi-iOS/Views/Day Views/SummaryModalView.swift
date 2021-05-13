//
//  SummaryModalView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 06/05/21.
//

import SwiftUI

struct SummaryModalView: View {
    @State private var showModal = false
    var body: some View {
        Button("Show Modal") {
                  self.showModal.toggle()
               }
            .sheet(isPresented: $showModal) {
                ModalDaySummaryView(showModal: self.$showModal, day: Day(date: Date(), mood: .veryHappy, answers: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget."], feelings: [.angry,.confident,.proud, .relaxed, .tired]))
               }
    }
}


struct ModalDaySummaryView: View {
    @Binding var showModal: Bool
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                HStack {
                    Button(action: {
                        self.showModal.toggle()
                    }){
                        Image(systemName: "chevron.left")
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                    .padding(.leading)
                    Text(LocalizedStringKey("SummaryPageViewTitle"))
                            .font(.system(size: screenSize.width*0.05, weight: .semibold))
                            .foregroundColor(Color(UIColor.label))
                            .padding(.top, screenSize.height*0.02)
                            .padding(.leading, screenSize.width*0.04)
                            .padding(.bottom, screenSize.height*0.02)
                }
                    SummaryDayMoodModalView(day: day)
                        .padding(.bottom)
                    RectangleBox(question: "Question1", answer: day.answers[0])
                    RectangleBox(question: "Question2", answer: day.answers[1])
                    RectangleBox(question: "Question3", answer: day.answers[2])
            }
        }
    }
}

struct SummaryModalView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryModalView()
    }
}
