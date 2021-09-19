//
//  CreateReminderViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.09.2021.
//

import UIKit

final class CreateReminderViewModel: BaseViewModel {
    
    var titleField: Observer<UITextField> = Observer(UITextField())
    var subtitleField: Observer<UITextField> = Observer(UITextField())
    var intergateInPhoneSwitch: Observer<UISwitch> = Observer(UISwitch())
    var datePicker: Observer<UIDatePicker> = Observer(UIDatePicker())
    
    var currentReminder: Reminder?
    
    var title: String {
        Constants.title
    }
    
    private struct Constants {
        static let title = "Create reminder"
    }
    
    // MARK: - Public
    
    func prepareData() {
        var titleText = titleField.value.text ?? "Untitled"
        titleText.isEmpty ? titleText = "Untitled" : Void()
        currentReminder = Reminder(title: titleText, subtitle: subtitleField.value.text, date: datePicker.value.date)
        intergateInPhoneSwitch.value.isOn ? saveToIphoneReminder() : Void()
    }
    
    // MARK: - Private
    
    private func saveToIphoneReminder() {
        
    }
}
