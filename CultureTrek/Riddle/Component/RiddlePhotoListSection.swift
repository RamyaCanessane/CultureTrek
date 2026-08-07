//
//  RiddlePhotoListSection.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 03/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddlePhotoListSection: View {
    let photos: [UIImage]
    let onPressItem: (Int) -> Void
    let isAddDisabled: Bool
    let onPressOpenCamera: () -> Void
    let onPressOpenPhotoLibrary: () -> Void
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: Styles.vSpacing) {
            RiddleSectionTitle("Photos")
                .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack(alignment: .top,
                       spacing: Styles.hSpacing) {
                    ForEach(photos.enumerated(), id: \.offset) { item in
                        PhotoItem(image: item.element)
                            .onTapGesture {
                                onPressItem(item.offset)
                            }
                    }
                    
                    Menu {
                        Button(action: onPressOpenCamera) {
                            Label("Prendre une photo",
                                  systemImage: AppImage.Icon.openCamera.systemName)
                        }
                        
                        Button(action: onPressOpenPhotoLibrary) {
                            Label("Choisir une photo",
                                  systemImage: AppImage.Icon.openPhotoLibrary.systemName)
                        }
                    } label: {
                        Button("Ajouter photo", action: {})
                    }
                    .buttonStyle(AddButtonStyle())
                    .disabled(isAddDisabled)
                }
                .padding(.horizontal)
            }
            .scrollBounceBehavior(.basedOnSize, axes: .horizontal)
            .scrollClipDisabled(true)
            .scrollIndicators(.hidden)
        }
    }
}

fileprivate struct PhotoItem: View {
    let image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: Styles.itemSize,
                   height: Styles.itemSize)
            .clipShape(Styles.itemShape)
            .overlay {
                Styles.itemShape
                    .strokeBorder(Styles.itemBorderColor,
                                  lineWidth: Styles.itemBorderWidth)
            }
    }
}

fileprivate struct AddButtonStyle: ButtonStyle {
    
    @Environment(\.isEnabled) private var isEnabled
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(Styles.addButtonLabelFont)
            .foregroundStyle(labelColor)
            .multilineTextAlignment(Styles.addButtonTextAlignment)
            .padding(Styles.addButtonPadding)
            .frame(width: Styles.addButtonSize,
                   height: Styles.addButtonSize,
                   alignment: .center)
            .clipShape(Styles.addButtonShape)
            .background {
                Styles.addButtonShape
                    .fill(backgroundColor)
            }
            .overlay {
                Styles.addButtonShape
                    .strokeBorder(borderColor,
                                  lineWidth: Styles.addButtonBorderWidth)
            }
            .offset(x: configuration.isPressed && isEnabled
                    ? Styles.addButtonShadowSize
                    : 0,
                    y: configuration.isPressed && isEnabled
                    ? Styles.addButtonShadowSize
                    : 0)
            .background {
                if isEnabled {
                    Styles.addButtonShape
                        .fill(Styles.addButtonShadowColor)
                        .frame(width: Styles.addButtonSize,
                               height: Styles.addButtonSize)
                        .padding([.leading, .top], Styles.addButtonShadowSize * 2)
                }
            }
            .animation(Styles.pressedAnimation,
                       value: configuration.isPressed)
    }
    
    private var labelColor: Color {
        isEnabled
        ? Styles.addButtonLabelColor
        : Styles.addButtonForegroundDisabled
    }
    
    private var borderColor: Color {
        isEnabled
        ? Styles.addButtonBorderColor
        : Styles.addButtonForegroundDisabled
    }
    
    private var backgroundColor: Color {
        isEnabled
        ? Styles.addButtonBackground
        : Styles.addButtonBackgroundDisabled
    }
}

fileprivate enum Styles {
    
    static let pressedAnimation = AppToken.buttonPressedAnimation
    
    static let vSpacing = AppToken.Primitive.spacing2
    static let hSpacing = AppToken.Primitive.spacing4
    
    static let itemSize: Double = 100
    
    static let itemCornerRadius = AppToken.cornerRadius
    static let itemShape = RoundedRectangle(cornerRadius: itemCornerRadius)
    
    static let itemBorderColor = AppColor.border
    static let itemBorderWidth = AppToken.borderWidth
    
    static let addButtonSize = itemSize
    static let addButtonShape = itemShape
    static let addButtonPadding = AppToken.Primitive.padding2
    static let addButtonBackground = AppColor.accentSecondary
    static let addButtonBackgroundDisabled = AppColor.disabledBackground
    static let addButtonForegroundDisabled = AppColor.disabledLabel
    
    static let addButtonBorderColor = AppColor.border
    static let addButtonBorderWidth = AppToken.borderWidth
    
    static let addButtonShadowColor = AppColor.shadow
    static let addButtonShadowSize = AppToken.shadowSize
    
    static let addButtonLabelFont: Font = .system(size: 15,
                                                  weight: .heavy)
        .width(.expanded)
    static let addButtonLabelColor = AppColor.Label.primary
    static let addButtonTextAlignment: TextAlignment = .center
}

#Preview {
    RiddlePhotoListSection(photos: [
        UIImage(resource: .riddleTestPicture),
        UIImage(resource: .riddleTestPicture),
        UIImage(resource: .riddleTestPicture)
    ],
                           onPressItem: { _ in },
                    isAddDisabled: false,
                           onPressOpenCamera: {},
                           onPressOpenPhotoLibrary: {})
}
