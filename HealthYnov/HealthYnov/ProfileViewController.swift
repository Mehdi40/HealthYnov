//
//  ProfileViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreData

class ProfileViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    lazy var managedContext : NSManagedObjectContext = appDelegate.persistentContainer.viewContext
    var user: User!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var level: UILabel!
    
    @IBOutlet weak var age: UILabel!
    
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var weight: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetch: NSFetchRequest<User> = NSFetchRequest(entityName:"User")
        fetch.fetchLimit = 1
        
        let result = try? managedContext.fetch(fetch)
        user = result!.first!
        
        level.text =
        
        if let user = user {
            print(user.username ?? "No Name")
            print(user.age)
        }
        
//        username.text = String(user.username)
        
        
        // Do any additional setup after loading the view.
    }
    
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

}
