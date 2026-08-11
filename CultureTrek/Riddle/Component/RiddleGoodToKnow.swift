//
//  RiddleGoodToKnow.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 03/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct RiddleGoodToKnow: View {
    let content: String
    
    var body: some View {
        TitledCard(title: "À retenir",
                   content: content,
                   kind: .info)
    }
}

#Preview {
    RiddleGoodToKnow(content: "Molestiae est impedit hic et suscipit dolor. Animi rerum porro neque perferendis enim animi ut sed consequatur fugiat eos vitae hic illo.")
        .padding()
        .background(AppColor.Page.background)
}
