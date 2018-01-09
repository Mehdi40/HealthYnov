//
//  RoundedUImage.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit

extension UIView {
    
    func circular(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.white) {
        let radius = frame.width / 2
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
    func roundedCorner(borderWidth: CGFloat = 0, borderColor: UIColor = UIColor.white) {
        let radius = frame.width / 2
        self.layer.cornerRadius = radius / 5
        self.layer.masksToBounds = true
        // self.layer.style
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
    
}
