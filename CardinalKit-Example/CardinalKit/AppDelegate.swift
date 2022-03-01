//
//  AppDelegate.swift
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import UIKit
import SwiftUI
import os
import Firebase
import ResearchKit
import UserNotifications
import UserNotificationsUI

// import facebook
import FBSDKCoreKit

import GoogleSignIn


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    //@StateObject var notificationCenter = NotificationCenter2()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
                
        // (1) initialize Firebase SDK
        FirebaseApp.configure()
        
        // (2) check if this is the first time
        // that the app runs!
        cleanIfFirstRun()
        
        // (3) initialize CardinalKit API
        CKAppLaunch()
        
        let config = CKPropertyReader(file: "CKConfiguration")
        UIView.appearance(whenContainedInInstancesOf: [ORKTaskViewController.self]).tintColor = config.readColor(query: "Tint Color")
        
        // Fix transparent navbar in iOS 15
               if #available(iOS 15, *) {
                   let appearance = UINavigationBarAppearance()
                   appearance.configureWithOpaqueBackground()
                   UINavigationBar.appearance().standardAppearance = appearance
                   UINavigationBar.appearance().scrollEdgeAppearance = appearance
               }
        
        // Set up FB Sign In
        FBSDKCoreKit.ApplicationDelegate.shared.application(
                    application,
                    didFinishLaunchingWithOptions: launchOptions
                )
    
        // Request permission to send user notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                //------------------Report Fall Notification--------------------//
                print("schedule fall notification")
    
                let content1 = UNMutableNotificationContent()
                content1.title = "Report A Fall"
                content1.subtitle = "Did you fall this past week?"
                content1.sound = UNNotificationSound.default

                // Configure the recurring date
                var dateComponents1 = DateComponents()
                dateComponents1.calendar = Calendar.current

                dateComponents1.weekday = 2  // Monday
                dateComponents1.hour = 15    // 14:00 / 2pm
                dateComponents1.minute = 38
                
                let trigger1 = UNCalendarNotificationTrigger(
                         dateMatching: dateComponents1, repeats: true)
                
                // show this notification five seconds from now
                //let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                
                // choose a random identifier
                let request1 = UNNotificationRequest(identifier: "Report_Fall", content: content1, trigger: trigger1)
                
                //------------------Gait Task Notification--------------------//
                    
                print("schedule gait notification")
                
                let content2 = UNMutableNotificationContent()
                content2.title = "Gait Task"
                content2.subtitle = "Time for your monthly mobility assessment"
                content2.sound = UNNotificationSound.default
                
                // Configure the recurring date
                var dateComponents2 = DateComponents()
                dateComponents2.calendar = Calendar.current

                dateComponents2.weekOfMonth = 4
                dateComponents2.hour = 15    // 14:00 / 2pm
                dateComponents2.minute = 35
                
                let trigger2 = UNCalendarNotificationTrigger(
                         dateMatching: dateComponents2, repeats: true)

                // show this notification five seconds from now
                //let trigger2 = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                
                // choose a random identifier
                let request2 = UNNotificationRequest(identifier: "Gait_Task", content: content2, trigger: trigger2)

                // add both notification requests to notification center
                UNUserNotificationCenter.current().add(request1)
                UNUserNotificationCenter.current().add(request2)
            }
        }
        return true
    }
    
    
    // Set up Google Sign In
    @available(iOS 9.0, *)
    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
          
          ApplicationDelegate.shared.application(
              application,
              open: url,
              sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
              annotation: options[UIApplication.OpenURLOptionsKey.annotation]
          )
          
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    // get push token for push notifications
    //No callback in simulator
    //-- must use device to get valid push token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){
        print("device token")
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) { print(error.localizedDescription)
    }
    
}


// Extensions add new functionality to an existing class, structure, enumeration, or protocol type.
// https://docs.swift.org/swift-book/LanguageGuide/Extensions.html
extension AppDelegate {
    
    /**
     The first time that our app runs we have to make sure that :
     (1) no passcode remains stored in the keychain &
     (2) we are fully signed out from Firebase.
     
     This step is required as an edge-case, since
     keychain items persist after uninstallation.
    */
    fileprivate func cleanIfFirstRun() {
        if !UserDefaults.standard.bool(forKey: Constants.prefFirstRunWasMarked) {
            if ORKPasscodeViewController.isPasscodeStoredInKeychain() {
                ORKPasscodeViewController.removePasscodeFromKeychain()
            }
            try? Auth.auth().signOut()
            UserDefaults.standard.set(true, forKey: Constants.prefFirstRunWasMarked)
        }
    }
    
}

/*
// MARK: - UNUserNotificationCenterDelegate
// adding notifications when app is in foreground
extension AppDelegate: UNUserNotificationCenterDelegate {
      func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: (UNNotificationPresentationOptions) -> Void
      ) {
        completionHandler(.banner)
      }
}
*/
