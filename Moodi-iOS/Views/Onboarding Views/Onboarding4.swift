//
//  Onboarding4.swift
//  Moodi-iOS
//
//  Created by Eduarda Klippel on 12/05/21.
//

import SwiftUI

struct Onboarding4: View {
    
    @Binding var shouldShowOnboarding: Bool
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                
                Text("Keep track of everything")
                    .font(.system(size: screenSize.height*0.050, weight: .bold))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                
                Text("With the calendar you can keep track of all your emotions and fellings very easily. ")
                    .font(.system(size: screenSize.height*0.02, weight: .medium))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                    .padding(.trailing,screenSize.width*0.1)
            }
            Spacer()
            Image("Calendar")
                .resizable()
                .frame(width: screenSize.width*0.5, height: screenSize.height*0.25)
                .padding(.bottom,screenSize.height*0.1)
            
            Button(action: {
                self.shouldShowOnboarding.toggle()
            }, label: {
                Text("Get Started")
                    .font(.system(size: 17, weight: .medium))
                    .padding()
                    .frame(width: screenSize.width*0.4, height: screenSize.height*0.05)
                    .foregroundColor(Color("callToAction"))
                    .background(Color(hex: 0xF2F2F7))
                    .cornerRadius(10)
                    .padding(.leading,screenSize.width*0.45)
                
            })
            
        }
        .frame(width: screenSize.width*0.9, height: screenSize.height*0.65)
    }
}


//struct Onboarding4_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding4()
//    }
//}
