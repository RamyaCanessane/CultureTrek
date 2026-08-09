//
//  TrekListBackButton.swift
//  CultureTrek
//
//  Created by Apprenant174 on 09/08/2026.
//

import SwiftUI

struct TrekListBackButton: View {
    
    @Environment(\.dismiss) private var dismiss
        
    var body: some View {
        Button(action: {dismiss()}) {
            Image(systemName: "chevron.left")
        }
        .buttonStyle(.neubrutIcon(kind: .neutral))
    }
}

#Preview {
    TrekListBackButton()
}
