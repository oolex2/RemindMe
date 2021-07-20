//
//  TabBarDataSource.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class TabBarDataSource {
    
    //MARK: - Public
    
    func getListOfControllers() -> [UINavigationController] {
        return [homeTab(), homeTab()]
    }
    
    //MARK: - Private
    
    private func homeTab() -> UINavigationController {
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        homeTab.tabBarItem = UITabBarItem()
        homeTab.tabBarItem.title = "HOME"
        return homeTab
    }
}
