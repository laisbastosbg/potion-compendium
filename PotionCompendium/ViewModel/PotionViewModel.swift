//
//  PotionViewModel.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation
import Combine

class PotionViewModel: ObservableObject {
    private var apiManager: APIManager?
    @Published var potions: [Potion] = []
    @Published var potion: Potion?

    init() {
        self.apiManager = APIManager()
    }

    func fetchPotions() {
        apiManager?.getPotions(succesHandler: { [weak self] (potions) in
            self?.potions = potions
        }, errorHandler: { (error) in
            print("Error: \(error)")
        })
    }

    func fetchPotionsAndVerifyIngredients(ingredients: [Ingredient]) {
        apiManager?.getPotions(succesHandler: { [weak self] (potions) in
            let sortedIngredients1 = ingredients.sorted { $0.id! < $1.id! }

            for potion in potions {
                let sortedIngredients2 = potion.ingredients.sorted { $0.id! < $1.id! }
                if sortedIngredients1 == sortedIngredients2 {
                    self?.potion = potion
                    return
                }
            }

            self?.potion = nil
        }, errorHandler: { (error) in
            print("Error: \(error)")
        })

    }
}
