//
//  QuizResultColInfo.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 12/08/2026.
//

import SwiftUI

struct QuizResultColInfo: View {
    let result: UInt
    let numberOfQuestion: UInt
    
    private let label: String = "Résultat"
    
    var body: some View {
        ColInfo(label: label) {
            HStack(alignment: .center,
                   spacing: Styles.hSpacing) {
                Image(systemName: AppImage.Icon.popupValid.systemName)
                    .font(Styles.iconFont)
                    .foregroundStyle(Styles.iconColor)
                
                Text("\(result)/\(numberOfQuestion) réussies")
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
    QuizResultColInfo(result: 6, numberOfQuestion: 10)
}
