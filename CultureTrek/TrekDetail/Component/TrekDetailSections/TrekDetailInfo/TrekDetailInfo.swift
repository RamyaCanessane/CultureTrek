//
//  TrekDetailRecap.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailInfo: View {
    
    let trek : Trek
    
    @State private var vm = TrekDetailInfoViewModel()
    
    var body: some View {
        
        HStack(spacing: Styles.infoSpacing){
            
            TrekDetailSingleInfo(
                trek: trek,
                kind: vm.distanceSection.rawValue,
                icon: vm.distanceSection.icon
            )
//            TrekDetailSingleInfo(trek: trek, kind: vm)
            
            TrekDetailSingleInfo(
                trek: trek,
                kind: vm.durationSection.rawValue,
                icon: vm.durationSection.icon
            )
            
            TrekDetailSingleInfo(
                trek: trek,
                kind: vm.elevationSection.rawValue,
                icon: vm.elevationSection.icon
            )
            
            TrekDetailSingleInfo(
                trek: trek,
                kind: vm.riddlesSection.rawValue,
                icon: vm.riddlesSection.icon
            )
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

fileprivate struct Styles {
    
    static let infoSpacing = AppToken.Primitive.padding6
    
}

#Preview {
    TrekDetailInfo(trek: Trek.example)
}


//#Preview {
//    TrekDetailInfo(trek: Trek.example)
//}
