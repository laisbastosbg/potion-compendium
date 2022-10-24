//
//  IngredientViewModel.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation

class IngredientViewModel: ObservableObject {
    private var apiManager: APIManager?
    @Published var ingredients: [Ingredient] = []

    init() {
        self.apiManager = APIManager()
    }

    func fetchRandomXIngredients(percentage: Float) {
        apiManager?.getIngredients(succesHandler: { [weak self] (ingredients) in

            var arraySize = 0
            if percentage <= 25 {
                arraySize = 15
            } else if percentage > 25 && percentage <= 50 {
                arraySize = 30
            } else if percentage > 50 && percentage <= 75 {
                arraySize = 45
            } else {
                arraySize = 60
            }

//            let arraySize = Int(totalSize*Int(percentage)/100)
            let shuffledArray = ingredients.shuffled()
            let slicedArray = shuffledArray[0..<arraySize]
            self?.ingredients = slicedArray.sorted { $0.name! < $1.name! }
        }, errorHandler: { (error) in
            print("Error: \(error)")
        })
    }
}
