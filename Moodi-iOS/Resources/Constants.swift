//
//  Constants.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 14/05/21.
//

import SwiftUI

struct Constants {
    
    var sentenceOfTheDay: String  {
        let intDay = Date().intDay ?? 1
        if intDay >= dailyTips.count {
            return dailyTips[0]
        }
        return dailyTips[intDay - 1]
    }
    
    let dailyTips: [String] = [
        NSLocalizedString("tip1", comment: ""),
        NSLocalizedString("tip2", comment: ""),
        NSLocalizedString("tip3", comment: ""),
        NSLocalizedString("tip4", comment: ""),
        NSLocalizedString("tip5", comment: ""),
        NSLocalizedString("tip6", comment: ""),
        NSLocalizedString("tip7", comment: ""),
        NSLocalizedString("tip8", comment: ""),
        NSLocalizedString("tip9", comment: ""),
        NSLocalizedString("tip10", comment: ""),
        NSLocalizedString("tip11", comment: ""),
        NSLocalizedString("tip12", comment: ""),
        NSLocalizedString("tip13", comment: ""),
        NSLocalizedString("tip14", comment: ""),
        NSLocalizedString("tip15", comment: ""),
        NSLocalizedString("tip16", comment: ""),
        NSLocalizedString("tip17", comment: ""),
        NSLocalizedString("tip18", comment: ""),
        NSLocalizedString("tip19", comment: ""),
        NSLocalizedString("tip20", comment: ""),
        NSLocalizedString("tip21", comment: ""),
        NSLocalizedString("tip22", comment: "")
    ]
    
}
