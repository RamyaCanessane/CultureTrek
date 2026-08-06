//
//  NeubrutTabPicker.swift
//  CultureTrek
//
//  Created by Apprenant162 on 06/08/2026.
//

import SwiftUI

struct NeubrutTabPicker: View {
    let nameTabTwo: String
//    let nameTabOne: String
    
    var body: some View {
        HStack(spacing: TabPickerStyles.spacing){
            Text(nameTabTwo)
                .font(TabPickerStyles.nameFont)
                .foregroundStyle(TabPickerStyles.textColor)
        }
        .padding(.horizontal, TabPickerStyles.paddingInter)
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: TabPickerStyles.heightExtern)
        .clipShape(TabPickerStyles.shape)
        .background {
            TabPickerStyles.shape
                .fill(TabPickerStyles.backgroundNoSelected)
        }
        .overlay {
            TabPickerStyles.shape
                .strokeBorder(TabPickerStyles.borderColor,
                              lineWidth: TabPickerStyles.borderWidth)
        }
        .background{
                TabPickerStyles.shape
                    .fill(TabPickerStyles.shadowColor)
                    .frame(height: TabPickerStyles.heightExtern)
                    .padding(.leading,
                             TabPickerStyles.shadowSize)
                    .padding(.top, TabPickerStyles.shadowSize * 2)
                    .padding(.trailing, -TabPickerStyles.shadowSize)
                    .padding(.bottom, 0)
        }
    }
}

struct TabPickerStyles {
    static let backgroundIsSelected = AppColor.accentSecondary
    static let backgroundNoSelected = AppColor.accentNeutral
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    static let cornerRadius = AppToken.cornerRadius
    static let heightInter: Double = 40
    static let heightExtern: Double = 48
    static let nameFont: Font = .system(size: 17,
                                        weight: .heavy)
        .width(.condensed)
    static let shadowColor = AppColor.shadow
    static let shadowSize = AppToken.shadowSize
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    static let spacing = AppToken.Primitive.spacing2
    static let paddingInter = AppToken.Primitive.padding5
    static let textColor = AppColor.Label.primary
}

struct TabSelected: View {
    let nameTabSelected: String
    
    var body: some View {
        HStack(spacing: TabPickerStyles.spacing){
            Text(nameTabSelected)
                .font(TabPickerStyles.nameFont)
                .foregroundStyle(TabPickerStyles.textColor)
        }
        .padding(.horizontal, TabPickerStyles.paddingInter)
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: TabPickerStyles.heightInter)
        .background(TabPickerStyles.backgroundIsSelected)
        .clipShape(TabPickerStyles.shape)
        .overlay {
            TabPickerStyles.shape
                .strokeBorder(TabPickerStyles.borderColor,
                              lineWidth: TabPickerStyles.borderWidth)
        }
    }
}

#Preview {
    VStack{
        NeubrutTabPicker(nameTabTwo: "Carte")
    }
    .padding()
    .background(AppColor.background)
    
    VStack{
        TabSelected(nameTabSelected: "Liste")
    }
    .padding()
    .background(AppColor.background)
}
