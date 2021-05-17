//
//  FaceTouchIDView.swift
//  Moodi-iOS
//
//  Created by Hojin Ryu on 17/05/21.
//

import SwiftUI
import LocalAuthentication

struct FaceTouchIDView: View {

    @State private var isUnlocked = false
    @State private var tab: Int = 2
    @EnvironmentObject private var preferences: PreferencesStore

    var body: some View {
        VStack {
            if self.isUnlocked {
                if preferences.getStoredColorScheme() == .auto {
                    TabMainView(tab: $tab)
                } else {
                    TabMainView(tab: $tab)
                        .colorScheme(preferences.getStoredColorScheme().systemColorScheme())
                }
            } else {
                PasscodeView(handler:{ _,_ in})
            }
        }
        .onAppear(perform: authenticate)
    }

    func authenticate() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                    }
                }
            }
        } else {
            print(error ?? "no biometric possible")
        }
    }
}

struct MockMainPageView: View {

    var body: some View{
        Text("faceID allowed")
    }
}

struct FaceIDView_Previews: PreviewProvider {
    static var previews: some View {
        FaceTouchIDView()
    }
}
