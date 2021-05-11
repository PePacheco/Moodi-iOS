//
//  ContentView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var deviceColorScheme: ColorScheme
    @EnvironmentObject private var preferences: PreferencesStore
    
    var body: some View {
        if preferences.getStoredColorScheme() == .auto {
            TabMainView()
        } else {
            TabMainView()
                .colorScheme(preferences.getStoredColorScheme().systemColorScheme())
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
