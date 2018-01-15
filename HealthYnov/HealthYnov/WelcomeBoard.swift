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
    
    @IBOutlet weak var NicknameTF: UITextField!
    @IBOutlet weak var HeightPicker: UIPickerView!
    @IBOutlet weak var GenderSl: UISegmentedControl!
    
    let heightTotal: Double = 2.40
    let heightStep: Double = 0.05
    var heightValues: [Double] = [1.0]
    var weightValues: [Double] = [40]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        while heightValues.last! < heightTotal {
            heightValues.append(heightValues.last! + heightStep)
        }
        
        print(heightValues)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return heightValues.count
        }
        
        if component == 1 {
            return weightValues.count
        }
        
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return String(heightValues[row])
        }
        
        if component == 1 {
            return String(weightValues[row])
        }
        
        return nil
    }
    

    
    @IBAction func SubmitButton(_ sender: Any) {
        
        let nicknameUser =  NicknameTF.text
        let height = HeightPicker
        let weight = WeightPicker
        let gender = GenderSl
    }
    
    
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
