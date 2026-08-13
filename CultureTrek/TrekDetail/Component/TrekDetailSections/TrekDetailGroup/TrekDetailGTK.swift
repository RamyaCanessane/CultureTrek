//
//  TrekDetailGTK.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import SwiftUI

struct TrekDetailGTK: View {
    
    let title : String = "Bon à savoir"
    let goodToKnow : [String]
    
    var body: some View {
        
        SceneDetailGroup(title: title) {
            
            ForEach(goodToKnow, id: \.self){ tips in
                
                Text(" • " + tips)
                    .font(.spaceGrotesk(size: Styles.detailArticleFontSize, weight: .regular))
                    .multilineTextAlignment(.leading)
            }
            
        }
        
    }
}

fileprivate struct Styles {
    
    static let detailArticleFontSize = CGFloat(17)
    
}

#Preview {
    TrekDetailGTK(goodToKnow: Trek.example.goodToKnow)
}
