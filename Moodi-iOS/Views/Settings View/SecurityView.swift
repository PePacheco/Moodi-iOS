//
//  SecurityView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct SecurityView: View {
    @State private var isPasswordSet = UserDefaults.standard.bool(forKey: "isPasswordSet")
    @AppStorage("userPassword") var userPassword = ""
    @State private var securityPassword: String = ""
    @State var passwordMax = false
    var maxDigits: Int = 6
    
    let screenSize: CGSize
    
    var handler: (String, (Bool) -> Void) -> Void
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text(NSLocalizedString("Security", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold))

            VStack {
                Toggle(isOn: $isPasswordSet) {
                    Text(NSLocalizedString("Password", comment: ""))
                        .font(.system(size: screenSize.height*0.025))
                        .foregroundColor(Color("primaryText"))
                }
                .frame(width: screenSize.width * 0.8, height: screenSize.height * 0.05, alignment: .center)
                .onChange(of: isPasswordSet, perform: { value in
                    if value {
                        UserDefaults.standard.setValue(true, forKey: "isPasswordSet")
                    } else {
                        UserDefaults.standard.setValue(false, forKey: "isPasswordSet")
                    }
                })
                .padding(.bottom)

                ZStack(alignment:.leading) {
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: screenSize.width * 0.85, height: screenSize.height * 0.055, alignment: .center)
                        .foregroundColor(Color(UIColor.tertiaryLabel))
                        .overlay(isPasswordSet ? passwordOn : nil)
                        
                }
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.18, alignment: .center)
            .asCard()
        }
    }
    
    private var passwordOn: some View {
            let boundPin = Binding<String>(get: { self.userPassword }, set: { newValue in
                self.userPassword = newValue
                self.submitPin()
            })
            
            return SecureField("", text: boundPin, onCommit: submitPin)
                .frame(width: screenSize.width * 0.75, height: screenSize.height * 0.055, alignment: .center)
                .font(.system(size: screenSize.height*0.02, weight: .semibold))
                .keyboardType(.numberPad)

        }

    private func submitPin() {
        
            if userPassword.count == maxDigits {
                hidePasswordField()
                
                handler(userPassword) { isSuccess in
                    if isSuccess {
                        print("pin matched")
                    } else {
                        userPassword = ""
                        passwordMax = false
                    }
                }
            }
            if userPassword.count > maxDigits {
                userPassword = String(userPassword.prefix(maxDigits))
                submitPin()
            }
        }
}

#if canImport(UIKit)
extension View {
    func hidePasswordField() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView(screenSize: UIScreen.main.bounds.size, handler: {_, _ in})
    }
}
