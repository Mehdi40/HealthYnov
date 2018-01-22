//
//  ViewController.swift
//  HealthYnov
//
//  Created by Mehdi LAFENETRE on 08/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import UIKit
import CoreMotion
import HealthKit

class ViewController: UIViewController, UINavigationBarDelegate, UIBarPositioningDelegate {
 
    // All outlets + HealthKit stuff
    
    @IBOutlet weak var activityTypeLabel: UILabel!
    @IBOutlet weak var steps: UILabel!
    @IBOutlet weak var NavBarCustom: UINavigationBar!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userlevel: UILabel!
    let healthStore = HKHealthStore()
    private let activityManager = CMMotionActivityManager()
    private let pedometer = CMPedometer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    // Tests
        
        NavBarCustom.delegate = self
 
    }
    
    // User status

    func startTrackingActivityType() {
        activityManager.startActivityUpdates(to: OperationQueue.main) {
            [weak self] (activity: CMMotionActivity?) in
            
            guard let activity = activity else { return }
            DispatchQueue.main.async {
                if activity.walking {
                    self?.activityTypeLabel.text = "Walking"
                } else if activity.stationary {
                    self?.activityTypeLabel.text = "Stationary"
                } else if activity.running {
                    self?.activityTypeLabel.text = "Running"
                } else if activity.automotive {
                    self?.activityTypeLabel.text = "Automotive"
                }
            }
        }
    }
    
    func startCountingSteps() {
        pedometer.startUpdates(from: Date()) {
            [weak self] pedometerData, error in
            guard let pedometerData = pedometerData, error == nil else { return }
            
            DispatchQueue.main.async {
                self?.steps.text = pedometerData.numberOfSteps.stringValue
            }
        }
    }
    
var days:[String] = []
var stepsTaken:[Int] = []

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
        
        let endDate = Date()
        
        guard let startDate = calendar.date(byAdding: .month, value: -3, to: endDate ) else {
            fatalError("*** Unable to calculate the start date ***")
        }
        
        statsCollection.enumerateStatistics(from: startDate, to: endDate) { [unowned self] statistics, stop in
            if let quantity = statistics.sumQuantity() {
                let date = statistics.startDate
                let value = quantity.doubleValue(for: HKUnit.count())
            }
        }
    }
    
    var statisticsUpdateHandler: ((HKStatisticsCollectionQuery, HKStatistics?, HKStatisticsCollection?, Error?) -> Void)?
    
    var initialResultsHandler: ((HKStatisticsCollectionQuery, HKStatisticsCollection?, Error?) -> Void)?
    
    healthStore.execute(query)
}

    private func startUpdating() {
        if CMMotionActivityManager.isActivityAvailable() {
            startTrackingActivityType()
        }
        
        if CMPedometer.isStepCountingAvailable() {
            startCountingSteps()
        }
    }
    
    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

func position(for bar: UIBarPositioning) -> UIBarPosition {
    return .topAttached
}
}

