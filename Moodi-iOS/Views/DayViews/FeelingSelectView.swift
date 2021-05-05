//
//  FeelingSelectView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct FeelingSelectView: View {
    let screenSize: CGSize
    @State private var selectedFeeling: Set<Feeling> = []
    
    var body: some View {
        Text("hello")
    }
}

struct FeelingSelectView_Previews: PreviewProvider {
    static var previews: some View {
        FeelingSelectView(screenSize: UIScreen.main.bounds.size)
    }
}
