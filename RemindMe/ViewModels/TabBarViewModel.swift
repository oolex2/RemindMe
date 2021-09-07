//
//  TabBarViewModel.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import Foundation
import  UIKit

final class TabBarViewModel: BaseViewModel {
    
    let tabBarController: Observer<UITabBarController> = Observer(UITabBarController())
    
    let dataSource = TabBarDataSource()
    
    func initTabBarController() {
        tabBarController.value = UITabBarController()
        tabBarController.value.modalPresentationStyle = .fullScreen;
        tabBarController.value.tabBar.tintColor = mainColor;
        tabBarController.value.tabBar.barTintColor = UIColor(named: "lightGray")
    }
    
    func initTabBar() {
        tabBarController.value.setViewControllers(dataSource.getListOfControllers(), animated: true)
    }
}
