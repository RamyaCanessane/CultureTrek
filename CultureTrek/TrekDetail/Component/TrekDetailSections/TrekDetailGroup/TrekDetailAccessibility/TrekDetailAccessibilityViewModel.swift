//
//  TrekDetailAccessibilityViewModel.swift
//  CultureTrek
//
//  Created by Apprenant174 on 11/08/2026.
//

import Foundation
import SwiftUI

@Observable
final class TrekDetailAccessibilityViewModel {
    
    //Etat de l'écran
    var bikeAccessibility : (value: Bool, icon: Image?, name: String?) = (value: false, icon: nil, name: nil)
    var strollerAccessibility : (value: Bool, icon: Image?, name: String?) = (value: false, icon: nil, name: nil)
    var walkingAccessibility : (value: Bool, icon: Image?, name: String?) = (value: false, icon: nil, name: nil)
    var wheelchairAccessibility : (value: Bool, icon: Image?, name: String?) = (value: false, icon: nil, name: nil)
    
    //Données
    let accessibility : Trek.Accessibility
    
    init(accessibility: Trek.Accessibility) {
        self.accessibility = accessibility
        
        getAccessibilitySettings()
    }
    
    //Intention
    func getAccessibilitySettings(){
        bikeAccessibility.value = accessibility.bike
        strollerAccessibility.value = accessibility.stroller
        walkingAccessibility.value = accessibility.walking
        wheelchairAccessibility.value = accessibility.wheelchair

        
        if bikeAccessibility.value {
            bikeAccessibility.icon = AppImage.Icon.accessibilityBike.image
            bikeAccessibility.name = "Vélo"
        }
        
        if strollerAccessibility.value {
            strollerAccessibility.icon = AppImage.Icon.accessibilityStroller.image
            strollerAccessibility.name = "Poussette"
        }
        
        if walkingAccessibility.value {
            walkingAccessibility.icon = AppImage.Icon.accessibilityWalk.image
            walkingAccessibility.name = "À pied"
        }
        
        if wheelchairAccessibility.value {
            wheelchairAccessibility.icon = AppImage.Icon.accessibilityWheelchair.image
            wheelchairAccessibility.name = "PMR"
        }
        
    }
    
}
