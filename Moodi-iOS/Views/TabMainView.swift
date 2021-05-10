//
//  TabBarView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI


struct TabMainView: View {
    @State private var selection = 2
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("card"))
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text(LocalizedStringKey("Statistics"))
                .tabItem {
                    Label(LocalizedStringKey("Statistics"), systemImage: "chart.bar.xaxis")
                }
                .tag(1)
            
            DayMainView()
                .tabItem {
                    Label(LocalizedStringKey("DayMainViewNavBarTitle"), systemImage: "doc.plaintext.fill")
                }
                .tag(2)
            
            Text(LocalizedStringKey("Configurations"))
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
