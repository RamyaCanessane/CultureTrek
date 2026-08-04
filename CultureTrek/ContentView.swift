//
//  ContentView.swift
//  CultureTrek
//
//  Created by Canessane Ramya on 29/07/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
          
            Text("Bienvenue")
            
            Text(.homeWelcomeMessage)
            
            Text(String(localized: .homeWelcomeMessage))
            
            AppImage.xpPointsIcon
                .resizable()
                .scaledToFit()
                .frame(width: 72,
                       height: 72)
            
            Text("Space Grotesky")
                .font(.spaceGrotesk(size: 32,
                                    weight: .semibold))
        }
        .padding()
        .environment(\.locale, .init(identifier: "en"))
    }
}

#Preview {
    ContentView()
}
