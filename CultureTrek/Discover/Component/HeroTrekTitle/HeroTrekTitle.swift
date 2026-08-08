//
//  HeroTrekTitle.swift
//  CultureTrek
//
//  Created by Apprenant174 on 06/08/2026.
//

import SwiftUI

struct HeroTrekTitle: View {
    
    let trekTitle : String
    let trekCity : String
    let trekDepartment : String?
    let trekRegion : String
    
    let trekPicture : Image
    let sectionTag : String
    
    var body: some View {
        VStack(spacing : Styles.heroSpacing){
            HeroTrekTitlePic(picture: trekPicture, tag: sectionTag)
            HeroTrekTitleLabels(title: trekTitle, city: trekCity, region: trekRegion, department: trekDepartment)
        }
        .border( Styles.heroBorderColor, width: Styles.heroBorderWidth)
        .mask {
            RoundedRectangle(cornerRadius: Styles.heroCornerRadius)
        }
        .padding(Styles.heroPadding)

    }
}

fileprivate struct Styles {
    
    static let heroBorderColor = AppColor.border
    
    static let heroBorderWidth = AppToken.borderWidth
    static let heroCornerRadius = AppToken.cornerRadius
    static let heroSpacing = AppToken.Primitive.spacing0
    static let heroPadding = AppToken.Primitive.spacing4
    
}

#Preview {
    HeroTrekTitle(trekTitle: Trek.example.name, trekCity: Trek.example.city, trekDepartment: Trek.example.department, trekRegion: Trek.example.region, trekPicture: Trek.example.picture, sectionTag: "En vedette cette semaine")
}
