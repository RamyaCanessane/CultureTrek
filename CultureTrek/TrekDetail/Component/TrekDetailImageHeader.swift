//
//  TrekDetailImageHeader.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct TrekDetailImageHeader: View {
    
    let trek : Trek
    
    var body: some View {
        
        trek.picture
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1/1, contentMode: .fit)
        
    }
}

#Preview {
    TrekDetailImageHeader(trek: Trek.example)
}
