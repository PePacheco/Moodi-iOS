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
    @ObservedObject private var databaseManager: DatabaseManager = DatabaseManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(preferences)
                .environmentObject(databaseManager)
//                .onAppear() {
//                    if let bundleID = Bundle.main.bundleIdentifier {
//                        UserDefaults.standard.removePersistentDomain(forName: bundleID)
//                    }
//                }
        }
    }
}
