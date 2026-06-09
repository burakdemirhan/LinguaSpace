//
//  PlacedObject.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

import simd

struct PlacedObject: Identifiable, Codable {

    let id: UUID

    let vocabularyItem: VocabularyItem

    let position: SIMD3<Float>

    

    init(

        id: UUID = UUID(),

        vocabularyItem: VocabularyItem,

        position: SIMD3<Float>

    ) {

        self.id = id

        self.vocabularyItem = vocabularyItem

        self.position = position

    }

}
