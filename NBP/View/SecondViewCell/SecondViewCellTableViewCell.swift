//
//  SecondViewCellTableViewCell.swift
//  NBP
//
//  Created by XCodeClub on 2020-03-14.
//  Copyright © 2020 XCodeClub. All rights reserved.
//

import UIKit

class SecondViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
