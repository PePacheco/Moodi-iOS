//
//  FeelingView.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Santiago del Castillo Gonzaga on 06/04/22.
//

import SwiftUI

struct FeelingView: View {
    @Binding var selectedFeelings: Set<Feeling>
    
    var body: some View {
        VStack{
            Text(NSLocalizedString("PickYourFeelings", comment: "") + "?")
                .foregroundColor(.white)
            List {
                ForEach((Feeling.allCases), id: \.self) { feeling in
                    Button{
                        if selectedFeelings.contains(feeling) {
                            self.selectedFeelings.remove(feeling)
                        } else {
                            self.selectedFeelings.insert(feeling)
                        }
                    } label: {
                        ZStack {
                            Rectangle()
                                .foregroundColor(selectedFeelings.contains(feeling) ? feeling.getFeelingColor() : Color("primaryText"))
                            Text(LocalizedStringKey(feeling.id))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}
