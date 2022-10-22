//
//  BackgroundImage.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit

class BackgroundImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        super.init(frame: UIScreen.main.bounds)

        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
