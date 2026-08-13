//
//  HistoryMap.swift
//  CultureTrek
//
//  Created by Apprenant162 on 11/08/2026.
//

import MapKit
import SwiftUI

struct HistoryMap: View {
    let treks: [Trek]
    
    var body: some View {
        Map {
            ForEach(
                treks
            ){ trek in
                Annotation(
                    trek.name,
                    coordinate: trek.coordinate
                ) {
                    NavigationLink {
                        TrekDetailScene(trek: trek)
                    } label: {
                        Image(
                            systemName: "flag.pattern.checkered"
                        )
                        .font(.system(size: 18,
                                      weight: .bold))
                        .foregroundStyle(
                            HistoryMapStyles.fillColor
                        )
                        .frame(
                            width: 40,
                            height: 40
                        )
                        .background(
                            HistoryMapStyles.background,
                            in: .circle
                        )
                        .clipShape(
                            HistoryMapStyles.shape
                        )
                        .overlay {
                            HistoryMapStyles.shape
                                .strokeBorder(
                                    HistoryMapStyles.borderColor,
                                    lineWidth: HistoryMapStyles.borderWidth
                                )
                        }
                    }
                }
            }
        }
    }
}

fileprivate enum HistoryMapStyles {
    static let background = AppColor.accentPrimary // ou Secondary
    static let borderColor = AppColor.border
    static let borderWidth = AppToken.borderWidth
    static let cornerRadius = AppToken.cornerRadius
    static let fillColor = Color.black
    static let shape = RoundedRectangle(
        cornerRadius: 99
    )
}

#Preview {
    NavigationStack{
        HistoryMap(
            treks: Trek.liveDemoHistoryExamples
        )
    }
}
