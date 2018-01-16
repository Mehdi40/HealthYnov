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
    @IBOutlet weak var WHPicker: UIPickerView!
    @IBOutlet weak var GenderSl: UISegmentedControl!
    
	
    let heightMAX: Double = 2.40
    let weightMAX: Double = 150
    let heightStep: Double = 0.05
    let weightStep: Double = 0.5
    var heightValues: [Double] = [1.0]
    var weightValues: [Double] = [30]
    let heightUnit: String = "m"
    let weightUnit: String = "kg"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        while heightValues.last! < heightMAX {
            heightValues.append(heightValues.last! + heightStep)
        }
        
        while weightValues.last! < weightMAX {
            weightValues.append(weightValues.last! + weightStep)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 0 {
            return heightValues.count
        }
        // add unit TODO
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
    
    public func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            pickerView.reloadComponent(1)
            
        }
        let heightSelected = heightValues[pickerView.selectedRow(inComponent: 0)]
        let weightSelected = weightValues[pickerView.selectedRow(inComponent: 1)]
        
        print("\(heightSelected), \(weightSelected)")
        
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
        
        // send data and indentifi components TODO
        let nicknameUser =  NicknameTF.text
        //var heightSelected = WHPicker(component == 0)
        //var weightSelected = WHPicker(component = 1)
        
        switch(GenderSl.selectedSegmentIndex) {
            case 0:
                var Gender = "M"
                break
            case 1:
                var Gender = "F"
                break
        default:
            var Gender = "M"
            
        }
    }
    
    
    func SignIN(nickname:String, height:Double, weight:Double, gender:Bool) {
        
  
        //Fonction for signup
        
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
