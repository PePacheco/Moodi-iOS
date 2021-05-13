//
//  TabBarView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI


struct TabMainView: View {
    private let screenSize: CGSize = UIScreen.main.bounds.size
    @Binding var tab: Int
    
    init(tab: Binding<Int>) {
        UITabBar.appearance().backgroundColor = UIColor(Color("card"))
        self._tab = tab
    }
    
    var body: some View {
        TabView(selection: $tab) {
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
            
            SettingsMainView(screenSize: screenSize, tab: $tab)
                .tabItem {
                    Label(LocalizedStringKey("Configurations"), systemImage: "gearshape.fill")
                }
                .tag(3)
        }
        .tabViewStyle(DefaultTabViewStyle())
        .accentColor(Color("callToAction"))
    }
}

struct TabBarView_Previews: PreviewProvider {
    @State static private var tab: Int = 2
    static var previews: some View {
        TabMainView(tab: $tab)
    }
}
