//
//  PathCalculator.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 11/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import MapKit

final class PathCalculator {
    
    static func getFullPath(with coordinates: [CLLocationCoordinate2D]) async -> [MKRoute] {
        var routes: [MKRoute] = []
        
        guard coordinates.count >= 2 else {
            return []
        }
        
        for i in 0..<(coordinates.count - 1) {
            let route = await getPath(from: coordinates[i],
                                      to: coordinates[i + 1])
            
            if let route {
                routes.append(route)
            }
        }
        
        return routes
    }
    
    static func getPath(from coord1: CLLocationCoordinate2D,
                        to coord2: CLLocationCoordinate2D) async -> MKRoute? {
        let request = MKDirections.Request()
        
        request.source = MKMapItem(location: CLLocation(latitude: coord1.latitude,
                                                        longitude: coord1.longitude),
                                   address: nil)
        request.destination = MKMapItem(location: CLLocation(latitude: coord2.latitude,
                                                             longitude: coord2.longitude),
                                        address: nil)
        request.transportType = .walking
        
        let directions = MKDirections(request: request)
        let response = try? await directions.calculate()
        
        return response?.routes.first
    }
}
