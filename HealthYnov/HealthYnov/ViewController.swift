//
//  ViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 08/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import HealthKit

class ViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate {
    
    
    @IBOutlet weak var NavBarCustom: UINavigationBar!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userlevel: UILabel!
    let healthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NavBarCustom.delegate = self
        
        getTodaysSteps { (completion) in
            
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getTodaysSteps(completion: @escaping (Double) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                completion(0.0)
                return
            }
            
            DispatchQueue.main.async {
                completion(sum.doubleValue(for: HKUnit.count()))
            }
        }
        
        healthStore.execute(query)
    }
    
    
    func StepsByWeek(completion: @escaping (Double) -> Void) {
        
        let calendar = NSCalendar.current;
        
        var interval = DateComponents()
        interval.day = 7
        
        let date = Date()
    
        var anchorComponents = calendar.dateComponents([.day, .month, .year, .hour], from: date)
        
       let sevenDaysBefore = calendar.date(byAdding: .day, value: -7, to: date)
        
        
        
        guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else {
            fatalError("*** Unable to create a step count type ***")
        }
        
        // Create the query
        let query = HKStatisticsCollectionQuery(quantityType: quantityType,
                                                quantitySamplePredicate: nil,
                                                options: .cumulativeSum,
                                                anchorDate: sevenDaysBefore!,
                                                intervalComponents: interval)
        
        // Set the results handler
        query.initialResultsHandler = {
            query, results, error in
            
            guard let statsCollection = results else {
                // Perform proper error handling here
                fatalError("*** An error occurred while calculating the statistics:  ***")
            }
            
            let endDate = NSDate()
            
//            guard let startDate = calendar.dateByAddingUnit(.Month, value: -3, toDate: endDate, options: []) else {
//                fatalError("*** Unable to calculate the start date ***")
//            }
            
            // Plot the weekly step counts over the past 3 months
//            statsCollection.enumerateStatisticsFromDate(startDate, toDate: endDate) { [unowned self] statistics, stop in
//
//                if let quantity = statistics.sumQuantity() {
//                    let date = statistics.startDate
//                    let value = quantity.doubleValueForUnit(HKUnit.countUnit())
//
//                    // Call a custom method to plot each data point.
//                    self.plotWeeklyStepCount(value, forDate: date)
//                }
//            }
        }
        
        var statisticsUpdateHandler: ((HKStatisticsCollectionQuery, HKStatistics?, HKStatisticsCollection?, Error?) -> Void)?
        
        var initialResultsHandler: ((HKStatisticsCollectionQuery, HKStatisticsCollection?, Error?) -> Void)?
        
        healthStore.execute(query)
    }
    
    func position(for bar: UIBarPositioning) -> UIBarPosition {
        return .topAttached
    }
}



// Comment appeler le contexte (BDD) : 
// let appDel = UIApplication.shared.delegate as! AppDelegate
// appDel.persistentContainer.viewContext
