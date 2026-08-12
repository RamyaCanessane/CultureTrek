//
//  HistorySceneHeadler.swift
//  CultureTrek
//
//  Created by Apprenant162 on 09/08/2026.
//

import SwiftUI

struct HistorySceneHeadler: View {
    let firstTab: String
    let secondTab: String
//    let isOn: Bool = false
    @State var state: TabState = .second
    
    var body: some View {
        HStack(spacing: HistoryHeadlerStyles.spacer){
            NeubrutTabPicker(nameFirstTab: firstTab,nameSecondTab: secondTab, state: $state)
            FilterButton(filterAction: {})
        }
//        .padding(HistoryHeadlerStyles.padding)
    }
}

fileprivate enum HistoryHeadlerStyles {
    static let spacer = AppToken.Primitive.spacing20
    static let padding = AppToken.Primitive.padding4
}

#Preview {
    VStack{
        HistorySceneHeadler(firstTab: "Liste", secondTab: "Carte")
    }
    .padding()
    .background(AppColor.Page.background)
}
