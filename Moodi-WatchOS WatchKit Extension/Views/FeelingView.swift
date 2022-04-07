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
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            List {
                ForEach((Feeling.allCases), id: \.self) { feeling in
                    Button{
                        if selectedFeelings.contains(feeling) {
                            self.selectedFeelings.remove(feeling)
                        } else {
                            self.selectedFeelings.insert(feeling)
                        }
                    } label: {
                        Text(LocalizedStringKey(feeling.id))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity,  alignment: .center)
                            .font(.system(size: 15, weight: .regular, design: .rounded))

                    }.listRowBackground(selectedFeelings.contains(feeling) ? feeling.getFeelingColor().cornerRadius(10) : Color("primaryText").cornerRadius(10))


                }
            }

        }
    }
}
