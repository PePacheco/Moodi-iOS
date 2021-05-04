//
//  ContentView.swift
//  MyMood-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 03/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(NSLocalizedString("ContentView_Label_Hello", comment: ""))
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
