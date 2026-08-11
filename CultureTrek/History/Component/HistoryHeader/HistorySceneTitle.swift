//
//  HistorySceneTitle.swift
//  CultureTrek
//
//  Created by Apprenant162 on 10/08/2026.
//

import SwiftUI

struct HistorySceneTitle: View {
    let sceneTitle: Text
    
    var body: some View {
        HStack(
            alignment: .center,
            spacing: .zero
        ) {
            sceneTitle
                .font(
                    HistoryTitleStyles.titleFont
                )
                .foregroundStyle(
                    HistoryTitleStyles.titleColor
                )
                .textCase(
                    HistoryTitleStyles.titleTextCase
                )
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )
        }
    }
}

struct HistoryTitleStyles {
    
    static let titleFont: Font = .system(
        size: 40,
        weight: .heavy
    )
        .width(
            .condensed
        )
    static let titleColor = AppColor.Label.primary
    static let titleTextCase: Text.Case = .uppercase
}

#Preview {
    VStack{
        HistorySceneTitle(
            sceneTitle: Text(
                "historique"
            )
        )
    }
    .background(
        AppColor.Page.background
    )
    .padding()
}
