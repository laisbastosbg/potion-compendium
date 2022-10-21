//
//  ingredientIcon.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 19/10/22.
//

import UIKit

class IngredientIcon: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.image = UIImage(named: "ingredient-1")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
