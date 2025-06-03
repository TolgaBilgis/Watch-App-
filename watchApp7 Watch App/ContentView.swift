// ContentView.swift
// watchApp7 Watch App
//
// Created by Tolga Bilgis on 6/1/25.


import SwiftUI
import HealthKit

struct ContentView: View {
    @StateObject private var heartRateManager = HeartRateManager()
    
    var body: some View {
        VStack {
            if let bpm = heartRateManager.heartRate {
                Text("❤️ \(Int(bpm)) BPM")
                    .font(.title)
            } else {
                Text("Requesting...")
            }
        }
        .onAppear {
            heartRateManager.requestAuthorization()
        }
    }
}
