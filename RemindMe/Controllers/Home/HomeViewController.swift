//
//  HomeViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class HomeViewController: BaseViewController, Observable {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var Error: UILabel!
    let viewModel = HomeViewModel()
    
    //MARK: - Initialization
    
    init() {
        super.init(nibName: String(describing: HomeViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func loginpressed(_ sender: Any) {
        viewModel.name.value = name.text!
        viewModel.password.value = password.text!
        
        viewModel.onChange()
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.error.observer = self
        
    }
    
    func onChange() {
        Error.text = viewModel.error.value
    }
    
}
