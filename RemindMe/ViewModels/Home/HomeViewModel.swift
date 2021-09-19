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
    
    var title: String {
        Constants.title
    }
    
    var reminders = [Reminder]()

    func didCreateReminder(_ reminder: Reminder) {
        reminders.append(reminder)
    }
}
