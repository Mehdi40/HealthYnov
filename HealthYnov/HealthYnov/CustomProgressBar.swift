//
//  CustomProgressBar.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 16/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import UIKit

class CustomProgressBar: UIProgressView {
    
    var height:CGFloat = 1.0
    // Do not change this default value,
    // this will create a bug where your progressview wont work for the first x amount of pixel.
    // x being the value you put here.
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size:CGSize = CGSize.init(width: self.frame.size.width, height: height)
        
        return size
    }
    
}
