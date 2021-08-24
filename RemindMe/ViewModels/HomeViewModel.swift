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
    
    func prepareRightBarButtonItem(withTarget target: Any?, andSelector selector: Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: target, action: selector)
        barButtonItem.tintColor = mainColor
        return barButtonItem
    }
}
