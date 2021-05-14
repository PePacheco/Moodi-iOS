//
//  MainonboardingView.swift
//  Moodi-iOS
//
//  Created by Eduarda Klippel on 12/05/21.
//

import SwiftUI

struct MainonboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    var body: some View {
        TabView {
            Onboarding1()
            Onboarding2()
            Onboarding3()
            Onboarding4(shouldShowOnboarding: $shouldShowOnboarding)
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

//struct MainonboardingView_Previews: PreviewProvider {
//    static var previews: some View {
//       // MainonboardingView()
//    }
//}
