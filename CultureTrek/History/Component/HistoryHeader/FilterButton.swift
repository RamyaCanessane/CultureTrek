//
//  FilterButton.swift
//  CultureTrek
//
//  Created by Apprenant162 on 07/08/2026.
//

import SwiftUI

struct FilterButton: View {
    @Binding var selection: Option
    
    enum Option: String, CaseIterable, Identifiable {
        case date
        case city
        case department
        
        var id: String {
            rawValue
        }
        
        var name: String {
            switch self {
            case .date:
                "Date"
            case .city:
                "Ville"
            case .department:
                "Département"
            }
        }
    }
    
    var body: some View {
        Menu {
            Picker(selection.name,
                   selection: $selection) {
                ForEach(Option.allCases) { option in
                    Text(option.name)
                        .tag(option)
                }
            }
        } label: {
            Button(action: {}){
                Image(systemName: FilterButtonStyles.filterIcon)
                    .font(FilterButtonStyles.iconFont)
                    .padding(FilterButtonStyles.padding)
            }
            .buttonStyle(.neubrutIcon(kind: .neutral))
        }
    }
}

fileprivate enum FilterButtonStyles {
    static let iconFont: Font = .system(size: 20,
                                        weight: .heavy)
    static let padding = AppToken.Primitive.padding1
    static let filterIcon: String = "line.3.horizontal.decrease"
}

#Preview {
    @Previewable @State var selection: FilterButton.Option = .date
    
    VStack {
        FilterButton(selection: $selection)
    }
    .padding()
    .background(AppColor.Page.background)
}
