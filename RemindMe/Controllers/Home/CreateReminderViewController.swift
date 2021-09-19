//
//  CreateReminderViewController.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 19.09.2021.
//

import UIKit

protocol CreateReminderDelegate: AnyObject {
    func didCreateReminder(_ reminder: Reminder)
}

final class CreateReminderViewController: BaseViewController {
    @IBOutlet private weak var titleField: UITextField!
    @IBOutlet private weak var subtitleField: UITextField!
    @IBOutlet private weak var intergateInPhoneSwitch: UISwitch!
    @IBOutlet private weak var datePicker: UIDatePicker!
    
    private let viewModel = CreateReminderViewModel()
    weak var delegate: CreateReminderDelegate?
    
    //MARK: - Initialization
    
    init() {
        super.init(nibName: String(describing: CreateReminderViewController.self), bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareNavigationItem()
        bindProperties()
    }
    
    // MARK: - Private
    
    private func prepareNavigationItem() {
        self.navigationItem.title = viewModel.title
        self.navigationItem.rightBarButtonItem = viewModel.prepareRightBarButtonItem(ofType: .done, withTarget: self, andSelector: #selector(doneAction))
    }
    
    private func bindProperties() {
        viewModel.titleField.bind { [weak self] titleField in
            self?.titleField = titleField
        }
        viewModel.subtitleField.bind { [weak self] subtitleField in
            self?.subtitleField = subtitleField
        }
        viewModel.intergateInPhoneSwitch.bind { [weak self] intergateInPhoneSwitch in
            self?.intergateInPhoneSwitch = intergateInPhoneSwitch
        }
        viewModel.datePicker.bind { [weak self] datePicker in
            self?.datePicker = datePicker
        }
    }
    
    // MARK: - Actions
    
    @objc private func doneAction() {
        viewModel.prepareData()
        guard let currentReminder = viewModel.currentReminder else { return }
        delegate?.didCreateReminder(currentReminder)
        self.navigationController?.popViewController(animated: true)
    }
}
