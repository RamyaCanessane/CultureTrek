//
//  CompletedTrekDetailDate.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailDate: View {
    
    let title : String = "Complété le"
    
    let trek : Trek
    
    var body: some View {
        
        HStack {
            
            UITitle(content: title.uppercased(), size: Styles.detailFontSize, weight: .heavy, width: .condensed, foreground: Styles.detailForeground)
            
            Spacer()
            
            if let date = trek.completion?.date {
                
                Text(date.formatted(Date.FormatStyle(date: .complete, time: .omitted, timeZone: .autoupdatingCurrent)))
                    .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .medium))
                
            } else {
                
                Text("Date indisponible")
                    .font(.spaceGrotesk(size: Styles.detailFontSize, weight: .medium))
                
            }
        
        }
        .foregroundStyle(Styles.detailForeground)
        
    }
}

fileprivate struct Styles {

    static let detailForeground = AppColor.Label.primary
    
    static let titleFontSize = CGFloat(14)
    static let detailFontSize = CGFloat(14)
    
}


#Preview {
    CompletedTrekDetailDate(trek: Trek.example)
}
