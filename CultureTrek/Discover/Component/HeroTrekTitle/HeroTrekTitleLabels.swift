//
//  HeroTrekTitleLabels.swift
//  CultureTrek
//
//  Created by Apprenant174 on 06/08/2026.
//

import SwiftUI

struct HeroTrekTitleLabels: View {
    
    let title : String
    
    let city : String
    let region : String
    let department : String?
    
    var body: some View {
        VStack(alignment : .leading, spacing : Styles.labelsSpacing){
            
            UISectionTitleFontStyle(content: title, size: Styles.titleFontSize, weight: .heavy, width: .condensed, foreground: Styles.titleForeground)
                .lineLimit(2, reservesSpace: true)
            
            HStack(spacing : Styles.subtitleSpacing){
                Text(city + " • ")
                
                if let trekDepartment = department{
                    Text(trekDepartment)
                } else {
                    Text(region)
                }
            }
            .font(Font.spaceGrotesk(size: Styles.subtitleFontSize, weight: .medium))
            .foregroundStyle(Styles.subtitleForeground)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, Styles.labelsHorizontalPadding)
        .padding(.vertical, Styles.labelsVerticalPadding)
        .background(Styles.labelsBackground)
    }
}

fileprivate struct Styles {

    static let titleForeground = AppColor.inverseForegroundPrimary
    static let subtitleForeground = AppColor.inverseForegroundSecondary
    static let labelsBackground = AppColor.inverseBackground
    
    static let labelsSpacing = AppToken.Primitive.spacing1
    static let labelsHorizontalPadding = AppToken.Primitive.padding4
    static let labelsVerticalPadding = AppToken.Primitive.padding2
    
    static let titleFontSize = CGFloat(24)
    static let subtitleFontSize = CGFloat(15)
    
    static let subtitleSpacing = AppToken.Primitive.spacing0
    
}

#Preview {
    HeroTrekTitleLabels(title: Trek.example.name, city: Trek.example.city, region: Trek.example.region, department: Trek.example.department)
}
