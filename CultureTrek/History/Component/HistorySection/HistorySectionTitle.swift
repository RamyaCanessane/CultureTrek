//
//  HistorySectionTitle.swift
//  CultureTrek
//
//  Created by Apprenant162 on 10/08/2026.
//

import SwiftUI

struct HistorySectionTitle: View {
    let title : Text
    
    var body: some View {
        HStack(alignment: .center,
               spacing: .zero) {
            title
                .font(HistorySectionTitleStyles.titleFont)
                .foregroundStyle(HistorySectionTitleStyles.titleColor)
                .textCase(HistorySectionTitleStyles.titleTextCase)
                .frame(maxWidth: .infinity,
                       alignment: .leading)
        }
    }
}

fileprivate enum HistorySectionTitleStyles {
    
    static let titleFont: Font = .system(size: 24,
                                         weight: .heavy)
        .width(.condensed)
    static let titleColor = AppColor.Label.primary
    static let titleTextCase: Text.Case = .uppercase
}

#Preview {
    VStack{
        HistorySectionTitle(title: Text("GEseqrfg"))
    }
    .padding()
    .background(AppColor.Page.background)
}
