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
    
    var isActive: Bool {
        return (date as NSDate).laterDate(Date()) == date as Date
    }
    
    //MARK: - Initialization
    
    init(title: String, subtitle: String?, date: Date) {
        self.title = title
        self.subtitle = subtitle
        self.date = date
    }
}
