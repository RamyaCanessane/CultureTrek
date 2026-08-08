//
//  DiscoverScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct DiscoverScene: View {
    
    @State private var vm = DiscoverViewModel()
    
    let heroTitle : String = "En vedette aujourd'hui"
    
    var body: some View {
        ScrollView{
            VStack {

                HeroTrekTitle(trekTitle: vm.store.heroTrek.name, trekCity: vm.store.heroTrek.city, trekDepartment: vm.store.heroTrek.department, trekRegion: vm.store.heroTrek.region, trekPicture: vm.store.heroTrek.picture, sectionTag: heroTitle)
                
                VStack(spacing: Styles.sectionSpacing){
                    DiscoverSection(sectionTitle: vm.section1.name, sectionIcon: vm.section1.icon , sectionTreks: vm.section1.treks)
                    
                    DiscoverSection(sectionTitle: vm.section2.name, sectionIcon: vm.section2.icon , sectionTreks: vm.section2.treks)
                    
                    DiscoverSection(sectionTitle: vm.section3.name, sectionIcon: vm.section3.icon , sectionTreks: vm.section3.treks)
                    
                    DiscoverSection(sectionTitle: vm.section4.name, sectionIcon: vm.section4.icon , sectionTreks: vm.section4.treks)
                }
                .padding(.vertical, Styles.sectionVerticalPadding)
                
            }
        }
        .safeAreaBar(edge: .top, content: {
            
            DiscoverHeader(user : vm.user)
            
        })
        .scrollIndicators(.hidden)
        .background(AppColor.Page.background)
        .task {
            vm.getAllTreks()
            vm.fillTrekSections()
        }
    
    }
}

fileprivate struct Styles {
    
    static let sectionVerticalPadding = AppToken.Primitive.spacing4
    static let sectionSpacing = AppToken.Primitive.spacing6
    
}

#Preview {
    DiscoverScene()
        .environment(TrekStore())
}
