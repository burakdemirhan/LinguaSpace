//
//  Scenario.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 09/06/26.
//

import Foundation

enum Scenario: String, CaseIterable, Identifiable, Codable {

    

    case home

    case cafe

    case market

    case library

    

    var id: String {

        rawValue

    }

    

    var title: String {

        switch self {

        case .home:

            return "Home"

        case .cafe:

            return "Italian Café"

        case .market:

            return "Market"

        case .library:

            return "Library"

        }

    }

    

    var description: String {

        switch self {

        case .home:

            return "Everyday vocabulary for objects in your room."

        case .cafe:

            return "Contextual words for ordering, sitting, and moving inside a café."

        case .market:

            return "Vocabulary for buying, selling, and navigating a market."

        case .library:

            return "Words related to studying, reading, and quiet spaces."

        }

    }

}
