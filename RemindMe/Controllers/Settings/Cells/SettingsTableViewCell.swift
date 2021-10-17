//
//  SettingsCell.swift
//  RemindMe
//
//  Created by Oleksandr Oleksyn on 17.10.2021.
//

import UIKit

final class SettingsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var mainTitle: UILabel!
    
    static let nibName = String(describing: SettingsTableViewCell.self)
    
    override func prepareForReuse() {
        mainTitle.text = nil
    }
    
    func setTitle(_ title: String) {
        mainTitle.text = title
    }
}
