//
//  SceneFooterViewModifier.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct SceneFooterViewModifier: ViewModifier {
    private let contentView: AnyView
    
    init(content: () -> any View) {
        self.contentView = AnyView(content())
    }
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom,
                           spacing: .zero) {
                contentView
                    .padding(.horizontal)
                    .padding(.top, Styles.blurTopPadding)
                    .background {
                        LinearGradient(colors: [
                            Styles.background.opacity(0.64),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1),
                            Styles.background.opacity(1)
                        ],
                                       startPoint: .top,
                                       endPoint: .bottom)
                        .padding(.top, -Styles.blurTopPadding)
                        .padding([.horizontal, .bottom], Styles.blurHPadding)
                        .blur(radius: Styles.blur)
                    }
                    .padding(.top, -Styles.blurTopPadding * 1)
                    .background {
                        Styles.background
                            .padding(.top, Styles.blurTopPadding * 2)
                            .ignoresSafeArea(.all, edges: .bottom)
                    }
            }
    }
}

extension View {
    
    func sceneFooter(_ content: () -> any View) -> some View {
        modifier(SceneFooterViewModifier(content: content))
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.Page.background
    
    static let blurTopPadding: Double = 8
    static let blurHPadding: Double = -16
    static let blur: Double = 10
}

#Preview {
    ScrollView {
        VStack(spacing: 16) {
            ForEach(0..<40, id: \.self) { index in
                Text("Item \(index + 1)")
            }
        }
    }
    .sceneFooter {
        VStack {
            Button("Repudiandae Asperiores") {}
                .buttonStyle(.neubrutProminent(kind: .primary,
                                               icon: nil,
                                               isFullWidth: true))
            
            Button("Accusamus Unde") {}
                .buttonStyle(.neubrutProminent(kind: .neutral,
                                               icon: nil,
                                               isFullWidth: true))
        }
    }
}
