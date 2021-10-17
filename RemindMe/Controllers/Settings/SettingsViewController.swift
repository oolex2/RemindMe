//
//  SettingsViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 24.08.2021.
//

import UIKit

final class SettingsViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
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
        
        configureTableView()
        configureNavigation()
    }
    
    //MARK: - Private
    
    private func configureTableView() {
        tableView.register(UINib(nibName: SettingsTableViewCell.nibName, bundle: .main), forCellReuseIdentifier: SettingsTableViewCell.nibName)
        tableView.tableFooterView = UIView()
    }
    
    private func configureNavigation() {
        self.navigationItem.title = viewModel.title
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.nibName) as? SettingsTableViewCell else { return UITableViewCell() }
        cell.setTitle(viewModel.dataSource[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.handleAction(for: self, with: indexPath.row)
    }
}

extension SettingsViewController: ColorThemeDelegate {
    func colorDidChange() {
        self.tabBarController?.tabBar.tintColor = viewModel.mainColor
    }
}
