//
//  TabBarView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI


struct TabMainView: View {
    private let screenSize: CGSize = UIScreen.main.bounds.size
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("card"))
    }
    
    var body: some View {
        TabView {
            lastNdaysView()
                .tabItem {
                    Label(LocalizedStringKey("Statistics"), systemImage: "chart.bar.xaxis")
                }
                .tag(1)
            
            DayMainView()
                .tabItem {
                    Label(LocalizedStringKey("DayMainViewNavBarTitle"), systemImage: "doc.plaintext.fill")
                }
                .tag(2)
            
            SettingsMainView(screenSize: screenSize)
                .tabItem {
                    Label(LocalizedStringKey("Configurations"), systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .accentColor(Color("callToAction"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
