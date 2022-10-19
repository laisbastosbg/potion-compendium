//
//  Potion.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation

struct Potion: Codable {
    let id: String?
    let name: String?
    let effect: String?
    let sideEffects: String?
    let characteristics: String?
    let time: String?
    let difficulty: String?
    let ingredients: [Ingredient]
}

extension Potion {
    static var mockedData = [
        Potion(
            id: "0f2654fc-4856-4804-89b7-3e9fdc46b367",
            name: "Strength Potion",
            effect: "Superhuman strength",
            sideEffects: nil,
            characteristics: "Orange in colour",
            time: nil,
            difficulty: "Beginner",
            ingredients: [
                Ingredient(id: "17b5e964-438a-4526-b307-c149dc5e4a73", name: "Fanged Geranium"),
                Ingredient(id: "a2c2d720-4cce-4003-9c12-6d7cee1fa71b", name: "Arm bone"),
                Ingredient(id: "f8884a69-b332-40d2-9ac8-b38cc3a52aec", name: "Snake fangs")
        ])
    ]
}
