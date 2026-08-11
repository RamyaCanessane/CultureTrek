//
//  FilterButton.swift
//  CultureTrek
//
//  Created by Apprenant162 on 07/08/2026.
//

import SwiftUI

struct FilterButton: View {
    let filterAction: () -> Void
    
    var body: some View {
        VStack(alignment: .trailing){
            Button(action: filterAction){
                Image(systemName: FilterButtonStyles.filterIcon)
                    .font(FilterButtonStyles.iconFont)
                    .padding(FilterButtonStyles.padding)
            }
            .buttonStyle(.neubrutIcon(kind: .neutral))
        }
    }
}

struct FilterButtonStyles {
    static let iconFont: Font = .system(size: 20,
                                        weight: .heavy)
    static let padding = AppToken.Primitive.padding1
    static let filterIcon: String = "line.3.horizontal.decrease"
}

#Preview {
    VStack {
        FilterButton(filterAction: {})
    }
    .padding()
    .background(AppColor.Page.background)
}
