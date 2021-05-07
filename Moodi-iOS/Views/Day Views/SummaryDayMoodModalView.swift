import SwiftUI

struct SummaryDayMoodModalView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        VStack (alignment: .leading){
            Text(LocalizedStringKey("SummaryPageTodayMoodTitle"))
                .foregroundColor(Color(UIColor.secondaryLabel))
                .font(.system(size: screenSize.width*0.05, weight: .semibold))
            HStack {
                Circle()
                    .frame(width: screenSize.width*0.06, height: screenSize.width*0.06)
                    .foregroundColor(Color(UIColor.tertiaryLabel))
                Text(LocalizedStringKey(day.mood.id))
                    .font(.system(size: screenSize.width*0.04, weight: .semibold))
            }
            
                Text(LocalizedStringKey("SummaryPageTodayFeelingsTitle"))
                    .foregroundColor(Color(UIColor.secondaryLabel))
                    .font(.system(size: screenSize.width*0.05, weight: .semibold))
//            HStack {
//                ForEach(day.feelings, id: \.self) { feeling in
//                    DaySummaryFeelingModalView(text: feeling.rawValue)
//                        .foregroundColor(Color(UIColor.tertiaryLabel))
//                }
//            }
            TagCloudView(tags: Array(day.feelings))
        }
        .frame(width: screenSize.width, alignment: .leading)
        .padding(.leading, screenSize.width*0.06)
    }
}

struct DaySummaryFeelingModalView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    var text: String
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .overlay(
                Text(text)
            )
            .frame(width: CGFloat(text.count)*screenSize.width*0.03, height: screenSize.height*0.03)
    }
    
}


struct TagCloudView: View {
    var tags: [Feeling]

    @State private var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStack

    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return ZStack(alignment: .topLeading) {
            ForEach(self.tags, id: \.self) { tag in
                self.item(for: tag.rawValue.localized(withComment: ""))
                    .padding([.horizontal, .vertical], 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) + 30 > g.size.width)
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

    private func item(for text: String) -> some View {
        
        Text(text)
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .font(.body)
            .background(Color(UIColor.secondaryLabel))
            .foregroundColor(Color.white)
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

struct SummaryDayMoodModalView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryDayMoodModalView(day: Day(date: Date(), mood: .happy, answers: ["aaaa", "aaaaaaa", "aaa"], feelings: Set([.angry, .anxiety, .confident,.insecure, .loving, .proud])))
    }
}
