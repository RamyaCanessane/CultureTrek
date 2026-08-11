//
//  TrekDetailRecap.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailInfo: View {
    
    let trek : Trek
    
    @State private var vm: TrekDetailInfoViewModel
    
    var body: some View {
        
        HStack(spacing: Styles.infoSpacing){
            
//            TrekDetailSingleInfo(trek: trek, kind: vm)
            
            TrekDetailSingleInfo(trek: trek, kind: TrekDetailInfoContent.duration)
            
            TrekDetailSingleInfo(trek: trek, kind: TrekDetailInfoContent.elevation)
            
            TrekDetailSingleInfo(trek: trek, kind: TrekDetailInfoContent.riddles)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

enum TrekDetailInfoContent : String {
    case distance = "Distance"
    case duration = "Durée"
    case elevation = "Dénivelé"
    case riddles = "Énigmes"
}

fileprivate struct Styles {
    
    static let infoSpacing = AppToken.Primitive.padding6
    
}



//#Preview {
//    TrekDetailInfo(trek: Trek.example)
//}
