//
//  Moodi_iOSApp.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Hojin Ryu on 05/04/22.
//

import SwiftUI

@main
struct Moodi_iOSApp: App {
    @State var selectedFeelings: Set<Feeling> = []
    var body: some Scene {
        WindowGroup {
            NavigationView {
                FeelingView(selectedFeelings: $selectedFeelings)
            }
        }
    }
}
