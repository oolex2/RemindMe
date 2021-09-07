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
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let borderWidth: CGFloat = 2
        static let borderColor = UIColor(named: "lightGray") ?? UIColor.lightGray
    }
    
    //MARK: - Lifecycle
    
    override func awakeFromNib() {
        configureBackgroundView()
    }
    
    //MARK: - Private
    
    private func configureBackgroundView() {
        borderView.layer.cornerRadius = Constants.cornerRadius
        borderView.layer.borderWidth = Constants.borderWidth
        borderView.layer.borderColor = Constants.borderColor.cgColor
    }
    
    //MARK: - Public
    
    func configure(withReminder reminder: Reminder) {
        mainTitle.text = reminder.title
        subTitle.text = reminder.subTitle
    }
}
