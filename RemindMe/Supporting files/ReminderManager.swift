//
//  ReminderManager.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 21.09.2021.
//

import Foundation
import EventKitUI

final class ReminderManager {
    
    class var shared: ReminderManager {
        struct Singleton {
            static let instance = ReminderManager()
        }
        return Singleton.instance
    }
    
    private init() {}

    private let eventStore = EKEventStore()
    private var storedReminders: [Int: EKReminder] = [:]
    
    
    // MARK: - Private
    
    private func requestPermission(confirm: @escaping () -> Void) {
        eventStore.requestAccess(to: .reminder) { (granted, error) in
            guard error == nil else { return }
            granted ? confirm() : Void()
        }
    }
    
    // MARK: - Public

    func create( _ reminder: Reminder) {
        requestPermission { [unowned self] in
            let ekreminder = EKReminder(eventStore: self.eventStore)
            ekreminder.title = reminder.title
            ekreminder.notes = reminder.subtitle
            ekreminder.addAlarm(EKAlarm(absoluteDate: reminder.date))
            ekreminder.calendar = self.eventStore.defaultCalendarForNewReminders()
            self.storedReminders[reminder.hashValue] = ekreminder
            do { try self.eventStore.save(ekreminder, commit: true) } catch { return }
        }
    }
    
    func remove( _ reminder: Reminder) {
        requestPermission { [unowned self] in
            guard let ekreminder = self.storedReminders[reminder.hashValue] else { return }
            do { try self.eventStore.remove(ekreminder, commit: true) } catch { return }
        }
    }
}
