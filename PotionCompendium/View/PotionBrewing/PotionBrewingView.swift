//
//  PotionBrewingView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit

class PotionBrewingView: UIView {
    let collectedIngredientsPercentage = 0

    let backgroundView = BackgroundView()

    let appUI = AppUI.shared
    let cauldronAnimation = CauldronAnimation(frame: CGRect())
    var tableView = IngredientsTableView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundView.image = UIImage(named: "laboratory")
        self.addSubview(backgroundView)

        self.addSubview(tableView)
        self.addSubview(cauldronAnimation)
        self.addSubview(appUI)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5),

            cauldronAnimation.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            cauldronAnimation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cauldronAnimation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cauldronAnimation.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
