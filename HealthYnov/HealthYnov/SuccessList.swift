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
        

        
        
        
        let selectedIndex = self.successListSegment.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            return success?.count ?? 0
        case 1:
            return goal?.count ?? 0
        //Add other cases here
        default:
            return 0
        }
        
        
    }
    
    // Cell
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SuccessTableViewCell else { fatalError("Wrong cell type")}
        let selectedIndex = self.successListSegment.selectedSegmentIndex
        switch selectedIndex
        {
        case 0:
            let suc = success?[indexPath.row]
            let imagePath = suc?.icon
            cell.Picture.image = UIImage(named: "\(imagePath ?? "nil")")
            cell.Title.text = suc?.name
            cell.Desc.text = suc?.desc
            break
        case 1:
            let goa = goal?[indexPath.row]
            cell.Picture.image = UIImage(named: "cookie")
            cell.Title.text = goa?.name
            cell.Desc.text = goa?.desc
            break
            
        //Add other cases here
        default:
            break
        }
        return cell
    }
    
    @IBOutlet private weak var tableView: UITableView!

    
    @IBAction func valueChanged(_ sender: Any) {
//                self.tableView?.reloadData()
        DispatchQueue.main.async{
            self.tableView?.reloadData()
        }
 }
    

}

