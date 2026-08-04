//
//  RiddleCluePopupView.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 04/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleCluePopupView: View {
    let content: String
    
    @State private var isFirstPresented: Bool = false
    
    private let delay: Double = 1
    
    var body: some View {
        VStack(alignment: .center,
               spacing: Styles.vSpacing) {
            iconView
                .opacity(0)
                .overlay {
                    iconView
                        .symbolEffect(.drawOn.byLayer,
                                      isActive: !isFirstPresented)
                }
            
            titleView
                .opacity(0)
                .overlay {
                    if isFirstPresented {
                        titleView
                            .transition(.blurReplace.animation(.smooth.delay(delay)))
                    }
                }
            
            contentView
                .opacity(0)
                .overlay {
                    if isFirstPresented {
                        contentView
                            .transition(.blurReplace.animation(.smooth.delay(delay * 1.64)))
                    }
                }
        }
               .padding(Styles.padding)
               .background {
                   Styles.shape
                       .fill(Styles.background)
               }
               .overlay {
                   Styles.shape
                       .strokeBorder(Styles.borderColor,
                                     lineWidth: Styles.borderWidth)
               }
               .task {
                   do {
                       try await Task.sleep(for: .seconds(delay))
                       
                       isFirstPresented = true
                   } catch {
                       
                   }
               }
    }
    
    private var iconView: some View {
        AppImage.Icon.popupClue.image
            .resizable()
            .scaledToFit()
            .frame(width: Styles.iconSize,
                   height: Styles.iconSize)
            .foregroundStyle(Styles.iconColor)
    }
    
    private var titleView: some View {
        Text("Indice")
            .font(Styles.titleFont)
            .textCase(Styles.titleTextCase)
            .foregroundStyle(Styles.titleColor)
    }
    
    private var contentView: some View {
        Text(content)
            .font(Styles.subtitleFont)
            .foregroundStyle(Styles.subtitleColor)
            .multilineTextAlignment(Styles.subtitleTextAlignment)
    }
}

#warning("Ajouter une couleur jaune pour Clue dans variables Figma et AppColor et l'utiliser ici.")

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing4
    static let padding = AppToken.Primitive.padding8
    
    static let background = AppColor.accentNeutral
    static let cornerRadius = AppToken.popupCornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    static let borderColor = AppColor.border
    static let borderWidth: Double = AppToken.popupBorderWidth
    
    static let iconSize: Double = 128
    static let iconWeight: Font.Weight = .regular
    static let iconColor = AppColor.clue
    
    static let titleFont: Font = .system(size: 32,
                                         weight: .heavy)
        .width(.condensed)
    static let titleTextCase: Text.Case = .uppercase
    static let titleColor = AppColor.clue
    
    static let subtitleFont: Font = .spaceGrotesk(size: 17,
                                                  weight: .regular)
    static let subtitleTextAlignment: TextAlignment = .leading
    static let subtitleColor = AppColor.Label.primary
}

#Preview {
    RiddleCluePopupView(content: "Sapiente harum reprehenderit ipsam quod. Quisquam omnis incidunt quod iusto recusandae.")
}
