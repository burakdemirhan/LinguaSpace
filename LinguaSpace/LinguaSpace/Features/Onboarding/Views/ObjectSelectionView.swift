//
//  ObjectSelectionViewModel.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import SwiftUI

struct ObjectSelectionView: View {

    

    @State private var viewModel = ObjectSelectionViewModel()

    @Environment(AppModel.self) private var appModel

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    

    var body: some View {

        NavigationStack {

            VStack(spacing: 24) {

                List {

                    ForEach(viewModel.availableObjects) { object in

                        Button {

                            viewModel.toggleSelection(for: object)

                        } label: {

                            HStack {

                                Text(object.name)

                                

                                Spacer()

                                

                                Image(systemName: viewModel.isSelected(object)

                                      ? "checkmark.circle.fill"

                                      : "circle")

                            }

                        }

                        .buttonStyle(.plain)

                    }

                }

                

                Button("Continue") {

                    appModel.selectedObjects = Array(viewModel.selectedObjects)

                    

                    Task {

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

                }

                .buttonStyle(.borderedProminent)

                .disabled(

                    !viewModel.canContinue ||

                    appModel.immersiveSpaceState != .closed

                )

                .padding(.bottom, 24)

            }

            .navigationTitle("Room Objects")

        }

    }

}

#Preview {

    ObjectSelectionView()

        .environment(AppModel())

}
