//
//  SettingsMainView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct SettingsMainView: View {
    let screenSize: CGSize
    @Binding var tab: Int
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 30) {
                    SecurityView(screenSize: screenSize, handler: {_, _ in})
                    
                    NotificationView(screenSize: screenSize)
                    
                    DarkModeView(screenSize: screenSize, tab: $tab)
                }
            }
            .padding(.top)
            .navigationBarTitle(LocalizedStringKey("Configurations"), displayMode: .inline)
        }
    }
}

struct SettingsMainView_Previews: PreviewProvider {
    @StateObject static private var preferences: PreferencesStore = PreferencesStore()
    @State static private var tab: Int = 2
    static var previews: some View {
        SettingsMainView(screenSize: UIScreen.main.bounds.size, tab: $tab)
            .environmentObject(preferences)
    }
}
