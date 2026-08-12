//
//  NeubrutTabPicker.swift
//  CultureTrek
//
//  Created by Apprenant162 on 06/08/2026.
//

import SwiftUI

struct NeubrutTabPicker: View {
    let nameFirstTab: String
    let nameSecondTab: String
    
    //    @State var state: TabState = .first
    @Binding var state: TabState
    
    var body: some View {
        HStack(spacing: TabPickerStyles.spacingZero){
            TabSelection(nameTab: nameFirstTab, isOn: state == .first)
                .onTapGesture {
                    state = .first
                }
            
            TabSelection(nameTab: nameSecondTab, isOn: state == .second)
                .onTapGesture {
                    state = .second
                }
        }
        .padding(.horizontal, TabPickerStyles.paddingExtern)
        .frame(maxWidth: .infinity)
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

enum TabState{
    case first
    case second
}

struct TabSelection: View {
    let nameTab: String
    let isOn: Bool
    
    var body: some View {
        HStack(spacing: TabPickerStyles.spacing){
            Text(nameTab)
                .font(TabPickerStyles.nameFont)
                .foregroundStyle(TabPickerStyles.textColor)
        }
        .padding(.horizontal, TabPickerStyles.paddingInter)
        .frame(maxWidth: .infinity, alignment: .center)
        .frame(height: TabPickerStyles.heightInter)
        .background(isOn ?
                    TabPickerStyles.backgroundIsSelected
                    : TabPickerStyles.backgroundNoSelected)
        .clipShape(TabPickerStyles.shape)
        .overlay {
            TabPickerStyles.shape
                .strokeBorder(isOn ?
                              TabPickerStyles.borderColor
                              : Color.clear,
                              lineWidth: TabPickerStyles.borderWidth)
        }
    }
}

fileprivate enum TabPickerStyles {
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
    static let spacingZero = AppToken.Primitive.spacing0
    static let paddingInter = AppToken.Primitive.padding5
    static let paddingExtern = AppToken.Primitive.padding1
    static let textColor = AppColor.Label.primary
}

#Preview {
    VStack{
        NeubrutTabPicker(nameFirstTab: "Liste", nameSecondTab: "Carte", state: .constant(.first))
    }
    .padding()
    .frame(width: 200)
    .background(AppColor.Page.background)
}
