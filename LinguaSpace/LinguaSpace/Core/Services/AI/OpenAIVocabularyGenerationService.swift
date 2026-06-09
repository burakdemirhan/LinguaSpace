//
//  OpenAIVocabularyGenerationService.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 09/06/26.
//

import Foundation

struct OpenAIVocabularyGenerationService {
    
    func generateVocabulary(
        objects: [RoomObject],
        scenario: Scenario
    ) async throws -> [VocabularyItem] {
        
        guard let apiKey = Bundle.main.object(
            forInfoDictionaryKey: "OPENAI_API_KEY"
        ) as? String else {
            throw URLError(.userAuthenticationRequired)
        }
        
        let objectNames = objects.map(\.name).joined(separator: ", ")
        
        let prompt = """
        Generate contextual Italian vocabulary for a spatial language learning app.
        
        Objects in the user's room:
        \(objectNames)
        
        Scenario:
        \(scenario.title)
        
        Return ONLY valid JSON in this exact format:
        {
          "items": [
            {
              "objectName": "Table",
              "translatedWord": "Bancone",
              "exampleSentence": "Il bancone è vicino alla porta."
            }
          ]
        }
        
        Rules:
        - Return one item for each object.
        - objectName must exactly match the original English object name.
        - translatedWord must be Italian.
        - exampleSentence must be short, natural Italian.
        - Adapt the vocabulary to the selected scenario.
        """
        
        let requestBody: [String: Any] = [
            "model": "gpt-4.1-mini",
            "input": prompt
        ]
        
        let url = URL(string: "https://api.openai.com/v1/responses")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "Bearer \(apiKey)",
            forHTTPHeaderField: "Authorization"
        )
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        request.httpBody = try JSONSerialization.data(
            withJSONObject: requestBody
        )
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let response = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        let jsonText = response.outputText
        
        guard let jsonData = jsonText.data(using: .utf8) else {
            throw URLError(.cannotDecodeContentData)
        }
        
        let decoded = try JSONDecoder().decode(
            GeneratedVocabularyResponse.self,
            from: jsonData
        )
        
        return decoded.items
    }
}
