//
//  CalendarStatisticView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 14/05/21.
//

import SwiftUI

struct CalendarStatisticView: View {
    let screenSize: CGSize = UIScreen.main.bounds.size
    @State private var dateInterval: DateInterval = DateInterval(start: DatabaseManager.shared.days[0].date, end: Date())
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack{
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                        Text(LocalizedStringKey("Monday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Tuesday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Wednesday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Thursday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Friday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Saturday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                        Text(LocalizedStringKey("Sunday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
                    }
                    .frame(width: screenSize.width*0.9)
                    .asCard()
                    .padding(.top, 16)
                        
                }
                CalendarView(interval: dateInterval) { date in
                    Text(date.day)
                        .padding(8)
                }
                .frame(width: screenSize.width * 0.9)
            }
        }
        .navigationBarTitle(LocalizedStringKey("Calendar"), displayMode: .inline)
    }
}

struct CalendarStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarStatisticView()
    }
}
