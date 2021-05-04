//
//  TabBarView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 04/05/21.
//

import SwiftUI
 

struct TabMainView: View {
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            Text("Summary")
                .tabItem {
                    Label("Summary", systemImage: "list.bullet")
                }
                .tag(1)
            
            DayMainView()
                .tabItem {
                    Label("Day", systemImage: "person.circle")
                }
                .tag(2)
            
            Text("Configurations")
                .tabItem {
                    Label("Configurations", systemImage: "gearshape")
                }
                .tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView()
    }
}
