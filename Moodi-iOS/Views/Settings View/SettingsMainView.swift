//
//  SettingsMainView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct SettingsMainView: View {
    let screenSize: CGSize
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 30) {
                    SecurityView(screenSize: screenSize)
                    
                    NotificationView(screenSize: screenSize)
                    
                    DarkModeView(screenSize: screenSize)
                }
            }
            .padding(.top)
            .navigationBarTitle(LocalizedStringKey("Configurations"), displayMode: .inline)
        }
    }
}

struct SettingsMainView_Previews: PreviewProvider {
    @StateObject static private var preferences: PreferencesStore = PreferencesStore()
    static var previews: some View {
        SettingsMainView(screenSize: UIScreen.main.bounds.size)
            .environmentObject(preferences)
    }
}
