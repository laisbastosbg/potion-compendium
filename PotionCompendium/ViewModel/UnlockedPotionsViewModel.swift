//
//  UnlockedPotionsViewModel.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import Foundation
import Combine

class UnlockedPotionsViewModel: ObservableObject {
    private var apiManager: APIManager?
    @Published var potions: [Potion] = Potion.mockedData

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
}
