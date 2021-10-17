//
//  BaseViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

class BaseViewModel: NSObject {
    
    var mainColor: UIColor {
        guard let colorName = UserDefaults.standard.value(forKey: "MainColorName") as? String else { return .systemGreen }
        switch colorName {
        case UIColor.systemBlue.name:
            return .systemBlue
        case UIColor.systemRed.name:
            return .systemRed
        default:
            return .systemGreen
        }
    }
    
    var secondaryColor = UIColor.white
    
    func prepareRightBarButtonItem(ofType type: UIBarButtonItem.SystemItem, withTarget target: Any?, andSelector selector: Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: type, target: target, action: selector)
        barButtonItem.tintColor = mainColor
        return barButtonItem
    }
}
