//
//  MyMood_iOSApp.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

@main
struct MyMood_iOSApp: App {
    @StateObject private var preferences: PreferencesStore = PreferencesStore()
    @StateObject private var databaseManager: DatabaseManager = DatabaseManager.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(preferences)
                .environmentObject(databaseManager)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .inactive {
                        databaseManager.updateViews()
                    } else if newPhase == .active {
                        databaseManager.updateViews()
                    } else if newPhase == .background {
                        databaseManager.updateViews()
                    }
                }
        }
    }
}
