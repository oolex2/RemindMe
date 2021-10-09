//
//  PushNotificationManager.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 10.10.2021.
//

import Foundation

final class PushNotificationManager {
    
    class var shared: PushNotificationManager {
        struct Singleton {
            static let instance = PushNotificationManager()
        }
        return Singleton.instance
    }
    
    private init() {}
}
