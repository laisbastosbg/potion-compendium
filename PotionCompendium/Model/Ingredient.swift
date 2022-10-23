//
//  Ingredient.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation

struct Ingredient: Codable {
    let id: String?
    let name: String?
}

extension Ingredient {
    static var mockedData = [
        Ingredient(id: "00eee42e-999c-43ef-bb8d-3f1012275680", name: "Newt spleens"),
        Ingredient(id: "0125a601-3cd4-4027-a107-7bbbb420762a", name: "Stewed Mandrake"),
        Ingredient(id: "012ce0a0-5be7-41cf-9003-bb4ca97eb97b", name: "Frog parts"),
        Ingredient(id: "01a18a92-c82d-4b41-931d-1755f58dee32", name: "Granian hair"),
        Ingredient(id: "01c08cd0-cd5d-44ae-a7a4-549e4fd56773", name: "Peacock feathers")
    ]
}
