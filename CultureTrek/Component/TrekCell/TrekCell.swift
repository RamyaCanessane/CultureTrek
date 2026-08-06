//
//  TrekCell.swift
//  CultureTrek
//
//  Created by Apprenant162 on 04/08/2026.
//

import SwiftUI

struct TrekCell: View {
    let city: String
    let department: String?
    let name: String
    let picture: Image
    let region: String
    let isBig: Bool
    
    var body: some View {
        HStack(spacing: TrekCellStyles.spacingHStack)  {
            picture
                .resizable()
                .scaledToFill()
                .frame(width: pictureSize,
                       height: pictureSize)
                .clipShape(TrekCellStyles.shape)
                .overlay {
                    TrekCellStyles.shape
                        .strokeBorder(TrekCellStyles.borderColor,
                                      lineWidth: TrekCellStyles.borderWidth)
                }
            
            VStack(alignment: .leading,
                   spacing: TrekCellStyles.spacingVStack){
                Text(name)
                    .font(TrekCellStyles.nameFont)
                    .lineLimit(2)
                
                if let department {
                    Text("\(city) • \(department)")
                } else {
                    Text("\(city) • \(region)")
                }
            }
                   .font(TrekCellStyles.localisationFont)
                   .foregroundStyle(TrekCellStyles.textColor)
                   .lineLimit(1)
        }
        .padding(.trailing,TrekCellStyles.trailingPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(TrekCellStyles.background)
        .clipShape(TrekCellStyles.shape)
        .overlay {
            TrekCellStyles.shape
                .strokeBorder(TrekCellStyles.borderColor,
                              lineWidth: TrekCellStyles.borderWidth)
        }
    }
    
    private var pictureSize: Double {
        isBig
               ? TrekCellStyles.frameSizeBig
               : TrekCellStyles.frameSize
    }
}

struct TrekCellStyles {
    static let background = AppColor.accentNeutral
    static let trailingPadding = AppToken.Primitive.padding2
    static let frameSize: Double = 72
    static let frameSizeBig: Double = 80
    static let spacingHStack = AppToken.Primitive.spacing3
    static let spacingVStack = AppToken.Primitive.spacing0_5
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    
    static let cornerRadius = AppToken.cornerRadius
    static let shape = RoundedRectangle(cornerRadius: cornerRadius)
    
    static let localisationFont: Font = .spaceGrotesk(size: 15,
                                                      weight: .medium)
    static let textColor = AppColor.Label.primary
    
    static let nameFont: Font = .system(size: 20,
                                        weight: .heavy)
        .width(.condensed)
}

#Preview {
    VStack{
        TrekCell(
            city: "Sainte-Genevieve-des-Bois",
            department: "Essonne",
            name: "Cimetière de refugies politiques slaves de refugies politiques slaves de refugies politiques slaves",
            picture: Image(.trekTestPicture),
            region: "Ile-de-France",
            isBig: false
        )
        
        TrekCell(
            city: "Sainte-Genevieve-des-Bois",
            department: "Essonne",
            name: "Cimetière de refugies politiques slaves",
            picture: Image(.trekTestPicture),
            region: "Ile-de-France",
            isBig: true
        )
    }
    .padding()
    .background(AppColor.background)
}
