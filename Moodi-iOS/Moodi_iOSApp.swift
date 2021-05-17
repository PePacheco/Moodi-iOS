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
    @ObservedObject private var dailyTipsManager: DailyTipsManager = DailyTipsManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(preferences)
                .environmentObject(databaseManager)
                .environmentObject(dailyTipsManager)
        }
    }
}
