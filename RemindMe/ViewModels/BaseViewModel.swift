//
//  BaseViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

class BaseViewModel: NSObject {
    var mainColor = UIColor.green
    var secondaryColor = UIColor.white
    
    func prepareRightBarButtonItem(ofType type: UIBarButtonItem.SystemItem, withTarget target: Any?, andSelector selector: Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: type, target: target, action: selector)
        barButtonItem.tintColor = mainColor
        return barButtonItem
    }
}
