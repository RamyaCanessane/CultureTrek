//
//  DistanceCalculator.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 10/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import CoreLocation
import Foundation

final class DistanceCalculator {
    
    static func calculateDistance(from fromCoordinate: CLLocationCoordinate2D,
                                  to toCoordinate: CLLocationCoordinate2D) -> Measurement<UnitLength> {
        let location1 = CLLocation(latitude: fromCoordinate.latitude,
                                   longitude: fromCoordinate.longitude)
        let location2 = CLLocation(latitude: toCoordinate.latitude,
                                   longitude: toCoordinate.longitude)
        
        let distanceInMeters = location1.distance(from: location2)
        let measurement = Measurement(value: distanceInMeters,
                                      unit: UnitLength.meters)
        
        return measurement
    }
}
