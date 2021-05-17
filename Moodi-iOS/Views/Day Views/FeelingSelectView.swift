//
//  FeelingSelectView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 05/05/21.
//

import SwiftUI

struct FeelingSelectView: View {
    
    let screenSize: CGSize
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    @Binding var selectedFeelings: Set<Feeling>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(NSLocalizedString("PickYourFeelings", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.022, weight: .semibold, design: .rounded))
                .padding(.leading, screenSize.width*0.05)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                ForEach((Feeling.allCases), id: \.self) { feeling in
                    Button{
                        if selectedFeelings.contains(feeling) {
                            self.selectedFeelings.remove(feeling)
                        } else {
                            self.selectedFeelings.insert(feeling)
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30))
                                .foregroundColor(selectedFeelings.contains(feeling) ? feeling.getFeelingColor() : Color(UIColor.tertiaryLabel))
                                .frame(width: screenSize.width*0.32, height: screenSize.height*0.04)
                            Text(LocalizedStringKey(feeling.id))
                                .foregroundColor(Color(UIColor.label))
                                .font(.system(size: screenSize.height*0.022, weight: .regular, design: .rounded))
                        }
                    }
                }
            }
        }
        .padding(.vertical)
        .frame(width: screenSize.width*0.9, height: screenSize.height * 0.36, alignment: .center)
        .asCard()
    }
}

struct FeelingSelectView_Previews: PreviewProvider {
    @State static var mock: Set<Feeling> = []
    static var previews: some View {
        FeelingSelectView(screenSize: UIScreen.main.bounds.size, selectedFeelings: $mock)
    }
}
