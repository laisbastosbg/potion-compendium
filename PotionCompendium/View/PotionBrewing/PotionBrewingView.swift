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

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(backgroundImage)
//        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor)])
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
