//
//  CompletedTrekDetailInfo.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailInfo: View {
    
    let trek : Trek
    
    @State private var vm = CompletedTrekDetailInfoViewModel()
    
    var body: some View {
        
        HStack(spacing: Styles.detailSpacing){
            
            CompletedTrekDetailCompletionData(
                trek: trek,
                kind: vm.durationSection.rawValue,
                icon: vm.durationSection.icon
            )
            
            CompletedTrekDetailCompletionData(
                trek: trek,
                kind: vm.pointsSection.rawValue,
                icon: vm.pointsSection.icon
            )
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

fileprivate struct Styles {
    
    static let detailSpacing = AppToken.Primitive.padding6
    
}

#Preview {
    CompletedTrekDetailInfo(trek: Trek.example)
}
