//
//  ProfileGoalTableViewCell.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 20/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class ProfileGoalTableViewCell: UITableViewCell {
    @IBOutlet weak var goalTitle: UILabel!
    @IBOutlet weak var goalDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
