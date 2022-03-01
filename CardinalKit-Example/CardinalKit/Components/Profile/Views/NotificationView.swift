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
    //@State var isOnGait: Bool = true
    
    var body: some View {
        
        //let notificationCenter1 = UNUserNotificationCenter.current()
        //let notificationCenter2 = UNUserNotificationCenter.current()
        
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
                        let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: "Report_Fall", content: content, trigger: trigger1)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        
                    } else { // toggle is off - cancel notifications
                        print("don't schedule fall notification")
                        
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers:["Report_Fall"])
                    }
                })
        /*
        Toggle(isOn: $isOnGait, label: {
                    Text("Gait Task Notifications")
                })
        
                .onChange(of: isOnFall, perform: { toggleIsOn in
                    if toggleIsOn {
                        print("schedule gait notification")
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Gait Task"
                        content.subtitle = "Time for your monthly mobility assessment"
                        content.sound = UNNotificationSound.default
                        
                        /*
                        // Configure the recurring date
                        var dateComponents = DateComponents()
                        dateComponents.calendar = Calendar.current

                        dateComponents.weekOfMonth = 4  // Tuesday
                        dateComponents.hour = 14    // 14:00 / 2pm
                        
                        let trigger2 = UNCalendarNotificationTrigger(
                                 dateMatching: dateComponents, repeats: true)
                        */
                        
                        // show this notification five seconds from now
                        let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: "Gait_Task", content: content, trigger: trigger2)

                        // add our notification request
                        notificationCenter2.add(request)
                        
                    } else { // toggle is off - cancel notifications
                        print("don't schedule gait notification")
                        
                        notificationCenter2.removePendingNotificationRequests(withIdentifiers:["Gait_Task"])
                    }
                })
         */
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
