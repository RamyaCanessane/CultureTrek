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
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    HeroTrekTitle(trekTitle: vm.store.heroTrek.name, trekCity: vm.store.heroTrek.city, trekDepartment: vm.store.heroTrek.department, trekRegion: vm.store.heroTrek.region, trekPicture: vm.store.heroTrek.picture, sectionTag: heroTitle)
                    
                    VStack(spacing: Styles.sectionSpacing){
                        
                        ForEach(vm.store.sections){ section in
                            
                            DiscoverSection(section: section)
                            
                        }
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
}

fileprivate struct Styles {
    
    static let sectionVerticalPadding = AppToken.Primitive.spacing4
    static let sectionSpacing = AppToken.Primitive.spacing6
    
}

#Preview {
    DiscoverScene()
        .environment(TrekStore())
}
