//
//  ProfileViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ProfileViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as? ProfileTableViewCell
          else {
              fatalError("Wrong cell type")
            }
        
        //if let suc = lastItems[0] as? Success {
        //    cell.successTitle.text = suc.name
        //    cell.successDesc.text = suc.desc
        //} else {
        //    cell.successTitle.text = "Pas de succès"
        //    cell.successDesc.text = "Débloquez des succès."
        //}
        
        //if let goa = lastItems[1] as? Goal {
        //    cellGoal.goalTitle.text = goa.name
        //    cellGoal.goalDesc.text = goa.desc
        //} else {
        //    cellGoal.goalTitle.text = "Pas d'objectif"
        //   cellGoal.goalDesc.text = "Débloquez des objectifs."
        //}

        if indexPath.row == 0 {
            if let suc = lastItems[0] as? Success {
                cell.title.text = suc.name
                cell.desc.text = suc.desc
            } else {
                cell.title.text = "Pas de succès"
                cell.desc.text = "Débloquez des succès."
            }
            
            return cell
        } else if indexPath.row == 1 {
            if let goa = lastItems[1] as? Goal {
                cell.title.text = goa.name
                cell.desc.text = goa.desc
            } else {
                cell.title.text = "Pas d'objectif"
                cell.desc.text = "Débloquez des objectifs."
            }
            
            return cell
        }
        return cell
        
    }
    
    
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //lazy var managedContext : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var user: [User]!
    var success: [Success]!
    var goal: [Goal]!
    var lastItems = [Any]()
    
    @IBOutlet weak var NavBarCustom: UINavigationBar!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var addActivityButton: UIButton!
    
    // Check if an user exists, or create it 😇
    // Hi Mehdi I just decided to put this func in your part so deal with it
    
 //   public func UserExists(){
   //     let dataHelper = DataHelper(context: self.persistentContainer.viewContext)
     //   let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
       // user = try? context.fetch(fetchRequest)
        
        //let isIndexValid = user.indices.contains(0)
        
      //  if !isIndexValid {
        //    dataHelper.CreateJohnDoe()
        //}
        
   // }
    
    // These function checks if the user info is already filled. If not, we're asking some more!
    
    public func gotYourInformations(){
        let userTest = user?[0].username
        let userTest2 = ("\(userTest ?? "nil")")
        print(userTest2)
        if userTest2 == "JohnDoe" {
        
  //          performSegue(withIdentifier: "goFillInfos", sender: Any?.self)
            
    print("gg lol")
            

            DispatchQueue.main.async {
                
                
                [unowned self] in
                self.performSegue(withIdentifier: "firstConnexion", sender: self)
            }
    }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        profilePic.image = image
    }
    
    @objc func tappedImage(_ sender: UITapGestureRecognizer) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = (self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate)
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // We're going to fetch the last success which has been unlocked
        let successFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Success")
        successFetch.fetchLimit = 1
        successFetch.sortDescriptors = [NSSortDescriptor.init(key: "dateUnlock", ascending: false)]
        successFetch.predicate = NSPredicate(format: "self.unlocked == %@", NSNumber(booleanLiteral: true))
        let userSuccesses = try! context.fetch(successFetch)
        let userSuccess = userSuccesses.first
        
        // We're going to fetch the last goal which has been unlocked
        let goalFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        goalFetch.fetchLimit = 1
        goalFetch.sortDescriptors = [NSSortDescriptor.init(key: "dateUnlock", ascending: false)]
        goalFetch.predicate = NSPredicate(format: "self.unlocked == %@", NSNumber(booleanLiteral: true))
        let userGoals = try! context.fetch(goalFetch)
        let userGoal = userGoals.first
        
        if let suc = userSuccess as? Success {
            lastItems.append(suc)
        } else {
            lastItems.append("No")
        }
        
        if let goa = userGoal as? Goal {
            lastItems.append(goa)
        } else {
            lastItems.append("No")
        }
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        user = try? context.fetch(fetchRequest)

     //   UserExists()
        let realUser = user?[0]
        
        username.text = String(realUser!.username!)
        age.text = String(realUser!.age)
        height.text = String(realUser!.height)
        weight.text = String(realUser!.weight)
        let userLevel = Int(realUser!.experience) / 1000
        level.text = String(userLevel)
        profilePic.image = UIImage(named: "biking-bronze")
        
        progressbar.progress = Float(30)
        progressbar.transform = progressbar.transform.scaledBy(x: 1, y: 5)
        
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        profilePic.addGestureRecognizer(tapImage)
        profilePic.tag = 1
        
        gotYourInformations()
        addActivityButton.backgroundColor = UIColor.YnovGreen
    }
        
        
        // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "HealthYnov")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // Adding Core Data Stack
    
    lazy var applicationDocumentsDirectory: URL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.andrewcbancroft.Zootastic" in the application's documents Application Support directory.
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count-1]
    }()
    
    // End Adding Core Data Stack
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
