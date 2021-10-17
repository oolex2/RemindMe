//
//  Reminder.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.08.2021.
//

import Foundation

final class Reminder: NSObject {
    var title: String
    var subtitle: String?
    var date: Date
    var isActive: Bool
    
    //MARK: - Initialization
    
    init(title: String, subtitle: String?, date: Date, isActive: Bool) {
        self.title = title
        self.subtitle = subtitle
        self.date = date
        self.isActive = isActive
    }
}
