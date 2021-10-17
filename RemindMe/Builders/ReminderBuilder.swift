//
//  ReminderBuilder.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 17.10.2021.
//

import Foundation

final class ReminderBuilder {
    
    private var title = "Untitled"
    private var subtitle: String?
    private var date = Date()
    
    private var isActive: Bool {
        return (date as NSDate).laterDate(Date()) == date as Date
    }
    
    func setTitle(_ title: String?) {
        guard let title = title, !title.isEmpty else { return }
        self.title = title
    }
    
    func setSubTitle(_ subtitle: String?) {
        self.subtitle = subtitle
    }
    
    func setDate(_ date: Date) {
        self.date = date
    }
    
    func build() -> Reminder {
        Reminder(title: title, subtitle: subtitle, date: date, isActive: isActive)
    }
}


