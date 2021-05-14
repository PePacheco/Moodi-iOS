//
//  ContentView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding: Bool = true
    @State private var tab: Int = 2
    @EnvironmentObject private var preferences: PreferencesStore
    
    var body: some View {
        if shouldShowOnboarding {
            ZStack {
                Color("callToAction")
                    .edgesIgnoringSafeArea(.all)
                MainonboardingView(shouldShowOnboarding: $shouldShowOnboarding)
            }
        } else {
            if preferences.getStoredColorScheme() == .auto {
                TabMainView(tab: $tab)
            } else {
                TabMainView(tab: $tab)
                    .colorScheme(preferences.getStoredColorScheme().systemColorScheme())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static private var preferences: PreferencesStore = PreferencesStore()
    static var previews: some View {
        ContentView()
            .environmentObject(preferences)
    }
}
