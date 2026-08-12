//
//  TrekFinishedColInfoRow.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct TrekFinishedColInfoRow: View {
    let duration: Duration?
    let points: UInt?
    let rank: (current: UInt, total: UInt)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top,
                   spacing: Styles.hSpacing) {
                if let duration {
                    DurationColInfo(label: "Durée",
                                    duration: duration)
                }
                
                if let points {
                    PointsColInfo(label: "Points",
                                  points: points)
                }
                
                if let rank {
                    RankingColInfo(label: "Classement",
                                   rank: rank)
                }
            }
                   .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing5
}

#Preview {
    TrekFinishedColInfoRow(duration: .seconds(1 * 60 * 60 + 5 * 60),
                           points: 305,
                           rank: (current: 21, total: 401))
}
