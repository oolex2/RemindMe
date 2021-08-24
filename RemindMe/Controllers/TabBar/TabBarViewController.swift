//
//  ViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class TabBarViewController: BaseViewController {
    
    let viewModel = TabBarViewModel()
    var mainTabBarController: UITabBarController = UITabBarController()
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindProperties()
        presentTabBarController()
    }
    
    //MARK: - Private
    
    private func bindProperties() {
        viewModel.tabBarController.bind { [weak self] tabBarController in
            self?.mainTabBarController = tabBarController
        }
    }
    
    private func presentTabBarController() {
        viewModel.initTabBarController()
        self.present(mainTabBarController, animated: false, completion: nil)
        viewModel.initTabBar()
    }
}

