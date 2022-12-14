//
//  BackgroundView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit

class BackgroundView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
}
