//
//  SettingsViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.08.2021.
//

import UIKit

final class SettingsViewModel: BaseViewModel {
    
   private weak var delegate: ColorThemeDelegate?
    
    private struct Constants {
        static let title = "Settings"
        static let cancel = "Cancel"
        static let alertTitle = "Choose applicaiton theme"
        static let applicationTheme = "Application Theme"
        static let about = "About"
    }
    
    var title: String {
        Constants.title
    }
    
    var dataSource: [String] {
        return [Constants.applicationTheme, Constants.about]
    }
    
    func handleAction(for viewController: SettingsViewController, with index: Int) {
        switch index {
        case 0:
            delegate = viewController
            showChooseTheme(for: viewController)
        case 1:
            return
        default:
            return
        }
    }
    
    private func showChooseTheme(for viewController: UIViewController) {
        let alertController = UIAlertController(title: Constants.alertTitle, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(prepareAlertAction(color: .systemGreen))
        alertController.addAction(prepareAlertAction(color: .systemBlue))
        alertController.addAction(prepareAlertAction(color: .systemRed))
        alertController.addAction(UIAlertAction(title: Constants.cancel, style: .cancel))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    private func prepareAlertAction(color: UIColor) -> UIAlertAction {
        UIAlertAction(title: color.name, style: .default) { [unowned self] _ in
            UserDefaults.standard.setValue(color.name, forKey: "MainColorName")
            delegate?.colorDidChange()
        }
    }
}
