//
//  SolutionRow.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 11/08/2026.
//

import SwiftUI

struct SolutionRow: View {
    @State private var isExpanded: Bool = false
    let question: String
    let answer: String
    let explanation: String
    let order: UInt
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: AppToken.Primitive.padding4) {
                Text("\(order)")
                    .font(.spaceGrotesk(size: 20, weight: .medium))
                    .frame(width: 40, height: 40)
                    .background(AppColor.accentSecondary)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                            .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                    )
                VStack(alignment: .leading, spacing: 16) {
                    Text(question)
                        .font(.spaceGrotesk(size: 15, weight: .medium))
                    Text(answer)
                        .font(.spaceGrotesk(size: 15, weight: .bold))
                }
                
                Button {
                    isExpanded.toggle()
                } label: {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                }
                .tint(AppColor.Label.primary)
            }
            if isExpanded {
                ExplanationAnswerCard(explanation: explanation)
            }
            
        }
        .padding(AppToken.Primitive.padding4)
        .background(AppColor.accentNeutral)
        .overlay(
            RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
            
        )
    }
}

#Preview {
    SolutionRow(question: "En quelle année la Révolution française a-t-elle commencé avec la prise de la Bastille ?", answer: "1789", explanation: "La Fête nationale française commémore le 14 juillet 1789 (prise de la Bastille).", order: 1)
        .padding(16)
}
