//
//  StartingMessage.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 20/10/22.
//

import UIKit

class StartingMessageView: UIStackView {
    let messageText: UILabel = {
        let label = UILabel()
        label.text = "Drag the basket to collect the ingredients as they fall"
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 10
        return label
    }()

    lazy var startButton: UIButton = {
        let button = UIButton()
        button.configuration = .filled()
        button.setTitle("Start", for: .normal)
        button.tintColor = .systemPink
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .largeTitle)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(startGathering), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemTeal.withAlphaComponent(0.75)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 1

        self.axis = .vertical
        self.distribution = .fill
        self.alignment = .center
        self.layoutMargins = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        self.isLayoutMarginsRelativeArrangement = true
        self.addArrangedSubview(messageText)
        self.addArrangedSubview(startButton)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
