//
//  Reminder.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.08.2021.
//

import Foundation

final class Reminder {
    var title: String
    var time: NSDate
    
    var isActive: Bool {
        return time.earlierDate(Date()) == time as Date
    }
    
    //MARK: - Initialization
    
    init(title: String, time: NSDate) {
        self.title = title
        self.time = time
    }
}
