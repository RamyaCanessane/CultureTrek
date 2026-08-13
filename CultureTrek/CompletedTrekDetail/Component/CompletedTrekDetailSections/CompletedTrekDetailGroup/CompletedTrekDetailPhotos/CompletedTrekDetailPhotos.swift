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
    
    @State private var selectedImage : ImagePreviewData?
    
    fileprivate struct ImagePreviewData : Identifiable {
        let id = UUID()
        
        let images : [UIImage]
        
        let index : Int
        
    }
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            HStack(alignment: .top, spacing: Styles.photoSpacing) {
                
                if let hasPhoto = trek.completion?.photos {
                    
                    ForEach(hasPhoto.enumerated(), id: \.offset){ item in
                        
                        SinglePhotoCompletedDetail(
                            photo: item.element.image,
                            order: item.element.riddleOrder
                        )
                            .onTapGesture {
                                selectedImage = .init(images: hasPhoto.map{ $0.image}, index: item.offset)
                            }
                        
                    }
                    
                } else {
                    
                    Text("Pas de photo")
                        .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .regular))
                        .foregroundStyle(Styles.detailForeground)
                    
                }
                
            }
            .padding(.top, Styles.photoPaddingTop)
            
        }
        .fullScreenCover(item: $selectedImage) { data in
            ImageViewer(images: data.images,
                        initialImageIndex: data.index)
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
