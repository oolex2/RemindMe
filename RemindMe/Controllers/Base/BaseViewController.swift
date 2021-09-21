//
//  BaseViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    private let viewModel = BaseViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationItem()
    }
    
    //MARK: - Private
    
    private func configureNavigationItem() {
        self.navigationController?.navigationBar.barTintColor = viewModel.secondaryColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.tintColor = viewModel.mainColor
        configureBackNavigation()
    }
    
    private func configureBackNavigation() {
        let backButton = UIBarButtonItem()
        backButton.title = String()
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
