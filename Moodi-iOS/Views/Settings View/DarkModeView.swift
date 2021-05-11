//
//  DarkModeView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct DarkModeView: View {
    @State private var isSystemPreferencesOn = false
    @State private var isNightModeOn = false
    @EnvironmentObject private var preferences: PreferencesStore

    let screenSize: CGSize

    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("Dark Mode", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold))
            VStack {
                Toggle(isOn: $isSystemPreferencesOn) {
                    Text(NSLocalizedString("Following System", comment: ""))
                        .font(.system(size: screenSize.height*0.02))
                        .foregroundColor(Color("secondaryText"))
                }
                .onChange(of: isSystemPreferencesOn, perform: { value in
                    if value {
                        preferences.updateStoredColorScheme(colorScheme: .auto)
                    } else {
                        if isNightModeOn {
                            preferences.updateStoredColorScheme(colorScheme: .dark)
                        } else {
                            preferences.updateStoredColorScheme(colorScheme: .light)
                        }
                    }
                })
                
                Divider()
                
                Toggle(isOn: $isNightModeOn) {
                    Text(NSLocalizedString("Night Mode", comment: ""))
                        .font(.system(size: screenSize.height*0.02))
                        .foregroundColor(Color("secondaryText"))
                }
                .onChange(of: isNightModeOn, perform: { value in
                    if !isSystemPreferencesOn {
                        if value {
                            preferences.updateStoredColorScheme(colorScheme: .dark)
                        } else {
                            preferences.updateStoredColorScheme(colorScheme: .light)
                        }
                    }
                })
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.14, alignment: .center)
            .asCard()
        }
    }
}

struct DarkModeView_Previews: PreviewProvider {
    @StateObject static private var preferences: PreferencesStore = PreferencesStore()
    static var previews: some View {
        DarkModeView(screenSize: UIScreen.main.bounds.size)
            .environmentObject(preferences)
    }
}
