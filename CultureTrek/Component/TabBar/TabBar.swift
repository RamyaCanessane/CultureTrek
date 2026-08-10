//
//  TabBar.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 10/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

// https://github.com/Gioevi90/FloatingTabView

import SwiftUI

struct NeubrutTab: View {
    let activeIcon: Image
    let inactiveIcon: Image
    let content: AnyView
    
    init<Content: View>(activeIcon: Image,
                        inactiveIcon: Image,
                        @ViewBuilder content: () -> Content) {
        self.activeIcon = activeIcon
        self.inactiveIcon = inactiveIcon
        self.content = AnyView(content())
    }
    
    var body: some View {
        content
    }
}

struct NeubrutTabView: View {
    let content: [NeubrutTab]
    
    @State private var selection = 0
    @Namespace private var namespace
    
    init<T>(selection: Int = 0,
            @ViewBuilder content: () -> TupleView<T>) {
        self.selection = selection
        self.content = content().getViews()
    }
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: .zero) {
            TabView(selection: $selection) {
                ForEach(content.indices) { index in
                    content[index]
                        .frame(maxHeight: .infinity)
//                        .ignoresSafeArea(.all, edges: .top)
                }
                .toolbar(.hidden, for: .tabBar)
            }
            
            HStack(spacing: .zero) {
                Spacer()
                
                ForEach(content.indices, id: \.self) { index in
                    VStack(alignment: .center,
                           spacing: Styles.tabSpacing) {
                        Group {
                            if selection == index {
                                content[index].activeIcon
                                    .resizable()
                                    .scaledToFit()
                            } else {
                                content[index].inactiveIcon
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        .opacity(selection == index
                                 ? 1
                                 : Styles.inactiveTabOpacity)
                        .frame(width: Styles.iconSize,
                               height: Styles.iconSize)
                        
                        if selection == index {
                            Capsule()
                                .fill(Styles.indicatorColor)
                                .frame(width: Styles.indicatorWidth,
                                       height: Styles.indicatorHeight)
                                .matchedGeometryEffect(id: "NeubrutTab_indicator",
                                                       in: namespace)
                        } else {
                            Capsule()
                                .fill(Color.clear)
                                .frame(width: Styles.indicatorWidth,
                                       height: Styles.indicatorHeight)
                        }
                    }
                           .contentShape(.rect)
                           .animation(.bouncy,
                                      value: selection)
                           .onTapGesture {
                               selection = index
                           }
                    
                    Spacer()
                }
            }
            .padding(.top, Styles.topPadding)
            .background(Styles.background)
            .overlay(alignment: .top) {
                Rectangle()
                    .fill(Styles.borderColor)
                    .frame(height: Styles.borderWidth)
            }
        }
    }
}

extension TupleView {
    
    func getViews() -> [NeubrutTab] {
        makeArray(from: value)
    }
    
    private func makeArray<Tuple>(from tuple: Tuple) -> [NeubrutTab] {
        func convert(child: Mirror.Child) -> NeubrutTab? {
            child.value as? NeubrutTab
        }
        
        return Mirror(reflecting: tuple)
            .children
            .compactMap(convert)
    }
}

fileprivate enum Styles {
    
    static let topPadding = AppToken.Primitive.padding3
    
    static let background = AppColor.tabViewBackground
    
    static let borderWidth = AppToken.borderWidth
    static let borderColor = AppColor.border
    
    static let tabSpacing = AppToken.Primitive.spacing1
    
    static let inactiveTabOpacity: Double = 0.64
    
    static let iconSize: Double = 32
    
    static let indicatorWidth: Double = 8
    static let indicatorHeight: Double = 4
    static let indicatorColor = AppColor.border
}
