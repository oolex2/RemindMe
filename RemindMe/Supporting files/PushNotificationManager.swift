//
//  PushNotificationManager.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 10.10.2021.
//

import Foundation
import UserNotifications

final class PushNotificationManager {
    
    class var shared: PushNotificationManager {
        struct Singleton {
            static let instance = PushNotificationManager()
        }
        return Singleton.instance
    }
    
    private let notificationCenter = UNUserNotificationCenter.current()
    
    private struct Constants {
        static let notificationDefaultTitle = "Hey, don't forget about: "
        static let notificationSubtitlePlaceholder = "It seems to be something without a lot of details"
    }
    
    private init() {}

    //MARK: - Private
    
    private func requestNotification(completion: @escaping () -> ()) {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) { (didAllow, error) in
            guard didAllow else { return }
            completion()
        }
    }
    
    //MARK: - Public
    
    func scheduleNotification(reminder: Reminder) {
        requestNotification { [unowned self] in
            let content = UNMutableNotificationContent()
            content.title = Constants.notificationDefaultTitle + reminder.title
            content.body = reminder.subtitle ?? Constants.notificationSubtitlePlaceholder
            let triggerDate = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second,], from: reminder.date)
            let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
            let request = UNNotificationRequest(identifier: String(reminder.hashValue), content: content, trigger: trigger)
            notificationCenter.add(request, withCompletionHandler: nil)
        }
    }
    
    func removeNotificaiton(reminder: Reminder) {
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [String(reminder.hashValue)])
    }
}
