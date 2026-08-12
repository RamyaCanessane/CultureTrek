//
//  HistorySceneSection.swift
//  CultureTrek
//
//  Created by Apprenant162 on 09/08/2026.
//

import SwiftUI

struct HistorySceneSection: View {
    let sectionTitle: Text
    let city: String
    let department: String?
    let name: String
    let picture: Image
    let region: String
    let isBig: Bool = true
    
    var body: some View {
        VStack{
            HistorySectionTitle(title: sectionTitle)
            
            TrekCell(city: city, department: department, name: name, picture: picture, region: region, isBig: true)
            TrekCell(city: city, department: department, name: name, picture: picture, region: region, isBig: true)
        }
    }
}

#Preview {
    VStack{
        HistorySceneSection(sectionTitle: Text("43 GSgf 3453"), city: "GSRG", department: "GS4Fge", name: "GZFfdaer", picture: Image(.trekTestPicture), region: "GDFZzc")
    }
    .padding()
    .background(AppColor.Page.background)
}
