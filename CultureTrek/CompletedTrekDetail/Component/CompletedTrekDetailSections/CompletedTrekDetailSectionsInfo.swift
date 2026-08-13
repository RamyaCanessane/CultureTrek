//
//  CompletedTrekDetailSectionsInfo.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailSectionsInfo: View {
    
    let trek : Trek
    
    var body: some View {
        
        TrekDetailSections(trek: trek)
        
    }
}

#Preview {
    CompletedTrekDetailSectionsInfo(trek: Trek.example)
}
