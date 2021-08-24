//
//  TabBarDataSource.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class TabBarDataSource {
    
    private struct Constants {
        struct Home {
            static let title = "HOME"
            static let image = UIImage(named: "homeTab") ?? UIImage()
        }
        struct Settings {
            static let title = "SETTINGS"
            static let image = UIImage(named: "settingsTab") ?? UIImage()
        }
    }
    
    //MARK: - Public
    
    func getListOfControllers() -> [UINavigationController] {
        return [homeTab(), settingsTab()]
    }
    
    //MARK: - Private
    
    private func homeTab() -> UINavigationController {
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        homeTab.tabBarItem = UITabBarItem()
        homeTab.tabBarItem.title = Constants.Home.title
        homeTab.tabBarItem.image = Constants.Home.image
        return homeTab
    }
    
    private func settingsTab() -> UINavigationController {
        let settingsTab = UINavigationController(rootViewController: SettingsViewController())
        settingsTab.tabBarItem = UITabBarItem()
        settingsTab.tabBarItem.title = Constants.Settings.title
        settingsTab.tabBarItem.image = Constants.Settings.image
        return settingsTab
    }
}
