//
//  SingleCompletionData.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct SingleCompletionData: View {
    
    let trek : Trek
    
    let kind : String
    
    let icon : Image?
    
    var body: some View {
        
        HStack(spacing: Styles.infoSpacing){
            
            switch kind {
                
            case "durée du parcours".capitalized :
                
                icon
                    .font(
                        .system(
                            size: Styles.infoFontSize,
                            weight: .semibold
                        )
                    )
                    .foregroundStyle(Styles.infoIconForeground)
                
                Text(trek.completionDurationToString())
                    .foregroundStyle(Styles.infoForeground)
                
            case "points obtenus".capitalized :
                
                icon!
                    .resizable()
                    .scaledToFit()
                    .frame(width: Styles.iconSize,
                           height: Styles.iconSize)
                
                if let hasPoints = trek.completion?.earnedPoints {
                    
                    Text("\(hasPoints) points")
                        .foregroundStyle(Styles.infoForeground)
                    
                } else {
                    
                    Text("Pas de point")
                    
                }
                
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
    static let infoForeground = AppColor.Label.primary
    
    static let infoSpacing = AppToken.Primitive.spacing1
    static let infoIconSpacing = AppToken.Primitive.spacing0
    
    static let infoFontSize = CGFloat(14)
    static let iconSize = CGFloat(20)
    
}
#Preview {
    SingleCompletionData(trek: Trek.example, kind: "durée du parcours".capitalized, icon: CompletedTrekDetailInfoViewModel().durationSection.icon)
}
