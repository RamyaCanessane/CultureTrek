//
//  AnswerButton.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 06/08/2026.
//

import SwiftUI

struct AnswerButton: View {
    @State var isSelected: Bool = false
    let label: String
    
    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.spaceGrotesk(size: 17, weight: .regular))
            .padding(AppToken.Primitive.padding4)
            .border(AppColor.border, width: AppToken.borderWidth)
            .background(
                RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                    .fill(isSelected ? .primitiveAccentSecondary : .primitiveAccentNeutral)
                    .shadow(color: isSelected ? .clear : AppColor.shadow,
                            radius: AppToken.Primitive.radiusNone,
                            x: isSelected ? 0 : AppToken.shadowSize,
                            y: isSelected ? 0 : AppToken.shadowSize
                           )
            )
            .onTapGesture {
                isSelected.toggle()
            }
            .animation(AppToken.buttonPressedAnimation, value: isSelected)
            .offset(x: isSelected ? AppToken.shadowSize : 0,
                    y: isSelected ? AppToken.shadowSize : 0
            )
    }
}

#Preview {
    AnswerButton(label: "O tempora, o mores! Senatus haec intellegit, consul videt; hic tamen vivit.")
        .padding(16)
}
