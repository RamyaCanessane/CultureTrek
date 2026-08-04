//
//  RiddleSceneHeader.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleSceneHeader: View {
    let title: String
    
    var body: some View {
        HStack(alignment: .center,
               spacing: .zero) {
            Text(title)
                .font(Styles.titleFont)
                .foregroundStyle(Styles.titleColor)
            
            Spacer(minLength: Styles.spacing)
            
            Button {
                
            } label: {
                AppImage.Icon.riddleMap.image
            }
            .buttonStyle(.neubrutIcon(kind: .info))
        }
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing4
    
    static let titleFont: Font = .system(size: 24,
                                         weight: .heavy)
        .width(.condensed)
    static let titleColor = AppColor.Label.primary
}

#Preview {
    VStack(spacing: 24) {
        RiddleSceneHeader(title: "In Soluta Esse")
        
        RiddleSceneHeader(title: "Nulla libero voluptas repellat voluptatem qui quas est")
    }
    .padding()
    .background(AppColor.background)
}
