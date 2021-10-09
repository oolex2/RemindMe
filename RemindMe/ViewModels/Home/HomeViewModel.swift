//
//  HomeViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class HomeViewModel: BaseViewModel {
    
    private struct Constants {
        static let title = "Keep in mind"
    }
    
    enum DataType: Int {
        case actual
        case history
    }
    
    var title: String {
        Constants.title
    }
    
    var reminders = [Reminder]()
    
    private var allReminders = [Reminder]()
    
    func filter(for type: DataType) {
        reminders = allReminders.filter({ $0.isActive == (type == .actual) })
    }
    
    func delete(at index: Int) {
        let currentReminder = reminders[index]
        allReminders.removeAll(where: { $0 == currentReminder })
        ReminderManager.shared.remove(currentReminder)
    }

    func didCreateReminder(_ reminder: Reminder) {
        allReminders.append(reminder)
    }
}
