//
//  TrekDetailAccessibilitySection.swift
//  CultureTrek
//
//  Created by Apprenant174 on 10/08/2026.
//

import SwiftUI

struct TrekDetailAccessibility: View {
    
    let trek : Trek
    
    var body: some View {
        TrekDetailAccessibilityInternal(trek : trek)
    }
}

struct TrekDetailAccessibilityInternal: View {
    
    let trek : Trek
    
    @State private var vm : TrekDetailAccessibilityViewModel
    
    init(trek: Trek) {
        self.trek = trek
        self._vm = State(initialValue: .init(accessibility: trek.accessibility))
    }
    
    let title : String = "Accessibilité"

    var body: some View {
        
        TrekDetailGroup(title: title) {
            
            HStack(spacing: Styles.accessibilityInfoSpacing) {
                
                if vm.bikeAccessibility.value {
                    
                    SingleAccessibilityContent(
                        icon: vm.bikeAccessibility.icon!,
                        name: vm.bikeAccessibility.name!
                    )
                    
                }
                
                if vm.strollerAccessibility.value {
                    
                    SingleAccessibilityContent(
                        icon: vm.strollerAccessibility.icon!,
                        name: vm.strollerAccessibility.name!
                    )
                    
                }
                
                if vm.walkingAccessibility.value {
                    
                    SingleAccessibilityContent(
                        icon: vm.walkingAccessibility.icon!,
                        name: vm.walkingAccessibility.name!
                    )
                    
                }
                
                if vm.wheelchairAccessibility.value {
                    
                    SingleAccessibilityContent(
                        icon: vm.wheelchairAccessibility.icon!,
                        name: vm.wheelchairAccessibility.name!
                    )
                    
                }
                
            }
            .padding(.top, Styles.accessibilityInfoPaddingTop)
            
        }

    }
}

fileprivate struct Styles {
    
    static let accessibilityInfoSpacing = AppToken.Primitive.padding6
    static let accessibilityInfoPaddingTop = AppToken.Primitive.padding1
    
}

#Preview {
    TrekDetailAccessibility(trek: Trek.example)
}
