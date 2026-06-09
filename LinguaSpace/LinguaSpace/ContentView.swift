//
//  ContentView.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AppModel.self) private var appModel
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    
    var body: some View {
        if appModel.immersiveSpaceState == .open {
            activeControlPanel
        } else {
            setupFlow
        }
    }
    
    @ViewBuilder

    private var setupFlow: some View {

        switch appModel.setupStep {

        case .objectSelection:

            ObjectSelectionView()

        case .scenarioSelection:

            ScenarioSelectionView()

        }

    }
    private var activeControlPanel: some View {
        VStack(spacing: 16) {
            Text("LinguaSpace Active")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("\(appModel.generatedVocabularyItems.count) spatial labels generated.")
                .foregroundStyle(.secondary)
            
            Button("Back to Setup") {
                Task {
                    await dismissImmersiveSpace()
                    appModel.immersiveSpaceState = .closed
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button("Start Over") {
                Task {
                    await dismissImmersiveSpace()
                    appModel.immersiveSpaceState = .closed
                    appModel.resetSetup()
                }
            }
            .buttonStyle(.bordered)
        }
        .padding(28)
        .frame(width: 340)
        .glassBackgroundEffect()
    }
}

#Preview {
    ContentView()
        .environment(AppModel())
}
