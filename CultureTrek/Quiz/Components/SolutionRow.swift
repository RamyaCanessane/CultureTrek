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
            HStack(alignment: .top, spacing: .zero) {
                Text("\(order)")
                    .font(.spaceGrotesk(size: 20, weight: .medium))
                    .foregroundStyle(AppColor.Label.primary)
                    .frame(width: 40, height: 40)
                    .background(AppColor.accentSecondary)
                    .overlay(
                        RoundedRectangle(cornerRadius: AppToken.cornerRadius)
                            .stroke(AppColor.border, lineWidth: AppToken.borderWidth)
                    )
                    .padding(.trailing, AppToken.Primitive.padding4)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(question)
                        .font(.spaceGrotesk(size: 15, weight: .regular))
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text(answer)
                        .font(.spaceGrotesk(size: 20, weight: .bold))
                }
                .foregroundStyle(AppColor.Label.primary)
                
                Spacer(minLength: AppToken.Primitive.padding2)
                
                Button {
                    withAnimation(.bouncy) {
                        isExpanded.toggle()
                    }
                    
                } label: {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded ? 90 : 0), anchor: .center)
                        .contentShape(.rect)
                }
                .tint(AppColor.Label.primary)
                .buttonStyle(.plain)
            }
            
            ExplanationAnswerCard(explanation: explanation)
                .fixedSize(horizontal: false, vertical: true)
                .opacity(isExpanded ? 1 : 0)
                .blur(radius: isExpanded ? 0 : 10)
                .frame(height: isExpanded ? nil : 0)
        }
        .padding(AppToken.Primitive.padding4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .clipped()
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
