//
//  VocabularyItem.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

struct VocabularyItem: Identifiable, Hashable, Codable {

    let id: UUID

    let objectName: String

    let translatedWord: String

    let exampleSentence: String

    

    init(

        id: UUID = UUID(),

        objectName: String,

        translatedWord: String,

        exampleSentence: String

    ) {

        self.id = id

        self.objectName = objectName

        self.translatedWord = translatedWord

        self.exampleSentence = exampleSentence

    }

}
