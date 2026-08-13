//
//  CompletedTrekDetailScene.swift
//  CultureTrek
//
//  Created by Apprenant174 on 12/08/2026.
//

import SwiftUI

struct CompletedTrekDetailScene: View {
    
    let trek : Trek
    
    @State private var state: NeubrutTabPicker.TabState = .first
    
    @State private var showRiddleFullScreen = false
    @State private var showQuizFullScreen = false
    @State private var showMapFullScreen = false
    
    enum PickerTab : String {
        case summary = "Résumé"
        case info = "Infos"
    }
        
    var body: some View {
        
        SceneDetail(trek: trek) {
            
            VStack(alignment: .leading, spacing: Styles.detailSectionsSpacing ){
                
                HStack{
                    
                    Spacer()
                    
                    NeubrutTabPicker(
                        nameFirstTab: PickerTab.summary.rawValue,
                        nameSecondTab: PickerTab.info.rawValue,
                        state: $state
                    )
                    .padding(.bottom, Styles.pickerBottomPadding)
                    
                    Spacer()
                    
                }
                if state == .first {
                    
                    CompletedTrekDetailSections(trek: trek)
                        .padding(.bottom, Styles.detailBottomPadding)
                    
                } else {
                    
                    CompletedTrekDetailSectionsInfo(trek: trek)
                        .padding(.bottom, Styles.detailBottomPadding)
                    
                }
                
                
            }
            .padding(.vertical, Styles.detailSectionsVerticalPadding)
            .neubrutTabViewVisibility(.hidden)

        }
        .sceneFooter {
            CompletedTrekDetailFooter(
                showRiddleFullScreen: $showRiddleFullScreen,
                showQuizFullScreen: $showQuizFullScreen,
                showMapFullScreen: $showMapFullScreen
            )
        }
        .fullScreenCover(isPresented: $showQuizFullScreen) {
            QuizSolutionScene(questions: trek.quizQuestions)
        }
        .fullScreenCover(isPresented: $showMapFullScreen) {
            TrekPathScene(riddles: trek.riddles, hasLastRiddle: true)
        }
        
    }
}

fileprivate struct Styles {
    
    static let pickerPadding = AppToken.Primitive.padding10
    static let pickerBottomPadding = -AppToken.Primitive.padding8
    
    static let detailSectionsSpacing = AppToken.Primitive.spacing8
    static let detailSectionsVerticalPadding = AppToken.Primitive.spacing8
    static let detailSectionsHorizontalPadding = AppToken.Primitive.spacing4
    static let detailBottomPadding = AppToken.Primitive.padding6
    
}

#Preview {
    CompletedTrekDetailScene(trek: Trek.liveDemoHistoryExamples.first!)
}
