//
//  UIDiscoverTitlesFontStyle.swift
//  CultureTrek
//
//  Created by Apprenant174 on 07/08/2026.
//

import SwiftUI
import UIKit

struct UITitleFontStyle : UIViewRepresentable {
    
    let content : String
    
    let size : CGFloat
    let weight : UIFont.Weight
    let width : UIFont.Width
    
    let foreground : Color
    
    func makeUIView(context: Context) -> UILabel {
        
        let label = UILabel()
        label.text = content
        label.font = UIFont.systemFont(ofSize: size, weight: weight, width: width)
        label.textColor = UIColor(foreground)
        label.textAlignment = .left
        
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        return label
        
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = content
    }
    
}

fileprivate struct UIComponent: View {
    
    var body: some View {
        UITitleFontStyle(content: "Hey", size: 24, weight: .heavy, width: .condensed, foreground: AppColor.Label.primary)
        
    }
}

#Preview {
    UIComponent()
}
