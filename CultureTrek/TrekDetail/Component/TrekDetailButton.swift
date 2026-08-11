//
//  TrekDetailButton.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailButton: View {
    var body: some View {
        
        Button("Commencer") {
            
        }
        .buttonStyle(NeubrutProminentButtonStyle(kind: .primary, icon: nil, isFullWidth: true))
        .padding(Styles.buttonPadding)
    }
}

fileprivate struct Styles {
    
    static let buttonPadding = AppToken.Primitive.padding4
    
}

#Preview {
    TrekDetailButton()
}
