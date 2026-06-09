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
        ZStack {
            VStack(spacing: 28) {
                header
                
                objectSelectionPanel
                
                continueButton
                
                tipView
            }
            .frame(width: 620)
            .padding(.vertical, 32)
        }
    }
    
    private var header: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Room Setup")
                .font(.largeTitle)
                .fontWeight(.semibold)
            
            Text("Select the objects you want to place in your room.")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var objectSelectionPanel: some View {
        VStack(alignment: .leading, spacing: 18) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Select Room Objects")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Choose the objects you want to place in your room.")
                    .foregroundStyle(.secondary)
            }
            
            VStack(spacing: 0) {
                ForEach(viewModel.availableObjects) { object in
                    Button {
                        appModel.toggleObjectSelection(object)
                    } label: {
                        HStack(spacing: 16) {
                            Image(systemName: iconName(for: object.name))
                                .font(.title3)
                                .frame(width: 28)
                            
                            Text(object.name)
                                .font(.headline)
                            
                            Spacer()
                            
                            Image(systemName: appModel.isObjectSelected(object)
                                  ? "checkmark.circle.fill"
                                  : "circle")
                                .font(.title3)
                                .foregroundStyle(appModel.isObjectSelected(object)
                                                 ? .green
                                                 : .secondary)
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    .buttonStyle(.plain)
                    
                    if object.id != viewModel.availableObjects.last?.id {
                        Divider()
                            .padding(.leading, 64)
                    }
                }
            }
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 22))
        }
        .padding(28)
        .glassBackgroundEffect()
    }
    
    private var continueButton: some View {
        Button {
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
        } label: {
            HStack(spacing: 12) {
                Text("Continue")
                    .fontWeight(.semibold)
                
                Image(systemName: "arrow.right")
            }
            .font(.title3)
            .padding(.horizontal, 42)
            .padding(.vertical, 18)
        }
        .buttonStyle(.borderedProminent)
        .disabled(
            !appModel.canContinue ||
            appModel.immersiveSpaceState != .closed
        )
    }
    
    private var tipView: some View {
        HStack(spacing: 16) {
            Image(systemName: "lightbulb")
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Tip")
                    .font(.headline)
                
                Text("You will place these objects one by one in your room.")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(22)
        .glassBackgroundEffect()
    }
    
    private func iconName(for objectName: String) -> String {
        switch objectName {
        case "Table":
            return "tablecells"
        case "Chair":
            return "chair"
        case "Door":
            return "door.left.hand.open"
        case "Window":
            return "rectangle.split.2x1"
        case "Lamp":
            return "lamp.desk"
        case "Book":
            return "book.closed"
        case "Cup":
            return "cup.and.saucer"
        case "Sofa":
            return "sofa"
        case "Plant":
            return "leaf"
        default:
            return "cube"
        }
    }
}

#Preview {
    ObjectSelectionView()
        .environment(AppModel())
}
