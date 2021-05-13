//
//  Onboarding 1 .swift
//  Moodi-iOS
//
//  Created by Eduarda Klippel on 12/05/21.
//

import SwiftUI

struct Onboarding1: View {
    
    let screenSize: CGSize = UIScreen.main.bounds.size
    
    var body: some View {
        VStack {
            VStack(alignment:.leading){
                Text("Welcome!")
                    .font(.system(size: screenSize.height*0.050, weight: .bold))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                
                
                Text("Moodi helps you to create an easy diary to keep track of your days.")
                    .font(.system(size: screenSize.height*0.02, weight: .medium))
                    .foregroundColor(Color(hex: 0xF2F2F7))
                    .padding(.trailing,screenSize.width*0.1)
                
            }
            Spacer()
            Image("Book")
                .resizable()
                .frame(width: screenSize.width*0.45, height: screenSize.height*0.2)
                .padding(.bottom,screenSize.height*0.15)
                .aspectRatio(contentMode: .fill)
            
        }
        .frame(width: screenSize.width*0.9, height: screenSize.height*0.65)
        
    }
}

struct Onboarding1Previews: PreviewProvider {
    static var previews: some View {
        Onboarding1()
    }
}
