//
//  SecurityView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct SecurityView: View {
    @State private var isToggleOn = false
    @State private var securityPassword: String = ""
    
    let screenSize: CGSize
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("Security", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold))
            
            VStack {
                Toggle(isOn: $isToggleOn) {
                    Text(NSLocalizedString("Password", comment: ""))
                        .font(.system(size: screenSize.height*0.020))
                        .foregroundColor(Color("primaryText"))
                }
                .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.05, alignment: .center)
                
                .padding(.bottom)
                
                ZStack(alignment:.leading) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: screenSize.width * 0.85, height: screenSize.height * 0.055, alignment: .center)
                        .foregroundColor(Color(UIColor.tertiaryLabel))//Change?
                        .overlay( TextField("****", text: $securityPassword)
                                    .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.055, alignment: .center)
                                    .font(.system(size: screenSize.height*0.02, weight: .semibold)))
                }
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.18, alignment: .center)
            .asCard()
        }
    }
}

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView(screenSize: UIScreen.main.bounds.size)
    }
}
