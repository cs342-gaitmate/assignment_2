//
//  LocalNotification.swift
//  CardinalKit_Example
//
//  Created by Laura on 24.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
/*

import SwiftUI
import UserNotifications

class LocalNotification: ObservableObject {
    init() {
        
        func setLocalNotification(title: String, subtitle: String, body: String, when: Double) {
            let content = UNMutableNotificationContent()
            content.title = title
            content.subtitle = subtitle
            content.body = body
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: when, repeats: false)
            let request = UNNotificationRequest.init(identifier: "localNotificatoin", content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
            
        }
    }
}
*/
