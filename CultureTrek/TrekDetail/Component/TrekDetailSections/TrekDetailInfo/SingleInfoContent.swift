//
//  TrekDetailSingleInfoContent.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct SingleInfoContent: View {
    
    let trek : Trek
    
    let kind : TrekDetailInfoContent
    
    var icon : Image? {
        
        switch kind {
        case .distance:
            return AppImage.Icon.distance.image
        case .elevation:
            return AppImage.Icon.elevation.image
        case .riddles:
            return AppImage.Icon.riddle.image
        default :
            return nil
        }
        
    }
    
    var elevationToIcons : some View {
        
        switch trek.elevation {
            
        case .low:
            
            return HStack(spacing: Styles.infoIconSpacing) {
                
                icon
                    .foregroundStyle(Styles.infoIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoOffIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoOffIconForeground)
            }
            .font(.system(size: Styles.infoFontSize, weight: .medium))
            
        case .medium :
            
            return HStack(spacing: Styles.infoIconSpacing) {
                
                icon
                    .foregroundStyle(Styles.infoIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoOffIconForeground)
            }
            .font(.system(size: Styles.infoFontSize, weight: .medium))
            
        case .high :
            
            
            return HStack(spacing: Styles.infoIconSpacing) {
                
                icon
                    .foregroundStyle(Styles.infoIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoIconForeground)
                
                icon
                    .foregroundStyle(Styles.infoOffIconForeground)
            }
            .font(.system(size: Styles.infoFontSize, weight: .medium))
            
        }
    }
    
    var body: some View {
        
        HStack(spacing: Styles.infoSpacing){
            
            switch kind {
                
            case .distance:
                
                icon
                    .font(.system(size: Styles.infoFontSize, weight: .semibold))
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text(trek.distanceToString())
                    .foregroundStyle(Styles.infoForeground)
                
            case .duration:
                
                Text("~")
                    .font(.system(size: Styles.infoFontSize, weight: .semibold))
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text(trek.durationToString())
                    .foregroundStyle(Styles.infoForeground)
                
            case .elevation:
                
                elevationToIcons
                    .font(.system(size: Styles.infoFontSize, weight: .semibold))
                
            case .riddles:
                
                icon
                    .font(.system(size: Styles.infoFontSize, weight: .semibold))
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text("\(trek.riddles.count)")
                    .foregroundStyle(Styles.infoForeground)
            }
            
        }
        .font(.spaceGrotesk(size: Styles.infoFontSize, weight: .medium))
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate struct Styles {
    
    static let infoIconForeground = AppColor.iconAccent
    static let infoOffIconForeground = infoForeground.opacity(0.24)
    static let infoForeground = AppColor.Label.primary
    
    static let infoSpacing = AppToken.Primitive.spacing2
    static let infoIconSpacing = AppToken.Primitive.spacing0_5
    
    static let infoFontSize = CGFloat(15)
    
}

#Preview {
    SingleInfoContent(trek: Trek.example, kind: .riddles)
}
