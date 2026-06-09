//
//  AppModel.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import SwiftUI

/// Maintains app-wide state.
@MainActor
@Observable
final class AppModel {
    
    let immersiveSpaceID = "ImmersiveSpace"
    
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    
    enum SetupStep {
        case objectSelection
        case scenarioSelection
    }
    
    var immersiveSpaceState: ImmersiveSpaceState = .closed
    var setupStep: SetupStep = .objectSelection
    var isGeneratingVocabulary: Bool = false

    var generationErrorMessage: String?
    
    // MARK: - Object Selection
    
    var selectedObjects: [RoomObject] = []
    
    func toggleObjectSelection(_ object: RoomObject) {
        if selectedObjects.contains(object) {
            selectedObjects.removeAll { $0 == object }
        } else {
            selectedObjects.append(object)
        }
    }
    
    func isObjectSelected(_ object: RoomObject) -> Bool {
        selectedObjects.contains(object)
    }
    
    var canContinueFromObjectSelection: Bool {
        !selectedObjects.isEmpty
    }
    
    func moveToScenarioSelection() {
        setupStep = .scenarioSelection
    }
    
    func moveToObjectSelection() {
        setupStep = .objectSelection
    }
    
    // MARK: - Scenario Selection
    
    var selectedScenario: Scenario = .home
    
    func selectScenario(_ scenario: Scenario) {
        selectedScenario = scenario
    }
    
    // MARK: - Generated Vocabulary
    
    var generatedVocabularyItems: [VocabularyItem] = []
    
    func generateVocabularyWithFallback() {
        let service = VocabularyMappingService()
        
        generatedVocabularyItems = selectedObjects.map { object in
            service.vocabularyItem(
                for: object,
                scenario: selectedScenario
            )
        }
    }
    
    func resetSetup() {

        selectedObjects.removeAll()

        generatedVocabularyItems.removeAll()

        selectedScenario = .home

        setupStep = .objectSelection

    }
    
    func generateVocabulary() async {

        isGeneratingVocabulary = true

        generationErrorMessage = nil

        

        do {

            let service = VocabularyGenerationService()

            

            generatedVocabularyItems = try await service.generateVocabulary(

                objects: selectedObjects,

                scenario: selectedScenario

            )

        } catch {

            generationErrorMessage = error.localizedDescription

            generateVocabularyWithFallback()

        }

        

        isGeneratingVocabulary = false

    }
}
