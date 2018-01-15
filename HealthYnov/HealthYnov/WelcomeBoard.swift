//
//  WelcomeBoard.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreData

class WelcomeBoardController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return height[row]
    }
    

    
    @IBOutlet weak var NicknameTF: UITextField!
    @IBOutlet weak var HeightPicker: UIPickerView!
    @IBOutlet weak var WeightPicker: UIPickerView!
    @IBOutlet weak var GenderSl: UISegmentedControl!
    @IBAction func SubmitButton(_ sender: Any) {
        
        let nicknameUser =  NicknameTF.text
        let height = HeightPicker
        let weight = WeightPicker
        let
    }
    
    let Weight = ["1,00", "1,05", ]
    
    func SignIN(nickname:String, height:Float, weight:Float, gender:Bool) {
        
  
        
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
