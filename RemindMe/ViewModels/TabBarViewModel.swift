//
//  TabBarViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import Foundation
import  UIKit

final class TabBarViewModel: BaseViewModel {
    
    let tabBarController: Box<UITabBarController> = Box(UITabBarController())
    
    let dataSource = TabBarDataSource()
    
    private struct Constants {
        static let barTintColor = UIColor.red
    }
    
    func initTabBarController() {
        tabBarController.value = UITabBarController()
        tabBarController.value.modalPresentationStyle = .fullScreen;
        tabBarController.value.tabBar.tintColor = Constants.barTintColor;
        tabBarController.value.tabBar.barTintColor = .cyan
    }
    
    func initTabBar() {
        tabBarController.value.setViewControllers(dataSource.getListOfControllers(), animated: true)
    }
}
