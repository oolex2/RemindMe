//
//  HomeViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.07.2021.
//

import UIKit

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    
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
    
    //MARK: - Private
    
    private func prepareNavigationItem() {
        self.navigationItem.title = viewModel.title
        self.navigationItem.rightBarButtonItem = viewModel.prepareRightBarButtonItem(ofType: .add, withTarget: self, andSelector: #selector(addAction))
    }
    
    private func registerNibs() {
        tableView.register(UINib(nibName: ReminderTableViewCell.nibName, bundle: .main), forCellReuseIdentifier: ReminderTableViewCell.nibName)
    }
    
    private func updateData() {
        viewModel.filter(for: HomeViewModel.DataType(rawValue: segmentedControl.selectedSegmentIndex) ?? .actual)
        tableView.reloadData()
    }
    
    
    //MARK: - Actions
    
    @objc private func addAction() {
        let controller = CreateReminderViewController()
        controller.delegate = self
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @IBAction private func segmentedAction(_ sender: Any) {
        updateData()
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
        reminderCell.configure(with: reminder)
        return reminderCell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        viewModel.delete(at: indexPath.row)
        updateData()
    }
}

// MARK: - CreateReminderDelegate

extension HomeViewController: CreateReminderDelegate {
    func didCreateReminder(_ reminder: Reminder) {
        viewModel.didCreateReminder(reminder)
        updateData()
    }
}
