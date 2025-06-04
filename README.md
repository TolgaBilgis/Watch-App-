# Live HeartRate Monitor Watch App

A real-time Apple Watch app that actively monitors your heart rate and provides insights into your cardiovascular effort, including fat burning, endurance, and peak performance zones. The app also estimates VO₂ max using HealthKit data.

## Features

- Live Heart Rate Monitoring  
  Continuously reads your heart rate using the Apple Watch's built-in sensor.

- Workout Zone Classification  
  Automatically determines your heart rate zone:
  - Fat Burn Zone
  - Endurance/Cardio Zone
  - Peak/Anaerobic Zone

- VO₂ Max Estimation  
  Estimates your VO₂ max based on age and heart rate.


## Screenshots

Coming soon.

## Technologies Used

- SwiftUI  
- HealthKit  
- watchOS SDK  

## Heart Rate Zones

Heart rate zones are based on estimated maximum heart rate using the formula:  
**Max HR = 220 - age**

| Zone              | % Max HR       | Description                  |
|-------------------|----------------|------------------------------|
| Fat Burn          | 50–65%         | Light aerobic activity       |
| Endurance/Cardio  | 65–80%         | Moderate-intensity training  |
| Peak/Anaerobic    | 80–90%+        | High-performance effort      |

