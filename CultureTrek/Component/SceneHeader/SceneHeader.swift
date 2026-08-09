//
//  SceneHeader.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct SceneHeader: View {
    let titleText: Text
    let content: AnyView?
    
    init(title: String) {
        self.titleText = Text(title)
        self.content = nil
    }
    
    init(title: String,
         onDismiss: @escaping () -> Void) {
        self.titleText = Text(title)
        
        let button = Button(action: onDismiss) {
            AppImage.Icon.close.image
        }
            .buttonStyle(.neubrutIcon(kind: .destructive))
        
        self.content = AnyView(button)
    }
    
    init(title: String,
         trailingContent: () -> any View) {
        self.titleText = Text(title)
        self.content = AnyView(trailingContent())
    }
    
    init(title: String,
         trailingContent: AnyView) {
        self.titleText = Text(title)
        self.content = trailingContent
    }
    
    var body: some View {
        HStack(alignment: .center,
               spacing: .zero) {
            titleText
                .font(Styles.titleFont)
                .foregroundStyle(Styles.titleColor)
                .textCase(Styles.titleTextCase)
            
            Spacer(minLength: Styles.spacing)
            
            if let content {
                content
            }
        }
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing3
    
    static let titleFont: Font = .system(size: 40,
                                         weight: .heavy)
        .width(.condensed)
    static let titleTextCase: Text.Case = .uppercase
    static let titleColor = AppColor.Label.primary
}

#Preview {
    VStack(spacing: 48) {
        SceneHeader(title: "Amet Vel")
        
        SceneHeader(title: "Asperiores Veritatis",
                    onDismiss: {})
        
        SceneHeader(title: "Cumque") {
            Circle()
                .fill(.cyan)
                .frame(width: 48, height: 48)
        }
        
        SceneHeader(title: "Consectetur Expedita Aut Rem",
                    onDismiss: {})
    }
}
