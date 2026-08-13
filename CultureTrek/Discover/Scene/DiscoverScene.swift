//
//  DiscoverScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 08/08/2026.
//

import SwiftUI

struct DiscoverScene: View {
    
    @Environment(TrekStore.self) private var store
    
    var body: some View {
        DiscoverSceneInternal(store: store)
    }
}


struct DiscoverSceneInternal: View {
    
    @State private var vm: DiscoverViewModel
    
    let heroTitle : String = "En vedette aujourd'hui"
    
    @State private var showProfileScreen = false
    
    init(store: TrekStore) {
        self._vm = State(initialValue: .init(store: store))
    }
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack {
                    
                    NavigationLink {
                        
                        TrekDetailScene(trek: vm.heroTrek)
                        
                    } label: {
                        
                        HeroTrekTitle(
                            trekTitle: vm.heroTrek.name,
                            trekCity: vm.heroTrek.city,
                            trekDepartment: vm.heroTrek.department,
                            trekRegion: vm.heroTrek.region,
                            trekPicture: vm.heroTrek.picture,
                            sectionTag: heroTitle
                        )
                        
                    }
                    
                    VStack(spacing: Styles.sectionSpacing){
                        
                        ForEach(vm.sections) { section in
                            
                            DiscoverSection(section: section)
                            
                        }
                    }
                    .padding(.vertical, Styles.sectionVerticalPadding)
                    
                }
            }
            .sceneHeader("Découvrir"){
                
                ProfileButton(showProfileScreen: $showProfileScreen, currentUser: vm.user)
                
            }
            .scrollIndicators(.hidden)
            .background(AppColor.Page.background)
            .fullScreenCover(isPresented: $showProfileScreen) {
                
                ProfileScene(user: vm.user)
                
            }
        }
    }
}

fileprivate struct Styles {
    
    static let sectionVerticalPadding = AppToken.Primitive.spacing4
    static let sectionSpacing = AppToken.Primitive.spacing6
    
}

#Preview {
    
    let trekStore: TrekStore = .init(treks: Trek.liveDemoExamples)
    let appStore: AppStore = .init(user: User.liveDemoExample)
    
    DiscoverScene()
        .environment(trekStore)
        .environment(appStore)
}
