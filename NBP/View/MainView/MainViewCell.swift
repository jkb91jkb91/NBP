//
//  MainViewCell.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-09.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    @IBOutlet weak var CurrencyNameLabel: UILabel!
    @IBOutlet weak var CurrencyCodeLabel: UILabel!
    @IBOutlet weak var CurrencyDateLabel: UILabel!
    @IBOutlet weak var AverageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
