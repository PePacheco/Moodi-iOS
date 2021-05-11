//
//  InternalColorScheme.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

public enum InternalColorScheme: String {
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
