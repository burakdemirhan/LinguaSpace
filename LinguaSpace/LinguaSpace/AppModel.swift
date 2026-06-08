//
//  AppModel.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }
    var immersiveSpaceState = ImmersiveSpaceState.closed
    var selectedObjects: [RoomObject] = []
}
