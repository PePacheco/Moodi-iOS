//
//  DaysSummary.swift
//  Moodi-WatchOS WatchKit Extension
//
//  Created by Heitor Feijó Kunrath on 06/04/22.
//
import Foundation
import SwiftUI

struct DaysSummary: View {
    @State var humorMood: Mood = .happy
    @State var feelings: Set<Feeling> = [ .proud, .confident, .angry, .loving, .tired]
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                Text(Date().nameOfWeekDay + " " + Date().toString())
                    .padding(.bottom, 2)
                Text(NSLocalizedString("Mood", comment: ""))
                    .font(.system(size: 17 , weight: .bold, design: .rounded))
                humorMood.getMoodWatchImage()
                Text(NSLocalizedString("Feelings", comment: ""))
                    .font(.system(size: 17 , weight: .bold, design: .rounded))
                TagCloudView(tags: Array(feelings))
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
        .navigationBarHidden(true)
        .padding(.leading, 8)
        .padding(.trailing, 6)
    }
}
    

struct DaysSummary_Previews: PreviewProvider {
    //@State var mood: Mood = .happy
    static var previews: some View {
        DaysSummary()
    }
}

struct TagCloudView: View {
    var tags: [Feeling]

    @State private var totalHeight = CGFloat.zero

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag.rawValue.localized(withComment: ""), with: tag.getFeelingColor())
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == self.tags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == self.tags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }
        .background(viewHeightReader($totalHeight))
    }

    private func item(for text: String, with color: Color) -> some View {
        Text(text)
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .font(.system(size: 16, weight: .regular, design: .rounded))
            .background(color)
            .foregroundColor(Color.black)
            .cornerRadius(20)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}
