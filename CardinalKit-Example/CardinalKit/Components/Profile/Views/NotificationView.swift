//
//  NotificationView.swift
//  CardinalKit_Example
//
//  Created by Laura on 22.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import UserNotifications

struct NotificationView: View {
    //@State private var sendNotification = true
    var body: some View {
        
        /*
         Toggle("Report A Fall Notification", isOn: $sendNotification)
        
                    if sendNotification {
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Report A Fall"
                        content.subtitle = "Did you fall this past week?"
                        content.sound = UNNotificationSound.default
                        
                        /*
                        // Configure the recurring date
                        var dateComponents = DateComponents()
                        dateComponents.calendar = Calendar.current

                        dateComponents.weekday = 3  // Tuesday
                        dateComponents.hour = 14    // 14:00 / 2pm
                        
                        let trigger1 = UNCalendarNotificationTrigger(
                                 dateMatching: dateComponents, repeats: true)
                        */
                        // show this notification five seconds from now
                        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
         */
        
        Button(action: {
            let content = UNMutableNotificationContent()
            content.title = "Report A Fall"
            content.subtitle = "Did you fall this past week?"
            content.sound = UNNotificationSound.default
            
            /*
            // Configure the recurring date
            var dateComponents = DateComponents()
            dateComponents.calendar = Calendar.current

            dateComponents.weekday = 3  // Tuesday
            dateComponents.hour = 14    // 14:00 / 2pm
            
            let trigger1 = UNCalendarNotificationTrigger(
                     dateMatching: dateComponents, repeats: true)
            */
            // show this notification five seconds from now
            let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger1)

            // add our notification request
            UNUserNotificationCenter.current().add(request)
            
            }, label: {
                    Text("Report A Fall Notification")
                        .foregroundColor(Color.blue)
        })
         
        Button(action: {
            let content = UNMutableNotificationContent()
            content.title = "Gait Task"
            content.subtitle = "Time for your monthly mobility assessment"
            content.sound = UNNotificationSound.default
            
            /*
            // Configure the recurring date
            var dateComponents = DateComponents()
            dateComponents.calendar = Calendar.current

            dateComponents.weekOfMonth = 1  // Tuesday
            dateComponents.hour = 14    // 14:00 / 2pm
            
            let trigger2 = UNCalendarNotificationTrigger(
                     dateMatching: dateComponents, repeats: true)
            */
            // show this notification five seconds from now
            let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger2)

            // add our notification request
            UNUserNotificationCenter.current().add(request)
            
            }, label: {
                    Text("Gait Task Notification")
                        .foregroundColor(Color.blue)
        })


    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
