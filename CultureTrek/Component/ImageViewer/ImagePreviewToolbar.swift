//
//  ImagePreviewToolbar.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 07/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

// source https://github.com/Silenterc/ImageViewer/tree/main

import SwiftUI

struct ImagePreviewToolbar: View {
    let onDismiss: () -> Void
    let downloadAction: (() -> Void)?
    let shareAction: (() -> Void)?
    
    var body: some View {
        HStack {
            if let downloadAction {
                Button(action: downloadAction) {
                    Image(systemName: "arrow.down")
                }
                .buttonStyle(.neubrutIcon(kind: .neutral))
            }
            
            if let shareAction {
                Button(action: shareAction) {
                    Image(systemName: "square.and.arrow.up")
                }
                .buttonStyle(.neubrutIcon(kind: .neutral))
            }
            
            Spacer()
            
            Button(action: onDismiss) {
                Image(systemName: "xmark")
            }
            .buttonStyle(.neubrutIcon(kind: .destructive))
        }
    }
}
