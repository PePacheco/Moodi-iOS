//
//  NotificationView.swift
//  Moodi-iOS
//
//  Created by Pedro Gomes Rubbo Pacheco on 11/05/21.
//

import SwiftUI

struct NotificationView: View {
    @AppStorage("isNotificationsOn") private var isNotificationsOn = false
    @AppStorage("notificationDate") private var datePick = Date()

    let screenSize: CGSize

    func datePrint(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: date)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(NSLocalizedString("Notification", comment: ""))
                .foregroundColor(Color("primaryText"))
                .font(.system(size: screenSize.height*0.025, weight: .bold, design: .rounded))
            VStack(alignment: .leading) {
                Toggle(isOn: $isNotificationsOn) {
                    Text(NSLocalizedString("Notification settings", comment: ""))
                        .font(.system(size: screenSize.height*0.02, weight: .regular, design: .rounded))
                        .foregroundColor(Color("secondaryText"))
                }
                .onChange(of: isNotificationsOn, perform: { value in
                    if value {
                        NotificationManager.shared.Authorization()
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: datePick)
                        let minutes = calendar.component(.minute, from: datePick)
                        NotificationManager.shared.Send(identifier: "Notif", title: NSLocalizedString("NotificationTitle", comment: ""), body: NSLocalizedString("NotificationBody", comment: ""), hour: hour, minute: minutes)
                    } else {
                        NotificationManager.shared.stopSending()
                    }
                })
                .padding(.bottom)
                
                DatePicker("", selection: $datePick, displayedComponents: .hourAndMinute)
                    .transformEffect(.init(scaleX: 1.4, y: 1.4))
                    .foregroundColor(Color("primaryText"))
                    .labelsHidden()
                    .accentColor(Color("primaryText"))
                    .onChange(of: datePick, perform: { value in
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: value)
                        let minutes = calendar.component(.minute, from: value)
                        NotificationManager.shared.Send(identifier: "Notif", title: NSLocalizedString("NotificationTitle", comment: ""), body: NSLocalizedString("NotificationBody", comment: ""), hour: hour, minute: minutes)
                    })
                    
            }
            .padding()
            .frame(width: screenSize.width * 0.9, height: screenSize.height * 0.18, alignment: .center)
            .asCard()
        }
    }
}

struct NontificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(screenSize: UIScreen.main.bounds.size)
    }
}
