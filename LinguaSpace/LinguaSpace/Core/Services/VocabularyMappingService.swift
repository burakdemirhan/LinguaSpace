//
//  VocabularyMappingService.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

struct VocabularyMappingService {
    
    func vocabularyItem(
        for roomObject: RoomObject,
        scenario: Scenario
    ) -> VocabularyItem {
        switch scenario {
        case .home:
            return homeVocabulary(for: roomObject)
        case .cafe:
            return cafeVocabulary(for: roomObject)
        case .market:
            return marketVocabulary(for: roomObject)
        case .library:
            return libraryVocabulary(for: roomObject)
        }
    }
    
    private func homeVocabulary(for object: RoomObject) -> VocabularyItem {
        switch object.name {
        case "Table":
            return VocabularyItem(objectName: "Table", translatedWord: "Tavolo", exampleSentence: "Il tavolo è vicino alla finestra.")
        case "Chair":
            return VocabularyItem(objectName: "Chair", translatedWord: "Sedia", exampleSentence: "La sedia è comoda.")
        case "Door":
            return VocabularyItem(objectName: "Door", translatedWord: "Porta", exampleSentence: "La porta è aperta.")
        case "Window":
            return VocabularyItem(objectName: "Window", translatedWord: "Finestra", exampleSentence: "La finestra è luminosa.")
        case "Lamp":
            return VocabularyItem(objectName: "Lamp", translatedWord: "Lampada", exampleSentence: "La lampada è accesa.")
        case "Book":
            return VocabularyItem(objectName: "Book", translatedWord: "Libro", exampleSentence: "Il libro è sul tavolo.")
        case "Cup":
            return VocabularyItem(objectName: "Cup", translatedWord: "Tazza", exampleSentence: "La tazza è piena.")
        case "Sofa":
            return VocabularyItem(objectName: "Sofa", translatedWord: "Divano", exampleSentence: "Il divano è grande.")
        case "Plant":
            return VocabularyItem(objectName: "Plant", translatedWord: "Pianta", exampleSentence: "La pianta è verde.")
        default:
            return fallbackVocabulary(for: object)
        }
    }
    
    private func cafeVocabulary(for object: RoomObject) -> VocabularyItem {
        switch object.name {
        case "Table":
            return VocabularyItem(objectName: "Table", translatedWord: "Tavolino", exampleSentence: "Il tavolino è riservato.")
        case "Chair":
            return VocabularyItem(objectName: "Chair", translatedWord: "Sedia", exampleSentence: "La sedia è vicino al bancone.")
        case "Door":
            return VocabularyItem(objectName: "Door", translatedWord: "Ingresso", exampleSentence: "L'ingresso del caffè è aperto.")
        case "Window":
            return VocabularyItem(objectName: "Window", translatedWord: "Vetrina", exampleSentence: "La vetrina mostra i dolci.")
        case "Lamp":
            return VocabularyItem(objectName: "Lamp", translatedWord: "Luce", exampleSentence: "La luce crea un'atmosfera calda.")
        case "Book":
            return VocabularyItem(objectName: "Book", translatedWord: "Menù", exampleSentence: "Il menù è sul tavolino.")
        case "Cup":
            return VocabularyItem(objectName: "Cup", translatedWord: "Tazzina", exampleSentence: "La tazzina è per l'espresso.")
        case "Sofa":
            return VocabularyItem(objectName: "Sofa", translatedWord: "Divanetto", exampleSentence: "Il divanetto è nell'angolo.")
        case "Plant":
            return VocabularyItem(objectName: "Plant", translatedWord: "Decorazione", exampleSentence: "La decorazione rende il caffè accogliente.")
        default:
            return fallbackVocabulary(for: object)
        }
    }
    
    private func marketVocabulary(for object: RoomObject) -> VocabularyItem {
        switch object.name {
        case "Table":
            return VocabularyItem(objectName: "Table", translatedWord: "Banco", exampleSentence: "Il banco espone la frutta.")
        case "Chair":
            return VocabularyItem(objectName: "Chair", translatedWord: "Postazione", exampleSentence: "La postazione del venditore è occupata.")
        case "Door":
            return VocabularyItem(objectName: "Door", translatedWord: "Entrata", exampleSentence: "L'entrata del mercato è affollata.")
        case "Window":
            return VocabularyItem(objectName: "Window", translatedWord: "Vetrina", exampleSentence: "La vetrina mostra le offerte.")
        case "Lamp":
            return VocabularyItem(objectName: "Lamp", translatedWord: "Illuminazione", exampleSentence: "L'illuminazione rende visibili i prodotti.")
        case "Book":
            return VocabularyItem(objectName: "Book", translatedWord: "Listino", exampleSentence: "Il listino mostra i prezzi.")
        case "Cup":
            return VocabularyItem(objectName: "Cup", translatedWord: "Contenitore", exampleSentence: "Il contenitore è sul banco.")
        case "Sofa":
            return VocabularyItem(objectName: "Sofa", translatedWord: "Area di attesa", exampleSentence: "L'area di attesa è vicino all'entrata.")
        case "Plant":
            return VocabularyItem(objectName: "Plant", translatedWord: "Erbe", exampleSentence: "Le erbe sono fresche.")
        default:
            return fallbackVocabulary(for: object)
        }
    }
    
    private func libraryVocabulary(for object: RoomObject) -> VocabularyItem {
        switch object.name {
        case "Table":
            return VocabularyItem(objectName: "Table", translatedWord: "Scrivania", exampleSentence: "La scrivania è silenziosa.")
        case "Chair":
            return VocabularyItem(objectName: "Chair", translatedWord: "Sedia", exampleSentence: "La sedia è nella sala lettura.")
        case "Door":
            return VocabularyItem(objectName: "Door", translatedWord: "Accesso", exampleSentence: "L'accesso alla biblioteca è libero.")
        case "Window":
            return VocabularyItem(objectName: "Window", translatedWord: "Finestra", exampleSentence: "La finestra illumina la sala.")
        case "Lamp":
            return VocabularyItem(objectName: "Lamp", translatedWord: "Lampada da studio", exampleSentence: "La lampada da studio è accesa.")
        case "Book":
            return VocabularyItem(objectName: "Book", translatedWord: "Volume", exampleSentence: "Il volume è sullo scaffale.")
        case "Cup":
            return VocabularyItem(objectName: "Cup", translatedWord: "Borraccia", exampleSentence: "La borraccia è sulla scrivania.")
        case "Sofa":
            return VocabularyItem(objectName: "Sofa", translatedWord: "Area lettura", exampleSentence: "L'area lettura è tranquilla.")
        case "Plant":
            return VocabularyItem(objectName: "Plant", translatedWord: "Pianta", exampleSentence: "La pianta è vicino alla finestra.")
        default:
            return fallbackVocabulary(for: object)
        }
    }
    
    private func fallbackVocabulary(for object: RoomObject) -> VocabularyItem {
        VocabularyItem(
            objectName: object.name,
            translatedWord: object.name,
            exampleSentence: "Example sentence unavailable."
        )
    }
}
