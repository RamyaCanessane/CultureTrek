//
//  TitledCard.swift
//  CultureTrek
//
//  Created by Mathieu Nivelles on 02/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//

import SwiftUI

struct TitledCard: View {
    let title: String
    let content: String
    let kind: Kind
    let contentAbove: AnyView?
    let contentBelow: AnyView?
    
    init(title: String,
         content: String,
         kind: Kind) {
        self.title = title
        self.content = content
        self.kind = kind
        self.contentAbove = nil
        self.contentBelow = nil
    }
    
    init(title: String,
         content: String,
         kind: Kind,
         contentAbove: () -> any View,
         contentBelow: () -> any View) {
        self.title = title
        self.content = content
        self.kind = kind
        self.contentAbove = AnyView(contentAbove())
        self.contentBelow = AnyView(contentBelow())
    }
    
    init(title: String,
         content: String,
         kind: Kind,
         contentAbove: () -> any View) {
        self.title = title
        self.content = content
        self.kind = kind
        self.contentAbove = AnyView(contentAbove())
        self.contentBelow = nil
    }
    
    init(title: String,
         content: String,
         kind: Kind,
         contentBelow: () -> any View) {
        self.title = title
        self.content = content
        self.kind = kind
        self.contentAbove = nil
        self.contentBelow = AnyView(contentBelow())
    }
    
    enum Kind {
        case primary
        case secondary
        case neutral
        case info
        case success
        case warning
        case error
    }
    
    var body: some View {
        VStack(spacing: Styles.spacing) {
            if let contentAbove {
                contentAbove
            }
            
            Text(content)
                .font(Styles.contentFont)
                .multilineTextAlignment(.leading)
                .foregroundStyle(Styles.contentColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if let contentBelow {
                contentBelow
            }
        }
        .padding([.horizontal, .bottom], Styles.padding)
        .padding(.top, Styles.topPadding)
        .background(Styles.background)
        .clipShape(Styles.shape)
        .overlay {
            Styles.shape
                .strokeBorder(Styles.border,
                              lineWidth: Styles.borderWidth)
        }
        .overlay(alignment: .topLeading) {
            Title(title: title,
                  kind: kind)
            .offset(x: Styles.titleHPadding,
                    y: -Styles.titleHeight / 2)
        }
        .padding(.top, Styles.titleHPadding)
    }
}

extension TitledCard {
    
    struct Title: View {
        let title: String
        let kind: Kind
        
        var body: some View {
            Text(title)
                .font(Styles.titleFont)
                .foregroundStyle(Styles.titleColor)
                .textCase(.uppercase)
                .padding(.horizontal, Styles.titleHPadding)
                .frame(height: Styles.titleHeight)
                .background(background)
                .clipShape(Styles.titleShape)
                .overlay {
                    Styles.titleShape
                        .strokeBorder(Styles.titleBorder,
                                      lineWidth: Styles.titleBorderWidth)
                }
        }
        
        private var background: Color {
            switch kind {
            case .primary:
                return Styles.primary
            case .secondary:
                return Styles.secondary
            case .neutral:
                return Styles.neutral
            case .info:
                return Styles.info
            case .success:
                return Styles.success
            case .warning:
                return Styles.warning
            case .error:
                return Styles.error
            }
        }
    }
}

fileprivate enum Styles {
    
    static let spacing = AppToken.Primitive.spacing5
    
    static let background = AppColor.accentNeutral
    
    static let padding = AppToken.Primitive.padding5
    static let topPadding = AppToken.Primitive.padding8
    
    static let border = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    
    static let contentFont: Font = .spaceGrotesk(size: 17,
                                                 weight: .regular)
    static let contentColor = AppColor.Label.primary
    
    static let titleFont: Font = .system(size: 20,
                                         weight: .heavy)
        .width(.condensed)
    static let titleColor = AppColor.Label.primary
    static let titleHPadding = AppToken.Primitive.padding4
    static let titleHeight: Double = 40
    static let titleCornerRadius = AppToken.cornerRadius
    static let titleShape = RoundedRectangle(cornerRadius: titleCornerRadius)
    static let titleBorder = AppColor.border
    static let titleBorderWidth = AppToken.borderWidth
    
    static let primary = AppColor.accentPrimary
    static let secondary = AppColor.accentSecondary
    static let neutral = AppColor.accentNeutral
    static let info = AppColor.info
    static let success = AppColor.success
    static let warning = AppColor.warning
    static let error = AppColor.error
}

#Preview {
    VStack(spacing: 24) {
        TitledCard(title: "Laboriosam Sunt",
                   content: "Molestias voluptas incidunt distinctio sit eius sint sed aliquam ad quod incidunt. Voluptas magni sint ducimus nobis ut. Et est distinctio officia consequatur inventore aut quisquam est distinctio sint ea.",
                   kind: .info)
        
        TitledCard(title: "Dolores",
                   content: "Vero eos voluptatem optio optio porro sit deleniti debitis reprehenderit.",
                   kind: .success)
        
        TitledCard(title: "Illum Rerum",
                   content: "Facere aut voluptas error incidunt ipsum atque dignissimos voluptatem. Id omnis quaerat labore in quis sed nostrum culpa non voluptatibus.",
                   kind: .error,
                   contentAbove: {
            Toggle("Test", isOn: .constant(true))
        },
                   contentBelow: {
            Button("Et Nulla") {}
                .buttonStyle(.neubrutProminent(kind: .destructive,
                                               icon: Image(systemName: "xmark.circle"),
                                               isFullWidth: true))
        })
    }
    .padding()
    .background(AppColor.background)
}
