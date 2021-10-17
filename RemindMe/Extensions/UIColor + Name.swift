//
//  UIColor + Name.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 17.10.2021.
//

import UIKit

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.systemBlue: return "Blue"
        case UIColor.systemGreen: return "Green"
        case UIColor.systemRed: return "Red"
        default: return nil
        }
    }
}
