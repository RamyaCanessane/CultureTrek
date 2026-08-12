//
//  SinglePhotoCompletedDetail.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct SinglePhotoCompletedDetail: View {
    
    let photo : UIImage?
    let order : UInt?
    
    var body: some View {
        
        if let hasPhoto = photo {
            
            Image(uiImage: hasPhoto)
                .resizable()
                .scaledToFill()
                .frame(width: Styles.photoSize, height: Styles.photoSize)
                .overlay(alignment: .topLeading){
                    
                    Text("#\(order!)")
                        .font(.spaceGrotesk(size: Styles.photoLabelFontSize, weight: .medium))
                        .foregroundStyle(Styles.photoLabelForeground)
                        .frame(width: Styles.photoOrderSize, height: Styles.photoOrderSize)
                        .background(Styles.photoBorderColor)
                    
                }
                .border(Styles.photoBorderColor, width: Styles.photoBorderWidth)
                .mask {
                    RoundedRectangle(cornerRadius: Styles.photoCornerRadius)
                }
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let photoBorderColor = AppColor.border
    static let photoLabelForeground = AppColor.inverseForegroundPrimary
    
    static let photoCornerRadius = AppToken.cornerRadius
    static let photoBorderWidth = AppToken.borderWidth
    
    static let photoLabelFontSize = CGFloat(15)
    
    static let photoSize = CGFloat(100)
    static let photoOrderSize = CGFloat(32)
    
}

#Preview {
    SinglePhotoCompletedDetail(photo: Trek.liveDemoExamples.first?.completion?.photos.first!.image, order: Trek.liveDemoExamples.first?.completion?.photos.first!.riddleOrder)
}
