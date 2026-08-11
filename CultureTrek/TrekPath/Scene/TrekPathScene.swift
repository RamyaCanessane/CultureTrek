//
//  TrekPathScene.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 11/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import MapKit
import SwiftUI

struct TrekPathScene: View {
    let riddles: [Riddle]
    let hasLastRiddle: Bool
    
    @State private var path: [MKRoute] = []
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Map(
            bounds: MapCameraBounds(
                centerCoordinateBounds: rect,
                minimumDistance: 250,
                maximumDistance: 10_000_000
            )
        ) {
            ForEach(riddles) { riddle in
                Annotation("", coordinate: riddle.coordinate) {
                    TrekPathMarker(riddle: riddle,
                                   kind: getTrekPathMarkerKind(riddle: riddle))
                }
            }
            
            ForEach(path, id: \.self) { route in
                MapPolyline(route)
                    .stroke(Styles.pathColor,
                            style: hasLastRiddle
                            ? Styles.pathCompletedStrokeStyle
                            : Styles.pathNotCompletedStrokeStyle)
            }
        }
        .task {
            self.path = await PathCalculator.getFullPath(with: coordinates)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                AppImage.Icon.close.image
            }
            .buttonStyle(.neubrutIcon(kind: .destructive))
            .padding(.trailing)
        }
    }
    
    private var coordinates: [CLLocationCoordinate2D] {
        riddles.map(\.coordinate)
    }
    
    private var rect: MKMapRect {
        coordinates
            .map { MKMapRect(origin: .init($0), size: .init(width: 1, height: 1)) }
            .reduce(MKMapRect.null) { $0.union($1) }
    }
    
    private func getTrekPathMarkerKind(riddle: Riddle) -> TrekPathMarker.Kind {
        if isFirstRiddle(riddle) {
            .first
        } else if hasLastRiddle && isLastRiddle(riddle) {
            .last
        } else {
            .other
        }
    }
    
    private func isFirstRiddle(_ riddle: Riddle) -> Bool {
        riddles.first?.id == riddle.id
    }
    
    private func isLastRiddle(_ riddle: Riddle) -> Bool {
        riddles.last?.id == riddle.id
    }
}

fileprivate enum Styles {
    
    static let pathColor: Color = .black
    static let pathCompletedStrokeStyle = StrokeStyle(lineWidth: 5)
    static let pathNotCompletedStrokeStyle = StrokeStyle(lineWidth: 2.5,
                                                         dash: [2.5, 2.5])
}

#Preview {
    TrekPathScene(riddles: Riddle.examples,
                  hasLastRiddle: false)
}
