//
//  ClockView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 21/10/22.
//

import UIKit

class ClockView: UIView {
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "clock")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let label: UILabel = {
        let label = UILabel()
        label.text = "0:00"
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .footnote)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    required override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.opacity = 0.75
        self.addSubview(image)
        self.addSubview((label))
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            image.widthAnchor.constraint(equalTo: self.widthAnchor),
            image.heightAnchor.constraint(equalTo: self.heightAnchor),

            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
