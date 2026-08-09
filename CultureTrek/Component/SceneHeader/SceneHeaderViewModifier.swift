//
//  SceneHeaderViewModifier.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct SceneHeaderViewModifier: ViewModifier {
    private let title: String
    private let onDismiss: (() -> Void)?
    private let trailingContent: AnyView?
    
    init(title: String) {
        self.title = title
        self.onDismiss = nil
        self.trailingContent = nil
    }
    
    init(title: String,
         onDismiss: @escaping () -> Void) {
        self.title = title
        self.onDismiss = onDismiss
        self.trailingContent = nil
    }
    
    init(title: String,
         trailingContent: () -> any View) {
        self.title = title
        self.onDismiss = nil
        self.trailingContent = AnyView(trailingContent())
    }
    
    func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .top,
                           spacing: .zero) {
                VStack(spacing: .zero) {
                    Rectangle()
                        .fill(.clear)
                        .frame(height: 1)
                        .frame(maxWidth: .infinity)
                        .background {
                            Rectangle()
                                .fill(Styles.background)
                                .ignoresSafeArea(.all,
                                                 edges: .top)
                        }
                    
                    Group {
                        if let onDismiss {
                            SceneHeader(title: title, onDismiss: onDismiss)
                        } else if let trailingContent {
                            SceneHeader(title: title,
                                        trailingContent: trailingContent)
                        } else {
                            SceneHeader(title: title)
                        }
                    }
                        .padding(.horizontal)
                        .padding(.bottom, Styles.bottomPading)
                        .background {
                            Rectangle()
                                .fill(
                                    LinearGradient(colors: [
                                        Styles.background.opacity(0.64),
                                        Styles.background.opacity(1),
                                        Styles.background.opacity(1)
                                    ],
                                                   startPoint: .bottom,
                                                   endPoint: .top)
                                )
                                .padding(-20)
                                .blur(radius: 10)
                                .padding(20)
                                .padding(.top, -20)
                        }
                }
            }
    }
}

extension View {
    
    func sceneHeader(_ title: String) -> some View {
        modifier(SceneHeaderViewModifier(title: title))
    }
    
    func sceneHeader(_ title: String,
                     onDismiss: @escaping () -> Void) -> some View {
        modifier(SceneHeaderViewModifier(title: title,
                                         onDismiss: onDismiss))
    }
    
    func sceneHeader(_ title: String,
                     trailingContent: () -> any View) -> some View {
        modifier(SceneHeaderViewModifier(title: title,
                                         trailingContent: trailingContent))
    }
}

fileprivate enum Styles {
    
    static let background = AppColor.background
    
    static let bottomPading = AppToken.Primitive.spacing6
}

#Preview("Title Only") {
    ScrollView {
        VStack(spacing: 16) {
            ForEach(0..<40, id: \.self) { index in
                Text("Item \(index + 1)")
            }
        }
    }
    .sceneHeader("Quibusdam Ut")
}

#Preview("Title + Dismiss") {
    ScrollView {
        VStack(spacing: 16) {
            ForEach(0..<40, id: \.self) { index in
                Text("Item \(index + 1)")
            }
        }
    }
    .sceneHeader("Quibusdam Ut",
                 onDismiss: {})
}

#Preview("Title + TrailingContent") {
    ScrollView {
        VStack(spacing: 16) {
            ForEach(0..<40, id: \.self) { index in
                Text("Item \(index + 1)")
            }
        }
    }
    .sceneHeader("Harum Est") {
        Circle()
            .fill(.cyan)
            .frame(width: 48, height: 48)
    }
}
