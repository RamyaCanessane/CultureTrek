//
//  TrekSettingsLabelContent.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekSettingsLabelContent: View {
    private let label: String
    private let contentText: Text?
    private let content: AnyView?
    private let summaryText: Text?
    
    init(label: String,
         summary: String? = nil,
         content: String) {
        self.label = label
        
        if let summary {
            self.summaryText = Text(summary)
        } else {
            self.summaryText = nil
        }
        
        self.contentText = Text(content)
        self.content = nil
    }
    
    init(label: String,
         summary: String? = nil,
         content: () -> any View) {
        self.label = label
        
        if let summary {
            self.summaryText = Text(summary)
        } else {
            self.summaryText = nil
        }
        
        self.contentText = nil
        self.content = AnyView(content())
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            HStack(alignment: .center,
                   spacing: .zero) {
                Text(label)
                    .font(Styles.labelFont)
                    .foregroundStyle(Styles.labelColor)
                
                Spacer(minLength: Styles.hSpacing)
                
                if let contentText {
                    contentText
                        .font(Styles.contentTextFont)
                        .foregroundStyle(Styles.contentTextColor)
                } else if let content {
                    content
                }
            }
            
            if let summaryText {
                summaryText
                    .font(Styles.summaryFont)
                    .foregroundStyle(Styles.summaryColor)
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
            }
        }
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing4
    static let vSpacing = AppToken.Primitive.spacing2
    
    static let labelFont: Font = .system(size: 20,
                                         weight: .heavy)
        .width(.condensed)
    static let labelColor = AppColor.Label.primary
    
    static let summaryFont: Font = .spaceGrotesk(size: 15,
                                                 weight: .regular)
    static let summaryColor = AppColor.Label.primary
    
    static let contentTextFont: Font = .spaceGrotesk(size: 17,
                                                     weight: .medium)
    static let contentTextColor = AppColor.Label.primary
}

#Preview {
    VStack(spacing: 24) {
        TrekSettingsLabelContent(label: "Quis Perspiciatis",
                                 content: "Inventore Qui")
        
        TrekSettingsLabelContent(label: "Quis Perspiciatis",
                                 summary: "Et rerum omnis nesciunt aut perspiciatis ut ducimus quod aut.",
                                 content: "Inventore Qui")
        
        TrekSettingsLabelContent(label: "Aliquam Sunt") {
            TrekSettingsDropdownView(label: "Molestias")
        }
        
        TrekSettingsLabelContent(label: "Aliquam Sunt",
                                 summary: "Ut delectus possimus rerum alias rerum beatae optio ut blanditiis. Et eum at earum iusto voluptatibus molestias.") {
            TrekSettingsDropdownView(label: "Molestias")
        }
    }
    .padding()
    .background(AppColor.background)
}
