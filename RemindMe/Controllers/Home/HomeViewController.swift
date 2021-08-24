//
//  HomeViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class HomeViewController: BaseViewController {

    let viewModel = HomeViewModel()
    
    //MARK: - Initialization
    
    init() {
        super.init(nibName: String(describing: HomeViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavigationItem()
    }
    
    private func prepareNavigationItem() {
        self.navigationItem.title = viewModel.title
        self.navigationItem.rightBarButtonItem = viewModel.prepareRightBarButtonItem(withTarget: self, andSelector: #selector(addAction))
    }
    
    //MARK: - Actions
    
    @objc func addAction() {
        
    }
    
    func deleteAction(reminder: Reminder) {
        
    }
}
