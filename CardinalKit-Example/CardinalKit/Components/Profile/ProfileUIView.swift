//
//  ProfileUIView.swift
//  CardinalKit_Example
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import SwiftUI
import UserNotifications

struct ProfileUIView: View {
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    
    init(color: Color) {
        self.color = color
    }
    
    var body: some View {
        VStack {
            Text("Profile").font(.system(size: 25, weight:.bold))
            List {
                Section {
                    PatientIDView()
                }.listRowBackground(Color.white)
                
                Section {
                    NotificationView()
                    SendRecordsView()
                    ChangePasscodeView()
                    HelpView(site: config.read(query: "Website"))
                    //NotificationManager()
                }
                
                Section {
                    ReportView(color: self.color, email: config.read(query: "Email"))
                    SupportView(color: self.color, phone: config.read(query: "Phone"))
                    DocumentView()
                }
                
                Section {
                    WithdrawView(color: self.color)
                }
                
                Section {
                    Text(config.read(query: "Copyright"))
                }
            }.listStyle(GroupedListStyle())
            
            /*
            Button("Schedule Notifications") {
                let content = UNMutableNotificationContent()
                content.title = "Report A Fall"
                content.subtitle = "Did you fall last week?"
                content.sound = UNNotificationSound.default
                
                /*
                // Configure the recurring date
                var dateComponents = DateComponents()
                dateComponents.calendar = Calendar.current

                dateComponents.weekday = 5  // 3 = Tuesday
                dateComponents.hour = 17    // 14 = 2pm
                
                let trigger = UNCalendarNotificationTrigger(
                         dateMatching: dateComponents, repeats: true)
                */
                
                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }*/

        }
    }
}

struct ProfileUIView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileUIView(color: Color.red)
    }
}
