//
//  ObjectSelectionViewModel.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

import Observation

@Observable

final class ObjectSelectionViewModel {

    private(set) var availableObjects: [RoomObject] =

        RoomObject.availableObjects

    var selectedObjects: Set<RoomObject> = []

    func toggleSelection(for object: RoomObject) {

        if selectedObjects.contains(object) {

            selectedObjects.remove(object)

        } else {

            selectedObjects.insert(object)

        }

    }

    func isSelected(_ object: RoomObject) -> Bool {

        selectedObjects.contains(object)

    }

    var canContinue: Bool {

        !selectedObjects.isEmpty

    }

}
