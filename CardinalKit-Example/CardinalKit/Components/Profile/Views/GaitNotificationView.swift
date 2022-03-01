//
//  GaitNotificationView.swift
//  CardinalKit_Example
//
//  Created by Laura on 28.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI

struct GaitNotificationView: View {
    
    @State var isOnGait: Bool = true
    
    var body: some View {
        Toggle(isOn: $isOnGait, label: {
                    Text("Gait Task Notifications")
                })
        
                .onChange(of: isOnGait, perform: { toggleIsOn in
                    if toggleIsOn {
                        print("schedule gait notification")
                        
                        let content = UNMutableNotificationContent()
                        content.title = "Gait Task"
                        content.subtitle = "Time for your monthly mobility assessment"
                        content.sound = UNNotificationSound.default
                        
                        // Configure the recurring date
                        var dateComponents = DateComponents()
                        dateComponents.calendar = Calendar.current

                        dateComponents.weekOfMonth = 4  // Monday
                        dateComponents.hour = 15    // 14:00 / 2pm
                        dateComponents.minute = 32
                        
                        let trigger2 = UNCalendarNotificationTrigger(
                                 dateMatching: dateComponents, repeats: true)
                    
                        // show this notification five seconds from now
                        //let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                        
                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: "Gait_Task", content: content, trigger: trigger2)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                        
                    } else { // toggle is off - cancel notifications
                        print("don't schedule gait notification")
                        
                        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers:["Gait_Task"])
                    }
                })
    }
}

struct GaitNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        GaitNotificationView()
    }
}
