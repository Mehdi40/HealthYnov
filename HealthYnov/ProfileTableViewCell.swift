//
//  ProfileTableViewCell.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 16/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var successTitle: UILabel!
    @IBOutlet weak var successDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
