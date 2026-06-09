//
//  VocabularyMappingService.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

struct VocabularyMappingService {

    

    func vocabularyItem(for roomObject: RoomObject) -> VocabularyItem {

        switch roomObject.name {

        case "Table":

            return VocabularyItem(

                objectName: "Table",

                translatedWord: "Tavolo",

                exampleSentence: "Il tavolo è vicino alla finestra."

            )

            

        case "Chair":

            return VocabularyItem(

                objectName: "Chair",

                translatedWord: "Sedia",

                exampleSentence: "La sedia è comoda."

            )

            

        case "Door":

            return VocabularyItem(

                objectName: "Door",

                translatedWord: "Porta",

                exampleSentence: "La porta è aperta."

            )

            

        case "Window":

            return VocabularyItem(

                objectName: "Window",

                translatedWord: "Finestra",

                exampleSentence: "La finestra è luminosa."

            )

            

        case "Lamp":

            return VocabularyItem(

                objectName: "Lamp",

                translatedWord: "Lampada",

                exampleSentence: "La lampada è sul tavolo."

            )

            

        case "Book":

            return VocabularyItem(

                objectName: "Book",

                translatedWord: "Libro",

                exampleSentence: "Il libro è interessante."

            )

            

        case "Cup":

            return VocabularyItem(

                objectName: "Cup",

                translatedWord: "Tazza",

                exampleSentence: "La tazza è piena."

            )

            

        case "Sofa":

            return VocabularyItem(

                objectName: "Sofa",

                translatedWord: "Divano",

                exampleSentence: "Il divano è grande."

            )

            

        case "Plant":

            return VocabularyItem(

                objectName: "Plant",

                translatedWord: "Pianta",

                exampleSentence: "La pianta è verde."

            )

            

        default:

            return VocabularyItem(

                objectName: roomObject.name,

                translatedWord: roomObject.name,

                exampleSentence: "Example sentence unavailable."

            )

        }

    }

}
