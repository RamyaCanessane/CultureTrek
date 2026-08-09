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
    
    var body: some View {
        HStack(spacing: HistoryHeadlerStyles.spacer){
            NeubrutTabPicker(nameFirstTab: firstTab,nameSecondTab: secondTab)
            FilterButton(filterAction: {})
        }
        .padding(HistoryHeadlerStyles.padding)
    }
}

struct HistoryHeadlerStyles {
    static let spacer = AppToken.Primitive.spacing4
    static let padding = AppToken.Primitive.padding4
}

#Preview {
    VStack{
        HistorySceneHeadler(firstTab: "Lalal", secondTab: "Malal")
    }
    .padding()
    .background(AppColor.background)
}
