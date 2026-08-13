//
//  HistorySceneHeader.swift
//  CultureTrek
//
//  Created by Apprenant162 on 09/08/2026.
//

import SwiftUI

struct HistorySceneHeader: View {
    @Environment(\.dismiss) private var dismiss
    
    let firstTab: String
    let secondTab: String
    @Binding var tabState: NeubrutTabPicker.TabState
    @Binding var filterOption: FilterButton.Option
    
    var body: some View {
        HStack {
            NeubrutTabPicker(
                nameFirstTab: firstTab,
                nameSecondTab: secondTab,
                state: $tabState
            )
            
            Spacer()
            
            if tabState == .first {
                FilterButton(
                    selection: $filterOption
                )
            }
        }
    }
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
