//
//  Onboarding2.swift
//  Moodi-iOS
//
//  Created by Eduarda Klippel on 12/05/21.
//

import SwiftUI

struct Onboarding2: View {
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                Text(LocalizedStringKey("onboarding2Text1"))
                    .font(.system(size: screenSize.height*0.050, weight: .bold))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                
                Text(LocalizedStringKey("onboarding2Text2"))
                    .font(.system(size: screenSize.height*0.02, weight: .medium))
                    .foregroundColor(Color(hex: 0xF2F2F7))
            }
            .frame(width: screenSize.width*0.9, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Spacer()
            Image("Emotions")
                .resizable()
                .frame(width: screenSize.width*0.85, height: screenSize.height*0.35)
                .padding(.bottom,screenSize.height*0.1)
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: screenSize.width*0.9, height: screenSize.height*0.65)
        
    }
}
    

struct Onboarding2_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding2()
    }
}
