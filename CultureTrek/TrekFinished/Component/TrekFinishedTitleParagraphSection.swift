//
//  TrekFinishedTitleParagraphSection.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 05/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekFinishedTitleParagraphSection: View {
    let title: String
    let paragraph: String
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            TrekFinishedSectionTitle(title)
            
            Text(paragraph)
                .font(Styles.paragraphFont)
                .foregroundStyle(Styles.paragraphColor)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing1
    
    static let paragraphFont: Font = .spaceGrotesk(size: 17,
                                                   weight: .regular)
    static let paragraphColor = AppColor.Label.primary
}

#Preview {
    TrekFinishedTitleParagraphSection(title: "Sit eos",
                                      paragraph: "Provident voluptates quod beatae qui ut dolore similique voluptatem sit dolores ex consequatur dolorem ullam ex.")
        .padding()
}
