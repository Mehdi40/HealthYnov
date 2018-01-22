//
//  ProfileTableViewCell.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 16/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

// TableViewCells for the Profile View

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
