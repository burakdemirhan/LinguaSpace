//
//  RoomObject.swift
//  LinguaSpace
//
//  Created by Burak Demirhan on 08/06/26.
//

import Foundation

struct RoomObject: Identifiable, Hashable, Codable {

    let id: UUID

    let name: String

    

    init(

        id: UUID = UUID(),

        name: String

    ) {

        self.id = id

        self.name = name

    }

}


extension RoomObject {

    static let availableObjects: [RoomObject] = [

        RoomObject(name: "Table"),

        RoomObject(name: "Chair"),

        RoomObject(name: "Door"),

        RoomObject(name: "Window"),

        RoomObject(name: "Lamp"),

        RoomObject(name: "Book"),

        RoomObject(name: "Cup"),

        RoomObject(name: "Sofa"),

        RoomObject(name: "Plant")

    ]

}
