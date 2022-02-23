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
    var body: some View {

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
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            // choose a random identifier
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

            // add our notification request
            UNUserNotificationCenter.current().add(request)
        }

    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
