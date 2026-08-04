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
            
            RoundedRectangle(cornerRadius: 8)
                .fill(.red)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 8)
                .stroke(.red, lineWidth: 8)
                .frame(width: 200, height: 100)
            
            RoundedRectangle(cornerRadius: 8 + 4)
                .strokeBorder(.red, lineWidth: 8)
                .frame(width: 200, height: 100)
        }
        .padding()
        .environment(\.locale, .init(identifier: "en"))
    }
}

#Preview {
    ContentView()
}
