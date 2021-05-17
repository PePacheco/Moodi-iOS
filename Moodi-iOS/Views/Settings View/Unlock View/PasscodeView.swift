
//
//  PasscodeView.swift
//  Moodi-iOS
//
//  Created by Hojin Ryu on 17/05/21.
//

import SwiftUI

struct PasscodeView: View {
    
    @State var pin: String = ""
    @State var showPin = false
    @State private var tab: Int = 2
    @EnvironmentObject private var preferences: PreferencesStore
    @AppStorage("userPassword") var userPassword = ""
    
    var maxDigits: Int = 6
    var label = "Enter your passcode"
    let generator = UIImpactFeedbackGenerator(style: .heavy)
    
    var handler: (String, (Bool) -> Void) -> Void
    
    var body: some View {
        
        
        if correctPassword {
            if preferences.getStoredColorScheme() == .auto {
                TabMainView(tab: $tab)
            } else {
                TabMainView(tab: $tab)
                    .colorScheme(preferences.getStoredColorScheme().systemColorScheme())
            }
        } else {
            VStack(spacing: 20) {
                Text(label)
                    .font(.title)
                    .foregroundColor(Color(UIColor.label))
                ZStack {
                    pinDots
                    backgroundField
                }
            }
        }
        
    }
    
    private var correctPassword: Bool {
        if pin == userPassword {
            hideKeyboard()
            return true
        } else {
            return false
        }
    }
    
    private var pinDots: some View {
        HStack {
            Spacer()
            ForEach(0..<maxDigits) { index in
                Image(systemName: self.getImageName(at: index))
                    .font(.system(size: 20, weight: .thin, design: .default))
                Spacer()
            }
        }
    }
    
    private var backgroundField: some View {
        let boundPin = Binding<String>(get: { self.pin }, set: { newValue in
            self.pin = newValue
            self.submitPin()
        })
        
        return TextField("", text: boundPin, onCommit: submitPin)
            .accentColor(.clear)
            .foregroundColor(.clear)
            .keyboardType(.numberPad)
        
    }
    
    private func submitPin() {
        
        if pin.count == maxDigits {
            if correctPassword {
                handler(pin) { isSuccess in
                    if isSuccess {
                        print("pin matched")
                    } else {
                        pin = ""
                    }
                }
            } else {
                generator.impactOccurred()
                pin = ""
            }
            
        }
        if pin.count > maxDigits {
            pin = String(pin.prefix(maxDigits))
            submitPin()
        }
    }
    
    private func getImageName(at index: Int) -> String {
        if index >= self.pin.count {
            return "circle"
        }
        
        if self.showPin {
            return self.pin.digits[index].numberString + ".circle"
        }
        
        return "circle.fill"
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif

extension String {
    
    var digits: [Int] {
        var result = [Int]()
        
        for char in self {
            if let number = Int(String(char)) {
                result.append(number)
            }
        }
        return result
    }
    
}

extension Int {
    
    var numberString: String {
        
        guard self < 10 else { return "0" }
        
        return String(self)
    }
}

struct PasscodeView_Previews: PreviewProvider {
    static var previews: some View {
        PasscodeView(handler: {_, _ in})
    }
}
