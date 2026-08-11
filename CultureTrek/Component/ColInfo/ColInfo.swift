//
//  ColInfo.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct ColInfo: View {
    let label: String
    let content: AnyView
    
    init(label: String, content: () -> any View) {
        self.label = label
        self.content = AnyView(content())
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            ColInfoLabel(label)
            
            content
        }
    }
}

fileprivate struct ColInfoLabel: View {
    let label: String
    
    init(_ label: String) {
        self.label = label
    }
    
    var body: some View {
        Text(label)
            .font(Styles.labelFont)
            .foregroundStyle(Styles.labelColor)
            .textCase(Styles.labelTextCase)
            .frame(maxWidth: .infinity,
                   alignment: .leading)
    }
}

fileprivate enum Styles {
    
    static let vSpacing: Double = AppToken.Primitive.spacing1
    
    static let labelFont: Font = .system(size: 14,
                                         weight: .heavy)
        .width(.condensed)
    static let labelColor = AppColor.Label.primary
    static let labelTextCase: Text.Case = .uppercase
}

#Preview {
    ColInfo(label: "Fugiat") {
        Text("Quisquam")
    }
}
