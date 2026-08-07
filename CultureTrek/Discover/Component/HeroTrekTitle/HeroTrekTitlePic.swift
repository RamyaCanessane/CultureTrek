//
//  HeroTrekTitlePic.swift
//  CultureTrek
//
//  Created by Apprenant174 on 06/08/2026.
//

import SwiftUI

struct HeroTrekTitlePic: View {
    
    let picture : Image
    let tag : String
    
    var body: some View {
        
            picture
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 180)
                .clipped()
                .overlay(alignment: .topLeading) {
                    VStack{
                        UISectionTitleFontStyle(content: tag.uppercased(), size: Styles.tagFontSize, weight: .heavy, width: .condensed, foreground: Styles.tagForeground)
                            .frame(maxWidth: Styles.tagUIStyleWidth, maxHeight: Styles.tagUIStyleHeight)
                    }
                        .padding(.horizontal, Styles.tagHorizontalPadding)
                        .padding(.vertical, Styles.tagVerticalPadding)
                        .background(Styles.tagBackground)
                    
                }
    }
}

fileprivate struct Styles {
    
    static let tagForeground = AppColor.inverseForegroundPrimary
    static let tagBackground = AppColor.inverseBackground
    
    static let tagHorizontalPadding = AppToken.Primitive.padding3
    static let tagVerticalPadding = AppToken.Primitive.padding3 / 2
    
    static let tagFontSize = CGFloat(15)
    
    static let tagUIStyleWidth = CGFloat(168)
    static let tagUIStyleHeight = CGFloat(20)
    
}

#Preview {
    HeroTrekTitlePic(picture: AppImage.heroTestPicture, tag: "En vedette cette semaine")
}
