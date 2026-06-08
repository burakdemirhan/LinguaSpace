//
//  ImmersiveView.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import SwiftUI

import RealityKit

import RealityKitContent

struct ImmersiveView: View {

    

    @Environment(AppModel.self) private var appModel

    

    var body: some View {

        RealityView { content in

            let rootEntity = Entity()

            

            for (index, object) in appModel.selectedObjects.enumerated() {

                let textMesh = MeshResource.generateText(

                    object.name,

                    extrusionDepth: 0.01,

                    font: .systemFont(ofSize: 0.12),

                    containerFrame: .zero,

                    alignment: .center,

                    lineBreakMode: .byWordWrapping

                )

                

                let material = SimpleMaterial(color: .white, isMetallic: false)

                let textEntity = ModelEntity(mesh: textMesh, materials: [material])

                

                textEntity.position = SIMD3<Float>(

                    Float(index) * 0.35 - 0.35,

                    1.4,

                    -1.2

                )

                

                rootEntity.addChild(textEntity)

            }

            

            content.add(rootEntity)

        }

    }

}

#Preview(immersionStyle: .mixed) {

    ImmersiveView()

        .environment(AppModel())

}
