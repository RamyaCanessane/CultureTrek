//
//  CompletedTrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailScene: View {
    
    let trek : Trek
    
    @State private var state: TabState = .first
    
    enum PickerTab : String {
        case summary = "Résumé"
        case info = "Infos"
    }
        
    var body: some View {
        
        SceneDetail(trek: trek) {
            
            VStack(alignment: .leading, spacing: Styles.detailSectionsSpacing ){
                
                NeubrutTabPicker(nameFirstTab: PickerTab.summary.rawValue, nameSecondTab: PickerTab.info.rawValue, state: $state)
                    .padding(.horizontal, Styles.pickerPadding)
                    .padding(.bottom, Styles.pickerBottomPadding)
                
                if state == .first {
                    
                    CompletedTrekDetailSections(trek: trek)
                    
                } else {
                    
                    CompletedTrekDetailSectionsInfo(trek: trek)
                    
                }
                
            }
            .padding(.vertical, Styles.detailSectionsVerticalPadding)
            .neubrutTabViewVisibility(.hidden)
        }
        
    }
}

fileprivate struct Styles {
    
    static let pickerPadding = AppToken.Primitive.padding20
    static let pickerBottomPadding = -AppToken.Primitive.padding8
    
    static let detailSectionsSpacing = AppToken.Primitive.spacing8
    static let detailSectionsVerticalPadding = AppToken.Primitive.spacing8
    static let detailSectionsHorizontalPadding = AppToken.Primitive.spacing4
    
}

#Preview {
    CompletedTrekDetailScene(trek: Trek.example)
}
