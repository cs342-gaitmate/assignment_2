//
//  NotificationView.swift
//  CardinalKit_Example
//
//  Created by Laura on 22.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import UserNotifications

struct FallNotificationView: View {
    @State var isOnFall: Bool = true
    
    var body: some View {
        Toggle(isOn: $isOnFall, label: {
                    Text("Report Fall Notifications")
                })
        
                .onChange(of: isOnFall, perform: { toggleIsOn in
                    if toggleIsOn {
                        print("schedule fall notification")
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Report A Fall"
                        content.subtitle = "Did you fall this past week?"
                        content.sound = UNNotificationSound.default
                        
                        // Configure the recurring date
                        var dateComponents = DateComponents()
                        dateComponents.calendar = Calendar.current

                        dateComponents.weekday = 2  // Monday
                        dateComponents.hour = 15    // 14:00 / 2pm
                        dateComponents.minute = 34
                         
                        let trigger1 = UNCalendarNotificationTrigger(
                                 dateMatching: dateComponents, repeats: true)
                        
                        // show this notification five seconds from now
                        // let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: "Report_Fall", content: content, trigger: trigger1)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        
                    } else { // toggle is off - cancel notifications
                        print("don't schedule fall notification")
                        
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers:["Report_Fall"])
                    }
                })
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        FallNotificationView()
    }
}
