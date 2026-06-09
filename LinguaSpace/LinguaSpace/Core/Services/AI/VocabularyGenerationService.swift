//
//  VocabularyGenerationService.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 09/06/26.
//

import Foundation

struct VocabularyGenerationService {

    

    func generateVocabulary(

        objects: [RoomObject],

        scenario: Scenario

    ) async throws -> [VocabularyItem] {

        

        let service = OpenAIVocabularyGenerationService()

        

        return try await service.generateVocabulary(

            objects: objects,

            scenario: scenario

        )

    }

}
