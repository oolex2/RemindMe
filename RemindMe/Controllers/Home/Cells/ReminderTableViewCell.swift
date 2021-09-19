//
//  ReminderTableViewCell.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 07.09.2021.
//

import UIKit

final class ReminderTableViewCell: UITableViewCell {
    static let nibName = String(describing: ReminderTableViewCell.self)

    @IBOutlet private weak var borderView: UIView!
    @IBOutlet private weak var mainTitle: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 2
        static let borderColor = UIColor(named: "lightGray") ?? UIColor.lightGray
    }
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        configureBorderView()
        configureSelection()
    }
    
    //MARK: - Private
    
    private func configureBorderView() {
        borderView.layer.cornerRadius = Constants.cornerRadius
        borderView.layer.borderWidth = Constants.borderWidth
        borderView.layer.borderColor = Constants.borderColor.cgColor
    }
    
    private func configureSelection() {
        self.selectionStyle = .none
    }
    
    //MARK: - Public
    
    func configure(with reminder: Reminder) {
        mainTitle.text = reminder.title
        subTitle.text = reminder.subtitle
        dateLabel.text = reminder.date.description
    }
}
