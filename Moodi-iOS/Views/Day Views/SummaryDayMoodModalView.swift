import SwiftUI

struct SummaryDayMoodModalView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    let day: Day
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                day.mood.getMoodImage()
                    .resizable()
                    .frame(width: screenSize.width*0.08, height: screenSize.width*0.08)
                
                Text(LocalizedStringKey(day.mood.id))
                    .font(.system(size: screenSize.width*0.06, weight: .semibold))
            }
            
            Text(LocalizedStringKey("SummaryPageTodayFeelingsTitle"))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.width*0.05, weight: .regular))
            TagCloudView(tags: Array(day.feelings))
        }
        .padding(.leading, screenSize.width*0.02)
        .frame(width: screenSize.width*0.9, height: screenSize.height*0.2, alignment: .leading)
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

    private func item(for text: String, with color: Color) -> some View {
        Text(text)
            .padding(.vertical, 3)
            .padding(.horizontal, 8)
            .font(.body)
            .background(color)
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
