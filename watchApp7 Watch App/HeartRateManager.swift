//
//  HeartRateManager.swift
//  watchApp7
//
//  Created by Tolga Bilgis on 6/3/25.
//

import Foundation
import HealthKit

class HeartRateManager: NSObject, ObservableObject {
    private let healthStore = HKHealthStore()
    private let heartRateType = HKQuantityType.quantityType(forIdentifier: .heartRate)!
    
    @Published var heartRate: Double?
    
    func requestAuthorization() {
        healthStore.requestAuthorization(toShare: nil, read: [heartRateType]) { success, _ in
            if success {
                self.startQuery()
            }
        }
    }
    
    private func startQuery() {
        let predicate = HKQuery.predicateForSamples(withStart: Date().addingTimeInterval(-60), end: nil)
        
        let query = HKAnchoredObjectQuery(type: heartRateType, predicate: predicate, anchor: nil, limit: HKObjectQueryNoLimit) { _, samples, _, _, _ in
            self.updateHeartRate(samples)
        }
        
        query.updateHandler = { _, samples, _, _, _ in
            self.updateHeartRate(samples)
        }
        
        healthStore.execute(query)
    }
    
    private func updateHeartRate(_ samples: [HKSample]?) {
        guard let samples = samples as? [HKQuantitySample] else { return }
        DispatchQueue.main.async {
            if let bpmSample = samples.last {
                self.heartRate = bpmSample.quantity.doubleValue(for: HKUnit(from: "count/min"))
            }
        }
    }
}
