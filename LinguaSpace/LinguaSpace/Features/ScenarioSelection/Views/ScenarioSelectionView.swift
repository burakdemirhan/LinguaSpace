//
//  ScenarioSelectionView.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 09/06/26.
//

import SwiftUI

struct ScenarioSelectionView: View {

    

    @State private var viewModel = ScenarioSelectionViewModel()

    @Environment(AppModel.self) private var appModel

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    

    var body: some View {

        VStack(spacing: 28) {

            header

            

            scenarioList

            

            continueButton

        }

        .frame(width: 620)

        .padding(.vertical, 32)

    }

    

    private var header: some View {

        VStack(alignment: .leading, spacing: 8) {

            Text("Choose a Scenario")

                .font(.largeTitle)

                .fontWeight(.semibold)

            

            Text("AI will adapt your vocabulary to this context.")

                .font(.headline)

                .foregroundStyle(.secondary)

        }

        .frame(maxWidth: .infinity, alignment: .leading)

    }

    

    private var scenarioList: some View {

        VStack(spacing: 12) {

            ForEach(viewModel.scenarios) { scenario in

                Button {

                    appModel.selectScenario(scenario)

                } label: {

                    HStack(spacing: 16) {

                        Image(systemName: iconName(for: scenario))

                            .font(.title2)

                            .frame(width: 32)

                        

                        VStack(alignment: .leading, spacing: 4) {

                            Text(scenario.title)

                                .font(.headline)

                            

                            Text(scenario.description)

                                .font(.subheadline)

                                .foregroundStyle(.secondary)

                                .multilineTextAlignment(.leading)

                        }

                        

                        Spacer()

                        

                        Image(systemName: appModel.selectedScenario == scenario

                              ? "checkmark.circle.fill"

                              : "circle")

                            .font(.title3)

                    }

                    .padding(20)

                    .background(.thinMaterial)

                    .clipShape(RoundedRectangle(cornerRadius: 20))

                }

                .buttonStyle(.plain)

            }

        }

    }

    

    private var continueButton: some View {

        Button {

            Task {

                await appModel.generateVocabulary()

                

                guard appModel.immersiveSpaceState == .closed else {

                    return

                }

                

                appModel.immersiveSpaceState = .inTransition

                

                let result = await openImmersiveSpace(

                    id: appModel.immersiveSpaceID

                )

                

                switch result {

                case .opened:

                    appModel.immersiveSpaceState = .open

                case .userCancelled, .error:

                    appModel.immersiveSpaceState = .closed

                @unknown default:

                    appModel.immersiveSpaceState = .closed

                }

            }

        } label: {

            if appModel.isGeneratingVocabulary {

                ProgressView()

            } else {

                Text("Generate Spatial Vocabulary")

                    .font(.headline)

                    .padding(.horizontal, 32)

                    .padding(.vertical, 14)

            }

        }

        .buttonStyle(.borderedProminent)

        .disabled(

            appModel.isGeneratingVocabulary ||

            appModel.immersiveSpaceState != .closed

        )

    }

    

    private func iconName(for scenario: Scenario) -> String {

        switch scenario {

        case .home:

            return "house"

        case .cafe:

            return "cup.and.saucer"

        case .market:

            return "basket"

        case .library:

            return "books.vertical"

        }

    }

}

#Preview {

    ScenarioSelectionView()

        .environment(AppModel())

}
