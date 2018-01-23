//
//  DataHelper.swift
//  HealthYnov
//
//  Created by Developer on 09/01/2018.
//  Copyright © 2018 Ynov. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import HealthKit

// This DataHelper will help us get data from HealthKit

public class HealthKitDataHelper{
    
    func requestAuthorization() {
        let healthStore: HKHealthStore? = {
            if HKHealthStore.isHealthDataAvailable() {
                return HKHealthStore()
            } else {
                return nil
            }
        }()
    
        let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        let distanceSwimming = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceSwimming)
        let distanceCycling = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceCycling)
        let distanceWalkingOrRunning = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)
        let flightsClimbed = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.flightsClimbed)
        
        let dataTypesToWrite = NSMutableSet(object: stepsCount!)
        let dataTypesToRead = NSMutableSet(object: stepsCount!)
        
        dataTypesToRead.add(distanceSwimming!)
        dataTypesToRead.add(distanceCycling!)
        dataTypesToRead.add(distanceWalkingOrRunning!)
        dataTypesToWrite.add(flightsClimbed!)
        
        healthStore?.requestAuthorization(toShare: dataTypesToWrite as? Set<HKSampleType>, read: dataTypesToRead as? Set<HKObjectType>, completion: { [unowned self] (success, error) in
            if success {
                print("SUCCESS")
            } else {
                print(error!)
            }
        })
    }
  
    func retrieveStepCount() {
        let healthStore: HKHealthStore? = {
            if HKHealthStore.isHealthDataAvailable() {
                return HKHealthStore()
            } else {
                return nil
            }
        }()
        
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
            
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
            
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            guard let result = result, let sum = result.sumQuantity() else {
                print("Failed to fetch steps = \(error?.localizedDescription ?? "N/A")")
                //completion(0.0)
                return
            }
                
            DispatchQueue.main.async {
                //completion(sum.doubleValue(for: HKUnit.count()))
            }
        }
            
        healthStore?.execute(query)
        print(healthStore!)
    }
}
