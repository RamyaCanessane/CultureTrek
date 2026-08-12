//
//  SceneHeader.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct SceneHeader: View {
    private let titleText: Text
    private let content: AnyView?
    private let backButton: AnyView?
    
    init(title: String) {
        self.titleText = Text(title)
        self.content = nil
        self.backButton = nil
    }
    
    init(title: String,
         onDismiss: @escaping () -> Void) {
        self.titleText = Text(title)
        
        let button = Button(action: onDismiss) {
            AppImage.Icon.close.image
        }
            .buttonStyle(.neubrutIcon(kind: .destructive))
        
        self.content = AnyView(button)
        self.backButton = nil
    }
    
    init(title: String,
         trailingContent: () -> any View) {
        self.titleText = Text(title)
        self.content = AnyView(trailingContent())
        self.backButton = nil
    }
    
    init(title: String,
         trailingContent: AnyView) {
        self.titleText = Text(title)
        self.content = trailingContent
        self.backButton = nil
    }
    
    init(title: String,
         onPressBack: @escaping () -> Void) {
        self.titleText = Text(title)
        self.content = nil
        self.backButton = AnyView(Button(action: onPressBack) {
            AppImage.Icon.sceneBack.image
        }
        .buttonStyle(.neubrutIcon(kind: .neutral)))
    }
    
    var body: some View {
        HStack(alignment: .center,
               spacing: .zero) {
            if let backButton {
                backButton
                    .padding(.trailing, Styles.titleBackButtonSpacing)
            }
            
            titleText
                .font(Styles.titleFont)
                .foregroundStyle(Styles.titleColor)
                .textCase(Styles.titleTextCase)
            
            if let content {
                Spacer(minLength: Styles.spacing)
                
                content
            }
        }
               .frame(maxWidth: .infinity, alignment: .leading)
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing3
    
    static let titleFont: Font = .system(size: 32,
                                         weight: .heavy)
        .width(.condensed)
    static let titleTextCase: Text.Case = .uppercase
    static let titleColor = AppColor.Label.primary
    
    static let titleBackButtonSpacing = AppToken.Primitive.spacing4
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
        
        SceneHeader(title: "Ut Libero",
                    onPressBack: {})
    }
}
