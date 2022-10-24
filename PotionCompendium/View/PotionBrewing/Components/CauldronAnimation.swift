//
//  CauldronAnimation.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit
import Lottie

class CauldronAnimation: UIView {
    var animationView: LottieAnimationView = {
        var animationView = LottieAnimationView()

        animationView = .init(name: "cauldron")
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .autoReverse
        animationView.animationSpeed = 0.25
        animationView.play(
            fromFrame: AnimationFrameTime(0),
            toFrame: AnimationFrameTime(5))
        animationView.translatesAutoresizingMaskIntoConstraints = false
        return animationView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(animationView)
        setConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: CGRect())
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(equalTo: self.topAnchor),
            animationView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            animationView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            animationView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            animationView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            animationView.widthAnchor.constraint(equalTo: self.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }

}
