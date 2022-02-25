//
//  NotificationManager.swift
//  CardinalKit_Example
//
//  Created by Laura on 21.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import UserNotifications

struct NotificationManager: View {
    var body: some View {
        
        VStack {
            
            Button("Request Permission") {
                // Request permission to send user notifications
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
                    if granted {
                        print("push notifications granted")
                    }
                }
            }
            
            Button("Schedule Notifications") {
                let content = UNMutableNotificationContent()
                content.title = "Report A Fall"
                content.subtitle = "Did you fall last week?"
                content.sound = UNNotificationSound.default
                
                /*
                // Configure the recurring date
                var dateComponents = DateComponents()
                dateComponents.calendar = Calendar.current

                dateComponents.weekday = 3  // Tuesday
                dateComponents.hour = 14    // 14:00 / 2pm
                
                let trigger = UNCalendarNotificationTrigger(
                         dateMatching: dateComponents, repeats: true)
                 */

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

struct NotificationManager_Previews: PreviewProvider {
    static var previews: some View {
        NotificationManager()
    }
}

