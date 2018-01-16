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

}
