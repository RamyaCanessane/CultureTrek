//
//  TrekDetailSingleInfoContent.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct SingleInfoContent: View {
    
    let trek : Trek
    
    let kind : String
    
    let icon : Image?
    
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
                
            case "distance".capitalized :
                
                icon
                    .font(
                        .system(
                            size: Styles.infoFontSize,
                            weight: .semibold
                        )
                    )
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text(trek.distanceToString())
                    .foregroundStyle(Styles.infoForeground)
                
            case "durée".capitalized :
                
                Text("~")
                    .font(
                        .system(
                            size: Styles.infoFontSize,
                            weight: .semibold
                        )
                    )
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text(trek.durationToString())
                    .foregroundStyle(Styles.infoForeground)
                
            case "dénivelé".capitalized :
                
                elevationToIcons
                    .font(
                        .system(
                            size: Styles.infoFontSize,
                            weight: .semibold
                        )
                    )
                
            case "énigmes".capitalized :
                
                icon
                    .font(
                        .system(
                            size: Styles.infoFontSize,
                            weight: .semibold
                        )
                    )
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text("\(trek.riddles.count)")
                    .foregroundStyle(Styles.infoForeground)
                
            default:
                Text("")
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
    static let infoIconSpacing = AppToken.Primitive.spacing0
    
    static let infoFontSize = CGFloat(15)
    
}

#Preview {
    SingleInfoContent(trek: Trek.example, kind: "énigmes".capitalized , icon: TrekDetailInfoViewModel().riddlesSection.icon)
}
