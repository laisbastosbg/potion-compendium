//
//  ProgressBar.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 20/10/22.
//

import UIKit

class ProgressBar: UIView {
    let progressMade: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "fill")
        view.layer.cornerRadius = 4
        return view
    }()

    var progressMadeHeightConstraint: NSLayoutConstraint!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "background")
        self.layer.borderColor = UIColor(named: "border")?.cgColor
        self.layer.borderWidth = 4
        self.layer.cornerRadius = 4
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(progressMade)
        progressMadeHeightConstraint = NSLayoutConstraint(
            item: progressMade,
            attribute: .height,
            relatedBy: .equal,
            toItem: self,
            attribute: .height,
            multiplier: 0,
            constant: 0)
        setConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 200),
            self.widthAnchor.constraint(equalToConstant: 36),
            self.progressMadeHeightConstraint,
            self.progressMade.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            self.progressMade.topAnchor.constraint(equalTo: self.topAnchor),
            self.progressMade.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.progressMade.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
