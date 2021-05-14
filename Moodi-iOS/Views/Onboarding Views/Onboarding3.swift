//
//  Onboarding3.swift
//  Moodi-iOS
//
//  Created by Eduarda Klippel on 12/05/21.
//

import SwiftUI

struct Onboarding3: View {
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    var body: some View {
        
        VStack {
            VStack(alignment:.leading){
                Text("Reflect about your day")
                    .font(.system(size: screenSize.height*0.050, weight: .bold))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                
                Text("Everyday you can answer questions to make you think about your day and better youself")
                    .font(.system(size: screenSize.height*0.02, weight: .medium))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                    .padding(.trailing,screenSize.width*0.1)
            }
            Spacer()
            Image("Reflect")
                .resizable()
                .frame(width: screenSize.width*0.8, height: screenSize.height*0.35)
                .padding(.bottom,screenSize.height*0.05)
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: screenSize.width*0.9, height: screenSize.height*0.65)
        
    }
}
    
struct Onboarding3_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding3()
    }
}
