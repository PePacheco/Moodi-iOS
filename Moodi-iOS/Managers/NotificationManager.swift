//
//  NotificationManager.swift
//  MyMood-iOS
//
//  Created by Santiago del Castillo Gonzaga on 03/05/21.
//

import Foundation
import UserNotifications

struct NotificationManager {
    
    static let shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()
    let options: UNAuthorizationOptions = [.alert, .sound, .badge]
    
    func Authorization() {
        notificationCenter.requestAuthorization(options: options) {
            (allow, error) in
            if !allow {
                print("User didn't allow notifications")
            }
        }
    }
    
    func Content(title: String, body: String) -> UNMutableNotificationContent{
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        return content
    }
    
    func Schedule(hour: Int, minute: Int) -> UNCalendarNotificationTrigger{
        var dateComponents = DateComponents()
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        return trigger
    }
    
    func Send(identifier: String, title: String, body: String, hour: Int, minute: Int) {
        let request = UNNotificationRequest(identifier: identifier, content: Content(title: title, body: body), trigger: Schedule(hour: hour, minute: minute))
        
        notificationCenter.add(request, withCompletionHandler: nil)
    }
    
    func stopSending() {
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.removeAllDeliveredNotifications()
    }
}
