//
//  RiddleTime.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleTime: View {
    let time: Time
    
    enum Time {
        case stopWatch(startDate: Date)
        case duration(Duration)
    }
    
    var body: some View {
        HStack(alignment: .center,
               spacing: Styles.spacing) {
            AppImage.Icon.riddleTime.image
                .font(Styles.iconFont)
                .foregroundStyle(Styles.iconColor)
            
            switch time {
            case .stopWatch(let startDate):
                TimelineView(.periodic(from: startDate, by: 1)) { context in
                    let duration = Duration.seconds(context.date.timeIntervalSince(startDate))
                    Text(duration.formatted(.units(allowed: [.hours, .minutes, .seconds],
                                                   width: .abbreviated)))
                    .font(Styles.labelFont)
                    .foregroundStyle(Styles.labelColor)
                }
            case .duration(let duration):
                Text(duration.formatted(.units(allowed: [.hours, .minutes, .seconds],
                                               width: .abbreviated)))
                .font(Styles.labelFont)
                .foregroundStyle(Styles.labelColor)
            }
            
            
        }
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing2
    
    static let iconFont: Font = .system(size: 20,
                                        weight: .semibold)
    static let iconColor = AppColor.iconAccent
    
    static let labelFont: Font = .spaceGrotesk(size: 20,
                                               weight: .semibold)
    static let labelColor = AppColor.Label.primary
}

#Preview {
    VStack {
        RiddleTime(time: .stopWatch(startDate: .now))
        
        RiddleTime(time: .duration(.seconds(15 * 60 + 3)))
    }
}
