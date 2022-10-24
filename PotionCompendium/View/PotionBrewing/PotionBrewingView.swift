//
//  PotionBrewingView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 17/10/22.
//

import UIKit
import Lottie

class PotionBrewingView: UIView {

    let backgroundView = BackgroundView()

    let appUI = AppUI.shared
    let cauldronAnimation = CauldronAnimation(frame: CGRect())
    var tableView = IngredientsTableView()
    var brewButton = BrewButton(frame: CGRect(x: 0, y: 0, width: 50, height: 40))

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundView.image = UIImage(named: "laboratory")
        self.addSubview(backgroundView)

        self.addSubview(cauldronAnimation)
        self.addSubview(appUI)
        self.addSubview(tableView)
        self.addSubview(brewButton)

        self.brewButton.addTarget(self, action: #selector(brewPotion), for: .touchUpInside)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            tableView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 2.5),

            brewButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 8),
            brewButton.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            brewButton.widthAnchor.constraint(equalToConstant: 80),
            brewButton.heightAnchor.constraint(equalToConstant: 40),

            cauldronAnimation.topAnchor.constraint(equalTo: brewButton.bottomAnchor),
            cauldronAnimation.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cauldronAnimation.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cauldronAnimation.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    @objc
    func brewPotion() {
        self.cauldronAnimation.animationView.animationSpeed = 0.75
            self.cauldronAnimation.animationView.play(
                fromFrame: AnimationFrameTime(5),
                toFrame: AnimationFrameTime(125),
                loopMode: .loop)
    }
}
