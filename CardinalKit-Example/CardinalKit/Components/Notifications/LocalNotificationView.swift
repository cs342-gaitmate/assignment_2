//
//  LocalNotificationView.swift
//  CardinalKit_Example
//
//  Created by Laura on 24.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//
/*
import SwiftUI
import UserNotifications


struct LocalNotificationView: View {
    
    @StateObject var localNotification = LocalNotification()
    @ObservedObject var notificationCenter: NotificationCenter2
    
    var body: some View {
        VStack {
            Button("schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Report A Fall"
                content.subtitle = "Did you fall last week?"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
        }
    }
}
}

extension UIApplicationDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Successfully registered for notifications!")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications: \(error.localizedDescription)")
    }
}
*/
