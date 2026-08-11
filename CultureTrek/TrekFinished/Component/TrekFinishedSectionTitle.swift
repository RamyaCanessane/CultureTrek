//
//  TrekFinishedSectionTitle.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 03/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedSectionTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(Styles.titleFont)
            .foregroundStyle(Styles.titleColor)
            .textCase(Styles.titleTextCase)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
    }
}

fileprivate enum Styles {
    
    static let titleFont: Font = .system(size: 20,
                                         weight: .heavy)
        .width(.condensed)
    static let titleColor = AppColor.Label.primary
    static let titleTextCase: Text.Case = .uppercase
}

#Preview {
    TrekFinishedSectionTitle("Voluptate Suscipit Dignissimos")
        .padding()
        .background(AppColor.Page.background)
}
