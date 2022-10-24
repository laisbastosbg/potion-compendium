//
//  BrewButton.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 23/10/22.
//

import UIKit

class BrewButton: UIButton {

    required override init(frame: CGRect) {
        super.init(frame: frame)

        self.configuration = .filled()
        self.setTitle("Brew", for: .normal)
        self.tintColor = UIColor(named: "border")
        self.setTitleColor(.white, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
