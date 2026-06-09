//
//  ImmersiveView.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//
import SwiftUI
import RealityKit

struct ImmersiveView: View {
    
    @Environment(AppModel.self) private var appModel
    @Environment(\.dismissImmersiveSpace)

    private var dismissImmersiveSpace
    
    var body: some View {
        RealityView { content in
            content.add(makeRootEntity())
        } update: { content in
            content.entities.removeAll()
            content.add(makeRootEntity())
        }
    }
    
    private func makeRootEntity() -> Entity {

        let rootEntity = Entity()

        

        for (index, vocabularyItem) in appModel.generatedVocabularyItems.enumerated() {

            let position = SIMD3<Float>(

                -0.7 + Float(index % 3) * 0.7,

                2.0 - Float(index / 3) * 0.32,

                -1.8

            )

            

            let labelEntity = makeVocabularyLabelEntity(

                vocabularyItem: vocabularyItem,

                position: position

            )

            

            rootEntity.addChild(labelEntity)

        }

        

        return rootEntity

    }
    
    private func makeVocabularyLabelEntity(
        vocabularyItem: VocabularyItem,
        position: SIMD3<Float>
    ) -> Entity {
        let container = Entity()
        container.position = position
        
        let backgroundMesh = MeshResource.generatePlane(
            width: 0.60,
            height: 0.26
        )
        
        let backgroundMaterial = SimpleMaterial(

            color: .black.withAlphaComponent(0.85),

            roughness: 0.9,

            isMetallic: false

        )
        
        let backgroundEntity = ModelEntity(
            mesh: backgroundMesh,
            materials: [backgroundMaterial]
        )
        backgroundEntity.position = SIMD3<Float>(0, 0, -0.01)
        
        let translatedWordEntity = makeTextEntity(
            text: vocabularyItem.translatedWord,
            fontSize: 0.065
        )
        translatedWordEntity.position = SIMD3<Float>(0, 0.035, 0)
        
        let originalWordEntity = makeTextEntity(
            text: vocabularyItem.objectName.uppercased(),
            fontSize: 0.018
        )
        originalWordEntity.position = SIMD3<Float>(0, -0.04, 0)
        
        container.addChild(backgroundEntity)
        container.addChild(translatedWordEntity)
        container.addChild(originalWordEntity)
        
        return container
    }
    
    private func makeTextEntity(
        text: String,
        fontSize: CGFloat
    ) -> ModelEntity {
        let mesh = MeshResource.generateText(
            text,
            extrusionDepth: 0.003,
            font: .systemFont(ofSize: fontSize, weight: .semibold),
            containerFrame: CGRect(
                x: -0.22,
                y: -0.05,
                width: 0.44,
                height: 0.1
            ),
            alignment: .center,
            lineBreakMode: .byTruncatingTail
        )
        
        let material = SimpleMaterial(
            color: .white,
            roughness: 0.4,
            isMetallic: false
        )
        
        return ModelEntity(mesh: mesh, materials: [material])
    }
}

#Preview(immersionStyle: .mixed) {
    ImmersiveView()
        .environment(AppModel())
}
