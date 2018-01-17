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
        
        cell.title.text = "Ta Grand Mère"
        cell.desc.text = "C'est ta grand-mère"
        return cell
    }
    
    
    //let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //lazy var managedContext : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    
    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var user: [User]!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    // Check if an user exists, or create it 😇
    // Hi Mehdi I just decided to put this func in your part so deal with it
    
    public func UserExists(){
        let dataHelper = DataHelper(context: self.persistentContainer.viewContext)
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        user = try? context.fetch(fetchRequest)
        
        let isIndexValid = user.indices.contains(0)
        
        if !isIndexValid {
            dataHelper.CreateJohnDoe()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        user = try? context.fetch(fetchRequest)
        
        //let result = try? managedContext.fetch(fetch)
        //user = result!.first!
        
        print(user)
        }
        
//        username.text = String(user.username)
        
        
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
