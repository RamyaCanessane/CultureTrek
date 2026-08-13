//
//  TrekDetailActionBar.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct TrekDetailActionBar: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let trek : Trek
    
    var body: some View {
        
        HStack{
            
            Button(action: { dismiss() }) {
                AppImage.Icon.riddleBack.image
            }
            .buttonStyle(.neubrutIcon(kind: .neutral))
            
            Spacer()
            
            Button(
                action: { trek.isLiked.toggle()
                    print("\(trek.name) en favoris : \(trek.isLiked)")
                }) {
                    
                    if trek.isLiked {
                        
                        AppImage.Icon.trekLiked.image
                            .foregroundStyle(Styles.likedButton)
                        
                    } else {
                        AppImage.Icon.trekUnliked.image
                            .foregroundStyle(Styles.unlikedButton)
                    }
                }
                .buttonStyle(.neubrutIcon(kind: trek.isLiked ? .liked : .neutral))
            
        }
        .padding(.horizontal, Styles.barPadding)
        
    }
}

fileprivate struct Styles {
    
    static let likedButton =  AppColor.accentNeutral
    static let unlikedButton =  AppColor.Label.primary
    
    static let barPadding = AppToken.Primitive.padding4
    
}

#Preview {
    
    TrekDetailActionBar(trek: Trek.example)
    
}
