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

    

    var immersiveSpaceState: ImmersiveSpaceState = .closed

    

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

    

    var canContinue: Bool {

        !selectedObjects.isEmpty

    }

}
