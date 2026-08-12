//
//  TrekDetailHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailHeader: View {
    
    let trek : Trek
    
    var body: some View {
        VStack(alignment : .leading, spacing : Styles.labelsSpacing){
            
            UITitle(content: trek.name.uppercased(), size: Styles.titleFontSize, weight: .heavy, width: .condensed, foreground: Styles.labelsForeground)
                .lineLimit(2, reservesSpace: true)
            
            HStack(spacing : Styles.subtitleSpacing){
                Text(trek.city + " • ")
                
                if let trekDepartment = trek.department {
                    Text(trekDepartment)
                } else {
                    Text(trek.region)
                }
            }
            .font(Font.spaceGrotesk(size: Styles.subtitleFontSize, weight: .medium))
            .foregroundStyle(Styles.labelsForeground)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Styles.labelsHorizontalPadding)
        .padding(.top, Styles.labelsTopPadding)
        
    }
}

fileprivate struct Styles {

    static let labelsForeground = AppColor.Label.primary
    
    static let labelsSpacing = AppToken.Primitive.spacing1
    static let labelsHorizontalPadding = AppToken.Primitive.padding4
    static let labelsTopPadding = AppToken.Primitive.padding2
    
    static let titleFontSize = CGFloat(24)
    static let subtitleFontSize = CGFloat(17)
    
    static let subtitleSpacing = AppToken.Primitive.spacing0
    
}


#Preview {
    TrekDetailHeader(trek: Trek.example)
}
