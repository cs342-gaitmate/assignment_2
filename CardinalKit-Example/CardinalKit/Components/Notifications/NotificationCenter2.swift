//
//  NotificationCenter.swift
//  CardinalKit_Example
//
//  Created by Laura on 24.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

/*
import SwiftUI
import UserNotifications


class NotificationCenter2: NSObject, ObservableObject {
    var dumbData: UNNotificationResponse?
    override init() {
       super.init()
       UNUserNotificationCenter.current().delegate = self
    }
}
extension NotificationCenter2: UNUserNotificationCenterDelegate  {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound, .badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
       dumbData = response
       completionHandler()
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}
*/
