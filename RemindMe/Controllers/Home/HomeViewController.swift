//
//  HomeViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
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
        registerNibs()
    }
    
    private func prepareNavigationItem() {
        self.navigationItem.title = viewModel.title
        self.navigationItem.rightBarButtonItem = viewModel.prepareRightBarButtonItem(withTarget: self, andSelector: #selector(addAction))
    }
    
    private func bindProperties() {
        viewModel.tableView.bind { [weak self] tableView in
            self?.tableView = tableView
        }
    }
    
    private func registerNibs() {
        tableView.register(UINib(nibName: ReminderTableViewCell.nibName, bundle: .main), forCellReuseIdentifier: ReminderTableViewCell.nibName)
    }
    
    //MARK: - Actions
    
    @objc func addAction() {
        
    }
    
    func deleteAction(reminder: Reminder) {
        
    }
    
}

//MARK: - UITableView methods

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.reminders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let reminderCell = tableView.dequeueReusableCell(withIdentifier: ReminderTableViewCell.nibName) as? ReminderTableViewCell else { return UITableViewCell()}
        let reminder = viewModel.reminders[indexPath.row]
        reminderCell.configure(withReminder: reminder)
        return reminderCell
    }
}
