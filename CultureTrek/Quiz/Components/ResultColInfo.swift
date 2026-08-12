//
//  ResultColInfo.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct ResultColInfo: View {
    let label: String = "Résulat"
    let result: UInt
    let numberOfQuestion: UInt
    
    var body: some View {
        ColInfo(label: label) {
            HStack(alignment: .center,
                   spacing: Styles.hSpacing) {
                Image(systemName: AppImage.Icon.popupValid.systemName)
                    .font(Styles.iconFont)
                    .foregroundStyle(Styles.iconColor)
                
                Text(verbatim: "\(result)/\(numberOfQuestion) réussies")
                    .font(Styles.labelFont)
                    .foregroundStyle(Styles.labelColor)
            }
        }
    }
}

fileprivate enum Styles {
    
    static let hSpacing = AppToken.Primitive.spacing2
    
    static let iconFont: Font = .system(size: 15,
                                        weight: .medium)
    static let iconColor = AppColor.iconAccent
    
    static let labelFont: Font = .spaceGrotesk(size: 15,
                                               weight: .medium)
    static let labelColor = AppColor.Label.primary
}


#Preview {
    ResultColInfo(result: 6, numberOfQuestion: 10)
}
