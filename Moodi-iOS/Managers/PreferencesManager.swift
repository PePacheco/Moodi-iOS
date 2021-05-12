//
//  PreferencesManager.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

enum InternalColorScheme: String {
    case light, dark, auto
    init(code:Int) {
        if code == 0 {
            self = .auto
        } else if code == 1 {
            self = .light
        } else {
            self = .dark
        }
    }
    public func systemColorScheme() -> ColorScheme {
        if self == .light {
            return .light
        } else {
            return .dark
        }
    }
}

class PreferencesStore: ObservableObject {
    @AppStorage(wrappedValue: 0, "colorScheme") public var appColorScheme: Int
    
    static var appColorSchemeStatic: InternalColorScheme {
        return InternalColorScheme(code: UserDefaults.standard.integer(forKey: "colorScheme"))
    }
    
    public func getStoredColorScheme() -> InternalColorScheme {
        if appColorScheme == 0 {
            return .auto
        } else if appColorScheme == 1 {
            return .light
        } else {
            return .dark
        }
    }
    
    public func updateStoredColorScheme(colorScheme: InternalColorScheme) {
        objectWillChange.send()
        switch colorScheme {
        case .light:
            appColorScheme = 1
        case .dark:
            appColorScheme = 2
        case .auto:
            appColorScheme = 0
        }
    }
}
