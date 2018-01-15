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
    var goal: [Goal]?
    
    @IBOutlet weak var successListSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fetchRequest: NSFetchRequest<Success> = Success.fetchRequest()
        success = try? context.fetch(fetchRequest)
        
        let fetchRequestGoals: NSFetchRequest<Goal> = Goal.fetchRequest()
        goal = try? context.fetch(fetchRequestGoals)
        
        print(success)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        return success?.count ?? 0
        var nbCell = 0
        
        switch(successListSegment.selectedSegmentIndex)
        {
        case 0:
//        tableView.reloadData()
        nbCell = success?.count ?? 0
            break
        case 1:
//        tableView.reloadData()
        nbCell = goal?.count ?? 0
            break
            
        default:
            break
            
        }
        
        return nbCell
    }
    
    // Cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SuccessTableViewCell else {
            fatalError("Wrong cell type")
        }
        

        let suc = success?[indexPath.row]
//        let goa = goal?[indexPath.row]
        let imagePath = suc?.icon

        
        switch(successListSegment.selectedSegmentIndex)
        {
        case 0:
            cell.Picture.image = UIImage(named: "\(imagePath ?? "nil")")
            cell.Title.text = suc?.name
            cell.Desc.text = suc?.desc
            break
        case 1:
            cell.Picture.image = UIImage(named: "cookie")
            cell.Title.text = suc?.name
            cell.Desc.text = suc?.desc
            break
            
        default:
            break
            
        }
        

        return cell

    }
}

