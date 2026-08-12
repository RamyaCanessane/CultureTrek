//
//  CompletedTrekDetailPhotos.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailPhotos: View {
    
    let trek : Trek
    
    let title : String = "Photos"
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            HStack(alignment: .top, spacing: Styles.photoSpacing) {
                
                if let hasPhoto = trek.completion?.photos {
                    
                    ForEach(hasPhoto, id: \.self){ photo in
                        
                        SinglePhotoCompletedDetail(photo: photo.image, order: photo.riddleOrder)
                        
                    }
                    
                } else {
                    
                    Text("Pas de photo")
                        .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .regular))
                        .foregroundStyle(Styles.detailForeground)
                    
                }
                
            }
            .padding(.top, Styles.photoPaddingTop)
            
        }
        
        
    }
}

fileprivate struct Styles {
    
    static let detailForeground = AppColor.Label.primary
    
    static let photoSpacing = AppToken.Primitive.padding4
    static let photoPaddingTop = AppToken.Primitive.padding1
    
    static let detailFontSize = CGFloat(17)
    
}

#Preview {
    CompletedTrekDetailPhotos(trek: Trek.liveDemoExamples.first!)
}
