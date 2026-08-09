//
//  TrekSettingsScene.swift
//  CultureTrek
//  
//  Created by Mathieu Nivelles on 09/08/2026.
//  Copyright © 2026 Mathieu Nivelles. All rights reserved.
//  

import SwiftUI

struct TrekSettingsScene: View {
    let duration: Duration
    let onPressStart: (Trek.Mode, Trek.PlayFormat, Bool) -> Void
    let onDismiss: () -> Void
    
    @State private var mode: Trek.Mode
    @State private var playFormat: Trek.PlayFormat
    @State private var isDownloaded: Bool
    
    init(duration: Duration,
         mode: Trek.Mode,
         playFormat: Trek.PlayFormat,
         isDownloaded: Bool,
         onPressStart: @escaping (Trek.Mode, Trek.PlayFormat, Bool) -> Void,
         onDismiss: @escaping () -> Void) {
        self.duration = duration
        self.mode = mode
        self.playFormat = playFormat
        self.isDownloaded = isDownloaded
        self.onPressStart = onPressStart
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading,
                   spacing: Styles.vSpacing) {
                TrekSettingsLabelContent(label: "Durée estimée",
                                         content: durationString)
                .padding(.horizontal)
                
                trekModeView
                    .padding(.horizontal)
                
                trekPlayFormatView
                    .padding(.horizontal)
                
                downloadTrekView
                    .padding(.horizontal)
            }
                   .padding(.vertical)
        }
        .scrollBounceBehavior(.basedOnSize)
        .frame(maxWidth: .infinity)
        .background(Styles.background)
        .sceneHeader("Paramètres",
                     onDismiss: onDismiss)
        .sceneFooter {
            Button("Voir la première énigme") {
                onPressStart(mode, playFormat, isDownloaded)
            }
                .buttonStyle(.neubrutProminent(kind: .primary,
                                               isFullWidth: true))
        }
    }
    
    private var durationString: String {
        let formatted = duration.formatted(.units(allowed: [.hours, .minutes],
                                                  width: .condensedAbbreviated))
        
        return "~\(formatted)"
    }
    
    private var trekModeView: some View {
        TrekSettingsLabelContent(label: "Mode de parcours",
                                 summary: mode.summary) {
            Menu {
                Picker("",
                       selection: $mode) {
                    ForEach(Trek.Mode.allCases) { currentMode in
                        Text(currentMode.name)
                            .tag(currentMode)
                    }
                }
            } label: {
                TrekSettingsDropdownView(label: mode.name)
            }
        }
    }
    
    private var trekPlayFormatView: some View {
        VStack(alignment: .center,
               spacing: Styles.sectionVSpacing) {
            TrekSettingsLabelContent(label: "Parcourir en",
                                     summary: playFormat.summary) {
                Menu {
                    Picker("",
                           selection: $playFormat) {
                        ForEach(Trek.PlayFormat.allCases) { format in
                            Text(format.name)
                                .tag(format)
                        }
                    }
                } label: {
                    TrekSettingsDropdownView(label: playFormat.name)
                }
            }
            
            if playFormat == .group {
                AppImage.qrCodeTest
                    .resizable()
                    .scaledToFit()
                    .frame(width: Styles.qrCodeSize,
                           height: Styles.qrCodeSize)
                    .padding(Styles.qrCodePadding)
                    .background(Styles.qrCodeBackground,
                                in: Styles.qrCodeShape)
            }
        }
    }
    
    private var downloadTrekView: some View {
        TrekSettingsLabelContent(label: "Télécharger le parcours",
                                 summary: isDownloadedSummary) {
            Button {
                isDownloaded = true
            } label: {
                AppImage.Icon.download.image
            }
            .buttonStyle(.neubrutIcon(kind: isDownloaded
                                      ? .success
                                      : .neutral))
        }
    }
    
    private var isDownloadedSummary: String {
        if isDownloaded {
            "Tu peux faire le jeu de piste hors ligne. Cependant, le jeu de piste se fera en mode découverte si tu n’es pas connecté."
        } else {
            "Le téléchargement te permettra de faire le jeu de piste hors ligne. Cependant, si tu es hors connexion, le jeu de piste se fera en mode découverte."
        }
    }
}

fileprivate enum Styles {
    
    static let vSpacing = AppToken.Primitive.spacing6
    
    static let background = AppColor.background
    
    static let sectionVSpacing = AppToken.Primitive.spacing3
    
    static let qrCodeSize: Double = 128
    static let qrCodePadding = AppToken.Primitive.padding2
    static let qrCodeBackground: Color = .white
    static let qrCodeCornerRadius = AppToken.cornerRadius
    static let qrCodeShape = RoundedRectangle(cornerRadius: qrCodeCornerRadius)
}

#Preview {
    TrekSettingsScene(
        duration: .seconds(1 * 3600 + 20 * 60),
        mode: .ranked,
        playFormat: .solo,
        isDownloaded: false,
        onPressStart: { _, _, _ in },
        onDismiss: {})
}
