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
    private let didBecomeActive = NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(preferences)
                .environmentObject(databaseManager)
                .onAppear {
                    SpeechRecognizer.requestStatus()
                }
                .onReceive(didBecomeActive, perform: { _ in
                    UIApplication.shared.applicationIconBadgeNumber = 0
                })
        }
    }
}
