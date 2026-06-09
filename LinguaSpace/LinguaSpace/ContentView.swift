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

            VStack(spacing: 12) {

                Text("LinguaSpace Active")

                    .font(.headline)

                

                Button("Back to Setup") {

                    Task {

                        await dismissImmersiveSpace()

                        appModel.immersiveSpaceState = .closed

                    }

                }

                .buttonStyle(.borderedProminent)

            }

            .padding(24)

            .frame(width: 300)

            .glassBackgroundEffect()

        } else {

            ObjectSelectionView()

        }

    }

}

#Preview {

    ContentView()

        .environment(AppModel())

}
