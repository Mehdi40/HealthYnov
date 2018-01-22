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
    
    let heightMAX: Double = 2.20
    let weightMAX: Double = 150
    let heightStep: Double = 0.01
    let weightStep: Double = 0.5
    var heightValues: [Double] = [1.0]
    var weightValues: [Double] = [30]
    let heightUnit: String = "m"
    let weightUnit: String = "kg"

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))        
        view.addGestureRecognizer(tap)
        
        while heightValues.last! < heightMAX {
            heightValues.append(heightValues.last! + heightStep)
        }
        
        while weightValues.last! < weightMAX {
            weightValues.append(weightValues.last! + weightStep)
        }
    }
    
// Function for removing the Keyboard after typing
    
    func dismissKeyboard() {
        view.endEditing(true)
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
            return String(heightValues[row]) + "m"
        }
        
        if component == 1 {
            return String(weightValues[row]) + "kg"
        }
        
        return nil
    }
    
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            pickerView.reloadComponent(1)
            
        }
        
    }
    
    @IBAction func SubmitButton(_ sender: Any) {
  
        let nicknameUser =  NicknameTF.text

        var gender : String
        
        switch(GenderSl.selectedSegmentIndex) {
        case 0:
            gender = "M"
            break
        case 1:
            gender = "F"
            break
        default:
            gender = "M"
            
        }
        
        let context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        var user: [User]!
        
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        userFetch.fetchLimit = 1
        userFetch.sortDescriptors = [NSSortDescriptor.init(key: "username", ascending: true)]
        let userList = try! context.fetch(userFetch)
        let currentUser: User = userList.first as! User
        currentUser.setValue(gender, forKey: "genre")
        currentUser.setValue(nicknameUser, forKey: "username")
        let heightSelected = heightValues[WHPicker.selectedRow(inComponent: 0)]
        let weightSelected = weightValues[WHPicker.selectedRow(inComponent: 1)]
        
        currentUser.setValue(heightSelected, forKey: "height")
        currentUser.setValue(weightSelected, forKey: "weight")
        
        do {
            try context.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        // send data and indentifi components TODO

//        var heightSelected = WHPicker(component == 0)
//        var weightSelected = WHPicker(component == 1)
        

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
