//
//  SummaryTodayQuestionsView.swift
//  Moodi-iOS
//
//  Created by Lucca Molon on 05/05/21.
//

import SwiftUI

// o que fiz certo?
// o que poderia ter feito melhor?
// o que posso fazer para ser melhor amanha?
// 55 caracteres max contando espacos (max +- 30 palavras) ou (20 palavras com pontuacao)
struct SummaryTodayQuestionsView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        ScrollView(.vertical) {
            
            VStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.quaternaryLabel))
                    VStack {
                        Text(NSLocalizedString("ThirdDailyQuestion", comment: ""))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text(day.answers[0])
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                    }
                    .padding()
                }
                .padding()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.quaternaryLabel))
                    VStack {
                        Text(NSLocalizedString("ThirdDailyQuestion", comment: ""))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text(day.answers[0])
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                    }
                    .padding()
                }
                .padding()
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(UIColor.quaternaryLabel))
                    VStack {
                        Text(NSLocalizedString("ThirdDailyQuestion", comment: ""))
                            .foregroundColor(Color(UIColor.secondaryLabel))
                        Text(day.answers[2])
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(UIColor.tertiaryLabel))
                    }
                    .padding()
                }
                .padding()
            }
        }
    
//        VStack (alignment: .leading){
//            Text(NSLocalizedString("SummaryTodayQuestionTitle", comment: ""))
//                .font(.system(size: screenSize.width*0.06, weight: .semibold))
//                .foregroundColor(Color(UIColor.secondaryLabel))
//            Rectangle()
//                .frame(width: screenSize.width*0.9, height: screenSize.height*0.12)
//                .foregroundColor(Color(UIColor.quaternaryLabel))
//                .overlay(
//                    ScrollView(showsIndicators: false) {
//                        VStack {
//                            Text(NSLocalizedString("FirstDailyQuestion", comment: ""))
//                                .foregroundColor(Color(UIColor.secondaryLabel))
//                            Divider()
//                            Text(day.answers[0])
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(Color(UIColor.tertiaryLabel))
//                                .fixedSize(horizontal: false, vertical: true)
//                                .padding(.top, screenSize.height*0.01)
//                        }
//                        .padding()
//                    }
//                )
//            Rectangle()
//                .frame(minWidth: 0, idealWidth: screenSize.width*0.9, maxWidth: screenSize.width*0.9, minHeight: screenSize.height*0.12, idealHeight: screenSize.height*0.12, maxHeight: screenSize.height)
//                //.frame(width: screenSize.width*0.9, height: screenSize.height*0.12)
//                .foregroundColor(Color(UIColor.quaternaryLabel))
//                .overlay(
//                    VStack {
//                        Text(NSLocalizedString("SecondDailyQuestion", comment: ""))
//                            .foregroundColor(Color(UIColor.secondaryLabel))
//                        Text(day.answers[1])
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(Color(UIColor.tertiaryLabel))
//                    }
//                )
//                .padding(.top, screenSize.width*0.02)
//            Rectangle()
//                .frame(width: screenSize.width*0.9, height: screenSize.height*0.12, alignment: .center)
//                .foregroundColor(Color(UIColor.quaternaryLabel))
//                .overlay(
//                    VStack {
//                        Text(NSLocalizedString("ThirdDailyQuestion", comment: ""))
//                            .foregroundColor(Color(UIColor.secondaryLabel))
//                        Text(day.answers[2])
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(Color(UIColor.tertiaryLabel))
//                    }
//                )
//                .padding(.top, screenSize.width*0.02)
//        }
    }
}

struct SummaryTodayQuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryTodayQuestionsView(day: Day(date: Date(), mood: .veryHappy, answers: ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget.", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris at dictum leo, a suscipit est. Vestibulum luctus laoreet odio, eget. daysgdyuagsduy agsduy gasuydgauysdgh26nzk2h6nzk2phzkqr;hozkqrhozkrqohzkqrohqrzkohrzqkoakjsdhakjsdhrhqzokhqrzokqhzokqrhozkqrhozkqrhozkqhzokrqhozkrqhozkrhqzokhrqzokrhqzkohrqzokrhqozkrhqzokrhqzkorhqzokhqrzokqhrozkqhozk2hzokp2hzokp2ox4kp24kop2ohzpk2ohzp2kohp2zokaiusdhiuahsduiahdsiuahsdiuhas"], feelings: [.angry,.confident,.proud]))
    }
}
