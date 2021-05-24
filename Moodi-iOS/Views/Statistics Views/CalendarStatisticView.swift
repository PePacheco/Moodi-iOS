//
//  CalendarStatisticView.swift
//  Moodi-iOS
//
//  Created by Santiago del Castillo Gonzaga on 14/05/21.
//

import SwiftUI

struct CalendarStatisticView: View {
    @EnvironmentObject private var databaseManager: DatabaseManager
    let screenSize: CGSize = UIScreen.main.bounds.size
    @State private var date: Date = Date()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack{
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 7)) {
                        Text(LocalizedStringKey("Sunday"))
                            .font(.system(size: screenSize.height*0.020, weight: .thin, design: .rounded))
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
                    }
                    .frame(width: screenSize.width*0.9)
                    .asCard()
                    .padding(.top, 16)
                        
                }
                HStack {
                    Button{
                        date = date.monthBefore
                    }label: {
                        Image(systemName: "chevron.left.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("primaryText"))
                    }
                    Spacer()
                    Button{
                        date = date.monthAfter
                    }label: {
                        Image(systemName: "chevron.right.circle")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color("primaryText"))
                    }
                    
                }
                .frame(width: screenSize.width*0.8)
                .padding(.top)
                
                CalendarView(interval: DateInterval(start: date, end: date)) { date in
                    Text(date.day)
                        .font(.system(size: screenSize.height*0.02, weight: .regular, design: .rounded))
                        .padding(8)
                }
                .frame(width: screenSize.width * 0.9)
                .padding(.top, -70)
            }
        }
        .navigationBarTitle(LocalizedStringKey("Calendar"), displayMode: .inline)
    }
}

struct CalendarStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarStatisticView()
            .environmentObject(DatabaseManager.shared)
    }
}
