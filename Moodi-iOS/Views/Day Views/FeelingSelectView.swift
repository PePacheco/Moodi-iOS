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
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.height*0.022, weight: .semibold))
                .padding(.leading, screenSize.width*0.1)
            
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
                                .foregroundColor(selectedFeelings.contains(feeling) ? Color(UIColor.systemGreen) : Color(UIColor.tertiaryLabel))
                                .frame(width: screenSize.width*0.32, height: screenSize.height*0.06)
                            Text(LocalizedStringKey(feeling.id))
                                .foregroundColor(Color(UIColor.label))
                                .font(.system(size: screenSize.height*0.022, weight: .regular))
                        }
                    }
                 }
             }
        }
    }
}

//struct FeelingSelectView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeelingSelectView(screenSize: UIScreen.main.bounds.size, selectedFeelings: Binding<Set<Feeling>>([]))
//    }
//}
