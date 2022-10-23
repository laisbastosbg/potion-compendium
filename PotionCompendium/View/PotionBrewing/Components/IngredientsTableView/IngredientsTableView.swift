//
//  IngredientsTableView.swift
//  PotionCompendium
//
//  Created by Lais Godinho on 22/10/22.
//

import UIKit

class IngredientsTableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.register(
            IngredientsTableViewCell.self,
            forCellReuseIdentifier: IngredientsTableViewCell.identifier)
        self.translatesAutoresizingMaskIntoConstraints = false
//        self.backgroundColor = .systemMint
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init() {
        let style = UITableView.Style.plain

        let frame = CGRect()
        self.init(frame: frame, style: style)
    }
}
