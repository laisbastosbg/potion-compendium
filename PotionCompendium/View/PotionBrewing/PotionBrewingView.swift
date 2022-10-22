//
//  PotionBrewingView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit

class PotionBrewingView: UIView {
    let collectedIngredientsPercentage = 0

    let backgroundImage: BackgroundImage = {
        let imageView = BackgroundImage()
        imageView.image = UIImage(named: "laboratory")
        return imageView
    }()

    let appUI = AppUI.shared

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(backgroundImage)
        self.addSubview(appUI)
//        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([])
    }
}
