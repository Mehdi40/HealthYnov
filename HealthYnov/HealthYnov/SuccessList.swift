//
//  SuccessList.swift
//  HealthYnov
//
//  Created by Developer on 15/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreData

class SuccessListTableViewController: UIViewController, UITableViewDataSource {

    var context: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var success: [Success]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest: NSFetchRequest<Success> = Success.fetchRequest()
        success = try? context.fetch(fetchRequest)
        
        print(success)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return success?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SuccessTableViewCell else {
            fatalError("Wrong cell type")
        }
        

        
        //configure cell
//        cell.textLabel?.text = "Test1"
//        cell.detailTextLabel?.text = "Test2"
        
        let suc = success?[indexPath.row]
        let imagePath = suc?.icon
        cell.Title.text = suc?.name
        cell.Desc.text = suc?.desc
        

        cell.Picture.image = UIImage(named: "\(imagePath ?? "nil")")
        print(suc!.icon)

        return cell

    }
}

