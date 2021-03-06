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
        viewModel.prepareNavigationBar()
    }
}
