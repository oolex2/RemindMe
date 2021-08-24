//
//  SettingsViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.08.2021.
//

import Foundation

final class SettingsViewController: BaseViewController {
    
    private let viewModel = SettingsViewModel()
    
    //MARK: Initialization
    
    init() {
        super.init(nibName: String(describing: SettingsViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
