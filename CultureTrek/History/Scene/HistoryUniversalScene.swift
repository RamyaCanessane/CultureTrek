//
//  HistoryUniversalScene.swift
//  CultureTrek
//
//  Created by Apprenant162 on 10/08/2026.
//

import SwiftUI

struct HistoryUniversalScene: View {
    let mainTitle: Text
    let tabOne: String
    let tabTwo: String
    let section: Text
    let city: String
    let name: String
    let picture: Image
    let region: String
    
    var body: some View {
        VStack{
            HistorySceneTitle(sceneTitle: mainTitle)
            
            HistorySceneHeadler(firstTab: tabOne, secondTab: tabTwo)
            
            HistorySceneSection(sectionTitle: section, city: city, department: "", name: name, picture: picture, region: region)
            HistorySceneSection(sectionTitle: section, city: city, department: "", name: name, picture: picture, region: region)
            HistorySceneSection(sectionTitle: section, city: city, department: "", name: name, picture: picture, region: region)
            
        }
    }
}

#Preview {
    HistoryUniversalScene(mainTitle: Text("history"), tabOne: "Kiso", tabTwo: "Miso", section: Text("23 Avril 2042"), city: "GEZFc", name: "GZFAz", picture: Image(.trekTestPicture), region: "GGEgzez")
}
