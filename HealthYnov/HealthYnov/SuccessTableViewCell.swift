	//
//  SuccessTableViewCell.swift
//  HealthYnov
//
//  Created by Developer on 15/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

class SuccessTableViewCell: UITableViewCell {
    
    // First outlet is Success/Achievement's Title
    // Second outlet is Success/Achievements's Description
    // Third outlet is an illustration
    
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var Desc: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
