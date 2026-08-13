//
//  HistorySceneHeader.swift
//  CultureTrek
//
//  Created by Apprenant162 on 09/08/2026.
//

import SwiftUI

struct HistorySceneHeader: View {
    let firstTab: String
    let secondTab: String
    @Binding var tabState: NeubrutTabPicker.TabState
    @Binding var filterOption: FilterButton.Option
    
    var body: some View {
        HStack(
            spacing: HistoryHeadlerStyles.spacer
        ){
            NeubrutTabPicker(
                nameFirstTab: firstTab,
                nameSecondTab: secondTab,
                state: $tabState
            )
            .frame(
                width: 200,
                height: 40
            )
            if tabState == .first {
                FilterButton(
                    selection: $filterOption
                )
            }
        }
    }
}

fileprivate enum HistoryHeadlerStyles {
    static let spacer = AppToken.Primitive.spacing20
    static let padding = AppToken.Primitive.padding4
}

#Preview {
    @Previewable @State var state: NeubrutTabPicker.TabState = .first
    @Previewable @State var filterOption: FilterButton.Option = .date
    
    VStack{
        HistorySceneHeader(
            firstTab: "Liste",
            secondTab: "Carte",
            tabState: $state,
            filterOption: $filterOption
        )
    }
    .padding()
    .background(
        AppColor.Page.background
    )
}
